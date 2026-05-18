#!/usr/bin/env bash
set -euo pipefail

BASE_REF="${1:-HEAD}"
allowed_regex='^(\.codex/|\.agents/|\.specify/token-analysis/|specs/|AGENTS\.md$|\.gitignore$)'

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "PASS: not a git repository; no app-code diff check available"
  exit 0
fi

mapfile -t changed < <(git diff --name-only "$BASE_REF" --)
violations=()
for path in "${changed[@]}"; do
  if [[ ! "$path" =~ $allowed_regex ]]; then
    violations+=("$path")
  fi
done

if [[ "${#violations[@]}" -gt 0 ]]; then
  echo "FAIL: changes outside allowed workflow artifact paths:" >&2
  printf '  %s\n' "${violations[@]}" >&2
  exit 1
fi

echo "PASS: no application code changes detected outside workflow artifact paths"
