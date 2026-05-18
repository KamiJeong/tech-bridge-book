#!/usr/bin/env bash
set -euo pipefail

RUN_LABEL=""
PHASE=""
SLICE_ID="s01"
COMMAND_NAME=""
AGENT_NAME=""
MODEL="unknown"
CAPTURE_METHOD="estimated"
INPUT_TOKENS=""
OUTPUT_TOKENS=""
TOTAL_TOKENS=""
EST_INPUT=""
EST_OUTPUT=""
EST_TOTAL=""
NOTES=""
QUALITY_NOTES=""
ARTIFACTS=()

usage() {
  cat <<'USAGE'
Usage: record-token-step.sh --run-label LABEL --phase PHASE [options]

Options:
  --slice-id ID
  --command NAME
  --agent NAME
  --model NAME
  --capture-method exact|parsed|estimated|unavailable
  --input N
  --output N
  --total N
  --estimated-input N
  --estimated-output N
  --estimated-total N
  --artifact PATH
  --quality-notes TEXT
  --notes TEXT
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-label) RUN_LABEL="$2"; shift 2 ;;
    --phase) PHASE="$2"; shift 2 ;;
    --slice-id) SLICE_ID="$2"; shift 2 ;;
    --command) COMMAND_NAME="$2"; shift 2 ;;
    --agent) AGENT_NAME="$2"; shift 2 ;;
    --model) MODEL="$2"; shift 2 ;;
    --capture-method) CAPTURE_METHOD="$2"; shift 2 ;;
    --input) INPUT_TOKENS="$2"; shift 2 ;;
    --output) OUTPUT_TOKENS="$2"; shift 2 ;;
    --total) TOTAL_TOKENS="$2"; shift 2 ;;
    --estimated-input) EST_INPUT="$2"; shift 2 ;;
    --estimated-output) EST_OUTPUT="$2"; shift 2 ;;
    --estimated-total) EST_TOTAL="$2"; shift 2 ;;
    --artifact) ARTIFACTS+=("$2"); shift 2 ;;
    --quality-notes) QUALITY_NOTES="$2"; shift 2 ;;
    --notes) NOTES="$2"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

if [[ -z "$RUN_LABEL" || -z "$PHASE" ]]; then
  echo "Error: --run-label and --phase are required" >&2
  exit 2
fi

case "$CAPTURE_METHOD" in
  exact|parsed|estimated|unavailable) ;;
  *) echo "Error: invalid capture method: $CAPTURE_METHOD" >&2; exit 2 ;;
esac

if [[ -z "$TOTAL_TOKENS" && -n "$INPUT_TOKENS" && -n "$OUTPUT_TOKENS" ]]; then
  TOTAL_TOKENS=$((INPUT_TOKENS + OUTPUT_TOKENS))
fi
if [[ -z "$EST_TOTAL" && -n "$EST_INPUT" && -n "$EST_OUTPUT" ]]; then
  EST_TOTAL=$((EST_INPUT + EST_OUTPUT))
fi

out_dir=".specify/token-analysis/runs/${RUN_LABEL}/steps"
mkdir -p "$out_dir"
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
out_file="${out_dir}/${PHASE}.json"

if command -v jq >/dev/null 2>&1; then
  artifacts_json=$(printf '%s\n' "${ARTIFACTS[@]}" | jq -R . | jq -s .)
  jq -n \
    --arg phase "$PHASE" \
    --arg command "$COMMAND_NAME" \
    --arg agent "$AGENT_NAME" \
    --arg run_label "$RUN_LABEL" \
    --arg slice_id "$SLICE_ID" \
    --arg timestamp "$timestamp" \
    --arg model "$MODEL" \
    --arg capture_method "$CAPTURE_METHOD" \
    --arg quality_notes "$QUALITY_NOTES" \
    --arg notes "$NOTES" \
    --argjson input_tokens "${INPUT_TOKENS:-null}" \
    --argjson output_tokens "${OUTPUT_TOKENS:-null}" \
    --argjson total_tokens "${TOTAL_TOKENS:-null}" \
    --argjson est_input "${EST_INPUT:-null}" \
    --argjson est_output "${EST_OUTPUT:-null}" \
    --argjson est_total "${EST_TOTAL:-null}" \
    --argjson artifact_paths "$artifacts_json" \
    '{
      phase: $phase,
      command: (if $command == "" then null else $command end),
      agent_name: (if $agent == "" then null else $agent end),
      run_label: $run_label,
      slice_id: $slice_id,
      timestamp: $timestamp,
      model: $model,
      input_tokens: $input_tokens,
      output_tokens: $output_tokens,
      total_tokens: $total_tokens,
      estimated_tokens: {
        input: $est_input,
        output: $est_output,
        total: $est_total
      },
      artifact_paths: $artifact_paths,
      quality_notes: $quality_notes,
      capture_method: $capture_method,
      notes: $notes,
      tokens: {
        input: ($input_tokens // 0),
        output: ($output_tokens // 0),
        total: ($total_tokens // 0),
        cache_read: 0,
        cache_creation: 0
      }
    }' > "$out_file"
else
  cat > "$out_file" <<EOF
{
  "phase": "${PHASE}",
  "command": "${COMMAND_NAME}",
  "agent_name": "${AGENT_NAME}",
  "run_label": "${RUN_LABEL}",
  "slice_id": "${SLICE_ID}",
  "timestamp": "${timestamp}",
  "model": "${MODEL}",
  "input_tokens": null,
  "output_tokens": null,
  "total_tokens": null,
  "estimated_tokens": {"input": ${EST_INPUT:-0}, "output": ${EST_OUTPUT:-0}, "total": ${EST_TOTAL:-0}},
  "artifact_paths": [],
  "quality_notes": "${QUALITY_NOTES}",
  "capture_method": "${CAPTURE_METHOD}",
  "notes": "${NOTES}",
  "tokens": {"input": 0, "output": 0, "total": 0, "cache_read": 0, "cache_creation": 0}
}
EOF
fi

echo "Recorded token step: $out_file"
