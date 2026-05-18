# Quickstart: Initial GitBook Documentation Structure

## Review The Navigation

1. Open `SUMMARY.md`.
2. Confirm Korean, English, and Japanese sections are present.
3. Confirm each section links to the same page purposes.

## Check Required Pages

Run:

```bash
find content -type f | sort
```

Expected result: each of `content/ko`, `content/en`, and `content/ja` contains:

- `README.md`
- `introduction.md`
- `curriculum-overview.md`
- `learner-guide.md`
- `glossary.md`
- `ai-safety-privacy.md`
- `chapters/README.md`
- `templates/README.md`
- `templates/lesson-template.md`
- `templates/exercise-template.md`
- `templates/thinking-question-template.md`

## Check Scope

Run:

```bash
rg "Lesson 1|Chapter 1 full draft|complete lesson" content
```

Expected result: no full lesson drafts are introduced.

## Check Safety Coverage

Run:

```bash
rg "hallucination|privacy|sensitive|copyright|judgment|환각|개인정보|민감|저작권|判断|プライバシー" content
```

Expected result: safety and privacy guidance appears across the language sections.
