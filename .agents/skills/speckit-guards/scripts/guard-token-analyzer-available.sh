#!/usr/bin/env bash
set -euo pipefail

MODE="gated"
ALLOW_MISSING="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --mode) MODE="${2:-gated}"; shift 2 ;;
    --allow-missing) ALLOW_MISSING="true"; shift ;;
    -h|--help)
      echo "Usage: $0 [--mode plan-only|gated|auto-implement|auto-pr|auto-stack-pr] [--allow-missing]"
      exit 0
      ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
done

found="false"
reason=""

if [[ -d ".specify/extensions/token-analyzer" ]]; then
  found="true"
  reason=".specify/extensions/token-analyzer/ exists"
elif compgen -G ".specify/extensions/token-analyzer/scripts/*/*token*.sh" >/dev/null; then
  found="true"
  reason="token-analyzer scripts are available"
elif rg -q "token-analyzer" .specify .agents 2>/dev/null; then
  found="true"
  reason="token-analyzer command references are available"
fi

if [[ "$found" == "true" ]]; then
  echo "PASS: token-analyzer available (${reason})"
  exit 0
fi

echo "WARNING: token-analyzer is not available. Install with: specify extension add token-analyzer" >&2

case "$MODE" in
  auto-implement|auto-pr|auto-stack-pr|auto-commit)
    if [[ "$ALLOW_MISSING" == "true" ]]; then
      echo "WARNING: continuing without token-analyzer because explicit approval was provided" >&2
      exit 0
    fi
    echo "FAIL: ${MODE} requires explicit approval before continuing without token-analyzer" >&2
    exit 1
    ;;
  *)
    exit 0
    ;;
esac
