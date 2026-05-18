#!/usr/bin/env bash
set -euo pipefail

MODE="gated"
RISK="low"
ANALYZE_FILE=""
TEST_STATUS="pass"
ALLOW_MISSING_TOKEN_ANALYZER="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --mode) MODE="$2"; shift 2 ;;
    --risk) RISK="$2"; shift 2 ;;
    --analyze-file) ANALYZE_FILE="$2"; shift 2 ;;
    --test-status) TEST_STATUS="$2"; shift 2 ;;
    --allow-missing-token-analyzer) ALLOW_MISSING_TOKEN_ANALYZER="true"; shift ;;
    -h|--help) echo "Usage: $0 [--mode MODE] [--risk low|medium|high|critical] [--analyze-file PATH]"; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
done

if [[ -n "$ANALYZE_FILE" && -f "$ANALYZE_FILE" ]] && rg -q "CRITICAL" "$ANALYZE_FILE"; then
  echo "FAIL: CRITICAL analyze issue found in $ANALYZE_FILE" >&2
  exit 1
fi

case "$RISK" in
  high|critical) echo "FAIL: ${RISK}-risk slice requires explicit approval before implementation" >&2; exit 1 ;;
esac

if [[ "$TEST_STATUS" != "pass" ]]; then
  echo "FAIL: prerequisite test status is ${TEST_STATUS}" >&2
  exit 1
fi

if [[ "$MODE" == "auto-implement" || "$MODE" == "auto-pr" ]]; then
  args=(--mode "$MODE")
  [[ "$ALLOW_MISSING_TOKEN_ANALYZER" == "true" ]] && args+=(--allow-missing)
  .agents/skills/speckit-guards/scripts/guard-token-analyzer-available.sh "${args[@]}"
fi

echo "PASS: implementation guard checks passed"
