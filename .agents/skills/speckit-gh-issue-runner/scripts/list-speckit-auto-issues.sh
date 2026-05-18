#!/usr/bin/env bash
set -euo pipefail

limit="${1:-3}"
fetch_limit="${SPECKIT_GH_ISSUE_FETCH_LIMIT:-100}"

case "$limit" in
  ''|*[!0-9]*)
    echo "limit must be a positive integer" >&2
    exit 2
    ;;
esac

if [ "$limit" -gt 3 ]; then
  limit=3
fi

case "$fetch_limit" in
  ''|*[!0-9]*)
    echo "SPECKIT_GH_ISSUE_FETCH_LIMIT must be a positive integer" >&2
    exit 2
    ;;
esac

if [ "$fetch_limit" -lt "$limit" ]; then
  fetch_limit="$limit"
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI 'gh' is not installed or not on PATH" >&2
  exit 127
fi

if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required to rank and filter speckit-auto issues" >&2
  exit 127
fi

gh issue list \
  --search '$speckit-auto in:title,body,comments state:open' \
  --limit "$fetch_limit" \
  --json number,title,labels,url,updatedAt \
  --jq "
    def has_label(\$name): any(.labels[].name; . == \$name);
    def excluded_status:
      has_label(\"status:in-progress\") or
      has_label(\"status:blocked\") or
      has_label(\"status:waiting-review\") or
      has_label(\"status:done\") or
      has_label(\"status:failed\");
    def status_rank:
      if has_label(\"status:queued\") then 0 else 1 end;
    def priority_rank:
      if has_label(\"priority:P1\") then 0
      elif has_label(\"priority:P2\") then 1
      elif has_label(\"priority:P3\") then 2
      else 3 end;

    [.[] | select(excluded_status | not)]
    | sort_by(status_rank, priority_rank, .updatedAt)
    | .[:$limit]
  "
