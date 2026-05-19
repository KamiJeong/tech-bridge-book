#!/usr/bin/env bash
set -euo pipefail

ALLOW_MISSING_TOKEN_ANALYZER="false"
STACKED_PR="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --allow-missing-token-analyzer) ALLOW_MISSING_TOKEN_ANALYZER="true"; shift ;;
    --stacked-pr) STACKED_PR="true"; shift ;;
    -h|--help) echo "Usage: $0 [--allow-missing-token-analyzer] [--stacked-pr]"; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
done

branch=$(git branch --show-current 2>/dev/null || true)
case "$branch" in
  main|master|develop) echo "FAIL: refusing PR automation from protected branch: $branch" >&2; exit 1 ;;
  "") echo "FAIL: unclear current branch" >&2; exit 1 ;;
esac

if ! command -v gh >/dev/null 2>&1; then
  echo "FAIL: GitHub CLI is not installed" >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "FAIL: GitHub CLI is not authenticated" >&2
  exit 1
fi

if [[ "$STACKED_PR" == "true" ]] && ! gh stack --version >/dev/null 2>&1; then
  echo "FAIL: gh stack extension is not installed or not working" >&2
  echo "Install with: gh extension install github/gh-stack" >&2
  exit 1
fi

mode="auto-pr"
[[ "$STACKED_PR" == "true" ]] && mode="auto-stack-pr"
args=(--mode "$mode")
[[ "$ALLOW_MISSING_TOKEN_ANALYZER" == "true" ]] && args+=(--allow-missing)
.claude/skills/speckit-guards/scripts/guard-token-analyzer-available.sh "${args[@]}"

echo "PASS: PR guard checks passed"
