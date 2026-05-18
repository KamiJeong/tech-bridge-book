#!/usr/bin/env bash
set -euo pipefail

limit="${1:-3}"

case "$limit" in
  ''|*[!0-9]*)
    echo "limit must be a positive integer" >&2
    exit 2
    ;;
esac

if [ "$limit" -gt 3 ]; then
  limit=3
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI 'gh' is not installed or not on PATH" >&2
  exit 127
fi

gh issue list \
  --search '$speckit-auto in:title,body,comments state:open' \
  --limit "$limit" \
  --json number,title,labels,url,updatedAt
