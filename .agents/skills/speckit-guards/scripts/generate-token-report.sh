#!/usr/bin/env bash
set -euo pipefail

RUN_LABEL=""
EPIC_LABEL=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-label) RUN_LABEL="$2"; shift 2 ;;
    --epic-label) EPIC_LABEL="$2"; shift 2 ;;
    -h|--help)
      echo "Usage: $0 --run-label LABEL [--epic-label EPIC]"
      exit 0
      ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
done

if [[ -z "$RUN_LABEL" ]]; then
  echo "Error: --run-label is required" >&2
  exit 2
fi

run_dir=".specify/token-analysis/runs/${RUN_LABEL}"
steps_dir="${run_dir}/steps"
mkdir -p "$steps_dir"
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

if ! command -v jq >/dev/null 2>&1; then
  echo "Error: jq is required to generate token reports" >&2
  exit 1
fi

mapfile -t step_files < <(find "$steps_dir" -maxdepth 1 -type f -name '*.json' | sort)

step_count=${#step_files[@]}
estimated_input=0
estimated_output=0
estimated_total=0
exact_total=0
missing=()
most_phase="unknown"
most_total=-1
steps_json="[]"

for f in "${step_files[@]}"; do
  phase=$(jq -r '.phase // "unknown"' "$f")
  capture=$(jq -r '.capture_method // "unavailable"' "$f")
  ei=$(jq -r '.estimated_tokens.input // 0' "$f")
  eo=$(jq -r '.estimated_tokens.output // 0' "$f")
  et=$(jq -r '.estimated_tokens.total // 0' "$f")
  tt=$(jq -r '.total_tokens // .tokens.total // 0' "$f")
  estimated_input=$((estimated_input + ei))
  estimated_output=$((estimated_output + eo))
  estimated_total=$((estimated_total + et))
  exact_total=$((exact_total + tt))
  compare_total=$et
  if [[ "$compare_total" -eq 0 ]]; then compare_total=$tt; fi
  if [[ "$compare_total" -gt "$most_total" ]]; then
    most_total=$compare_total
    most_phase=$phase
  fi
  if [[ "$capture" == "estimated" || "$capture" == "unavailable" ]]; then
    missing+=("$phase")
  fi
  row=$(jq -n --arg phase "$phase" --arg capture "$capture" --argjson estimated_total "$et" --argjson total "$tt" '{phase:$phase,capture_method:$capture,estimated_total:$estimated_total,total:$total}')
  steps_json=$(jq --argjson row "$row" '. + [$row]' <<<"$steps_json")
done

budget_status="No token budget file found; no budget enforcement applied."
budget_file=".specify/token-analysis/token-budget.json"
if [[ -f "$budget_file" ]]; then
  warn_slice=$(jq -r '.warn_total_tokens_per_slice // empty' "$budget_file")
  block_slice=$(jq -r '.block_total_tokens_per_slice // empty' "$budget_file")
  budget_status="Token budget loaded; no thresholds exceeded."
  if [[ -n "$warn_slice" && "$estimated_total" -gt "$warn_slice" ]]; then
    budget_status="WARNING: estimated total exceeds warn_total_tokens_per_slice (${warn_slice})."
  fi
  if [[ -n "$block_slice" && "$block_slice" != "null" && "$estimated_total" -gt "$block_slice" ]]; then
    budget_status="BLOCK: estimated total exceeds block_total_tokens_per_slice (${block_slice})."
  fi
fi

missing_json=$(printf '%s\n' "${missing[@]}" | jq -R 'select(length > 0)' | jq -s .)
summary_path="${run_dir}/summary.json"
report_path="${run_dir}/report.md"
quality_path="${run_dir}/quality-notes.md"

jq -n \
  --arg run_label "$RUN_LABEL" \
  --arg timestamp "$timestamp" \
  --arg most_phase "$most_phase" \
  --arg budget_status "$budget_status" \
  --argjson step_count "$step_count" \
  --argjson exact_total "$exact_total" \
  --argjson estimated_input "$estimated_input" \
  --argjson estimated_output "$estimated_output" \
  --argjson estimated_total "$estimated_total" \
  --argjson steps "$steps_json" \
  --argjson missing "$missing_json" \
  '{
    run_label: $run_label,
    timestamp: $timestamp,
    step_count: $step_count,
    tokens: {
      total: $exact_total,
      estimated_input: $estimated_input,
      estimated_output: $estimated_output,
      estimated_total: $estimated_total
    },
    most_expensive_phase: $most_phase,
    missing_token_data: $missing,
    budget_status: $budget_status,
    steps: $steps
  }' > "$summary_path"

{
  echo "# Token Analysis Report: ${RUN_LABEL}"
  echo
  echo "Generated: ${timestamp}"
  echo
  echo "## Summary"
  echo
  echo "| Metric | Value |"
  echo "|--------|-------|"
  echo "| Steps captured | ${step_count} |"
  echo "| Exact total tokens | ${exact_total} |"
  echo "| Estimated input tokens | ${estimated_input} |"
  echo "| Estimated output tokens | ${estimated_output} |"
  echo "| Estimated total tokens | ${estimated_total} |"
  echo "| Most expensive phase | ${most_phase} |"
  echo "| Token budget status | ${budget_status} |"
  echo
  echo "## Per-Phase Breakdown"
  echo
  echo "| Phase | Capture method | Estimated total | Exact total |"
  echo "|-------|----------------|-----------------|-------------|"
  for f in "${step_files[@]}"; do
    phase=$(jq -r '.phase // "unknown"' "$f")
    capture=$(jq -r '.capture_method // "unavailable"' "$f")
    et=$(jq -r '.estimated_tokens.total // 0' "$f")
    tt=$(jq -r '.total_tokens // .tokens.total // 0' "$f")
    echo "| ${phase} | ${capture} | ${et} | ${tt} |"
  done
  echo
  echo "## Missing Token Data"
  if [[ "${#missing[@]}" -eq 0 ]]; then
    echo
    echo "- None"
  else
    for phase in "${missing[@]}"; do
      echo "- Exact token data unavailable for ${phase}."
    done
  fi
  echo
  echo "## Recommendations"
  echo
  echo "- Prefer exact or parsed token capture when model usage data is available."
  echo "- Split large epics when independent deliverables, shared contracts, or multiple implementation areas are present."
} > "$report_path"

{
  echo "# Quality Notes: ${RUN_LABEL}"
  echo
  echo "- Generated: ${timestamp}"
  echo "- Steps captured: ${step_count}"
  echo "- Missing exact data phases: ${missing[*]:-none}"
  echo "- Budget status: ${budget_status}"
} > "$quality_path"

if [[ -n "$EPIC_LABEL" ]]; then
  comparisons_dir=".specify/token-analysis/comparisons"
  mkdir -p "$comparisons_dir"
  jq -n --arg epic "$EPIC_LABEL" --arg run_label "$RUN_LABEL" --arg timestamp "$timestamp" '{epic:$epic, generated:$timestamp, included_runs:[$run_label]}' > "${comparisons_dir}/${EPIC_LABEL}.json"
fi

echo "Generated token report: $report_path"
