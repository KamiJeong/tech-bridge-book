# Implementation Plan: Codex CLI 101 Course

**Branch**: `issue-19-codex-cli-101-spec`  
**Date**: 2026-05-19  
**Spec**: [spec.md](./spec.md)

## Summary

Create a Korean canonical GitBook-friendly Markdown course that introduces Codex
CLI to beginner developers. The implementation uses a three-branch stack:

1. Course specification, navigation, and landing page.
2. Core chapter lessons under `docs/`.
3. Exercises, prompt library, instructor guide, validation, and token report.

## Technical Context

**Canonical Source Language**: Korean  
**Target Learner**: Beginner developers and technically curious learners new to
terminal AI coding agents.  
**Publishing Format**: GitBook-friendly Markdown.  
**Primary Path**: `content/ko/courses/codex-cli-101/`  
**Quality Commands**: `find`, `rg`, Markdown path review, section structure
checks.  
**Token Observability**: Required under
`.specify/token-analysis/runs/2026-05-19-codex-cli-101-s01-auto-stack-pr/`.

## Constitution Check

- **Non-Developer-First Education**: PASS. The course assumes beginner
  developers and explains terminal-agent ideas plainly.
- **13+ Difficulty Standard**: PASS. The tone is adult, practical, and
  beginner-friendly.
- **Theory Plus Action**: PASS. Every chapter includes hands-on practice and a
  problem.
- **Practical Work Connection**: PASS. Examples cover reading code, fixing bugs,
  testing, and reviewing changes.
- **Multilingual Consistency**: PARTIAL. Korean is implemented first. The file
  map and structure are suitable for English/Japanese follow-up translation, but
  this issue does not implement full translations.
- **Consistent Lesson Structure**: PASS. Required issue sections are enforced
  for every chapter.
- **AI Literacy and Safety**: PASS. Safety boundaries are included throughout.
- **GitBook Readability**: PASS. Files are plain Markdown with stable paths.
- **Progressive Learning Path**: PASS. Chapters move from concept to workflow.
- **Lesson Definition of Done**: PARTIAL. Korean lessons are complete; full
  multilingual completion requires a translation follow-up.

## Project Structure

```text
content/ko/courses/codex-cli-101/
├── README.md
├── docs/
│   ├── 00-overview.md
│   ├── 01-installation.md
│   ├── 02-basic-usage.md
│   ├── 03-read-codebase.md
│   ├── 04-fix-bug.md
│   ├── 05-run-tests.md
│   ├── 06-review-changes.md
│   └── 07-spec-kit-workflow.md
├── exercises/
│   ├── README.md
│   ├── 00-overview.md
│   ├── 01-installation.md
│   ├── 02-basic-usage.md
│   ├── 03-read-codebase.md
│   ├── 04-fix-bug.md
│   ├── 05-run-tests.md
│   ├── 06-review-changes.md
│   └── 07-spec-kit-workflow.md
├── prompts/
│   └── codex-cli-prompts.md
└── instructor-guide.md
```

## Validation

- Confirm required files exist.
- Confirm every `docs/*.md` page has the required eight section headings.
- Confirm `SUMMARY.md` links resolve.
- Confirm no course exercise asks learners to paste secrets, credentials, or
  private customer data into an AI tool.
