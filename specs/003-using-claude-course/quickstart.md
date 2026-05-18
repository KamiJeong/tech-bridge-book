# Quickstart: Validate Using Claude Course Structure

Run these checks from the repository root after implementation.

```bash
find content/ko/courses/using-claude -type f | sort | wc -l
find content/en/courses/using-claude -type f | sort | wc -l
find content/ja/courses/using-claude -type f | sort | wc -l
```

Each language should have at least 27 files.

```bash
for lang in ko en ja; do
  find "content/$lang/courses/using-claude" -path '*/ch*/README.md' -type f | wc -l
done
```

Each language should report 17 chapter README files.

```bash
rg 'Using Claude|Claude 사용하기|Claude の使い方' SUMMARY.md
rg 'Claude Code|sensitive|privacy|verify|human review' content/*/courses/using-claude -g '*.md'
```

Confirm navigation, Claude Code distinction, privacy, verification, and human-review guidance are present.
