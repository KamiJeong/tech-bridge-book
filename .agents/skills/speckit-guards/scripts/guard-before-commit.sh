#!/usr/bin/env bash
set -euo pipefail

VALIDATION_STATUS="pass"
AUTO_COMMIT="false"
ALLOW_MISSING_TOKEN_ANALYZER="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --validation-status) VALIDATION_STATUS="$2"; shift 2 ;;
    --auto-commit) AUTO_COMMIT="true"; shift ;;
    --allow-missing-token-analyzer) ALLOW_MISSING_TOKEN_ANALYZER="true"; shift ;;
    -h|--help) echo "Usage: $0 [--validation-status pass|fail] [--auto-commit]"; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
done

if [[ "$VALIDATION_STATUS" != "pass" ]]; then
  echo "FAIL: validation has not passed" >&2
  exit 1
fi

if git diff --cached --name-only | rg -q '(^|/)(\.env|.*secret.*|.*key.*|.*token.*)'; then
  echo "FAIL: staged files look like secrets or credentials" >&2
  exit 1
fi

if [[ "$AUTO_COMMIT" == "true" ]]; then
  args=(--mode auto-commit)
  [[ "$ALLOW_MISSING_TOKEN_ANALYZER" == "true" ]] && args+=(--allow-missing)
  .agents/skills/speckit-guards/scripts/guard-token-analyzer-available.sh "${args[@]}"
fi

echo "PASS: commit guard checks passed"
