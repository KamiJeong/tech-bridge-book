# Implementation Plan: Multilingual GitBook Documentation Refresh

**Feature**: `specs/003-gitbook-multilingual-docs`
**Created**: 2026-05-18
**Mode**: auto-implement (issue #11)

## Goal

Add a "Prerequisite before reading" section to the ko/en/ja landing pages without disturbing the existing scaffold produced by `002-initial-gitbook-structure`.

## Scope

In scope:

- Edit `content/ko/README.md`, `content/en/README.md`, `content/ja/README.md` to insert a single new section above the existing "Start Here" / "시작 순서" / "はじめに読むページ" list.
- Verify `SUMMARY.md` still references every required page in all three languages.
- Verify the existing scaffold (templates, ai-safety-privacy, chapters index, etc.) is intact in all three languages.

Out of scope:

- Editing templates.
- Editing `ai-safety-privacy.md`, `introduction.md`, `learner-guide.md`, `curriculum-overview.md`, `glossary.md`.
- Adding new pages or new SUMMARY.md entries.
- Editing chapter content.

## Approach

1. **Parity audit (read-only)**: Walk `content/{ko,en,ja}/` and confirm the 10 required page paths exist per language. Confirm `SUMMARY.md` references resolve. Record findings.
2. **Author Korean prerequisite section first** (canonical source) and place it directly under the opening paragraph in `content/ko/README.md`, above the "시작 순서" list.
3. **Mirror the section into English and Japanese**, preserving meaning and tone, not literal translation.
4. **Re-verify** `SUMMARY.md` requires no changes (no new pages added, only inline section).
5. **Token capture** per phase via `.specify/extensions/token-analyzer/`.

## File Touch List

- `content/ko/README.md` — add one section.
- `content/en/README.md` — add one section.
- `content/ja/README.md` — add one section.

No other files are touched by this plan.

## Section Content Shape (per language)

```
## <Prerequisite heading>

<2-3 sentence paragraph naming basic skills, mindset, time expectation>

<3-5 bullet list of concrete prior skills and expectations>

<closing line linking to introduction.md and ai-safety-privacy.md>
```

## Risks

- **Low**: Section drift across languages. Mitigation: write ko first, then en, then ja, side-by-side review.
- **Low**: Markdown rendering issue. Mitigation: GitBook-friendly Markdown only (H2, paragraph, unordered list).
- **Low**: Duplication with introduction.md. Mitigation: keep prerequisite section short and pointer-style, not a duplicate of introduction.

## Validation Steps

- All three landing pages render in GitBook preview without warnings.
- The three prerequisite sections cover the same skills and tone (manual side-by-side check).
- `SUMMARY.md` still resolves to all referenced files (no missing files).
- No edits to files outside the three landing pages.

## Constitution Alignment

Reuses constitution checks from `specs/002-initial-gitbook-structure/plan.md`; this refresh inherits the same standards and adds no new principles.
