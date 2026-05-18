# Tasks: Multilingual GitBook Documentation Refresh

**Feature**: `specs/003-gitbook-multilingual-docs`
**Created**: 2026-05-18

> Ordered, independently verifiable tasks. `[ ]` = pending, `[X]` = done.

## Phase 1 — Audit

- [ ] **T001** Verify required page parity across `content/ko/`, `content/en/`, `content/ja/`. Required pages: `README.md`, `introduction.md`, `curriculum-overview.md`, `learner-guide.md`, `glossary.md`, `ai-safety-privacy.md`, `chapters/README.md`, `templates/README.md`, `templates/lesson-template.md`, `templates/exercise-template.md`, `templates/thinking-question-template.md`. **Verify**: shell loop confirms all paths exist; report any missing path.
- [ ] **T002** Verify every `SUMMARY.md` link resolves to an existing file. **Verify**: parse links, confirm each file exists; report broken links.

## Phase 2 — Author prerequisite section (Korean canonical)

- [ ] **T003** Add "사전 준비" (Prerequisite before reading) section to `content/ko/README.md`, placed between the opening paragraph and the "## 시작 순서" heading. Section must include: basic skills, mindset, time expectation, AI-data caution pointer, link to introduction. **Verify**: file renders cleanly; section appears once; no other edits.

## Phase 3 — Mirror into English and Japanese

- [ ] **T004** Add equivalent "Prerequisite before reading" section to `content/en/README.md`. Preserve meaning and tone from the Korean canonical version. **Verify**: side-by-side parity check with ko version.
- [ ] **T005** Add equivalent "事前準備" section to `content/ja/README.md`. Preserve meaning and tone. **Verify**: side-by-side parity check with ko/en versions.

## Phase 4 — Post-edit validation

- [ ] **T006** Re-run T001 (page parity) and T002 (SUMMARY links) audits to confirm no regression. **Verify**: both pass.
- [ ] **T007** Confirm only `content/ko/README.md`, `content/en/README.md`, `content/ja/README.md` were edited. **Verify**: `git diff --name-only` against pre-task baseline.

## Phase 5 — Token observability

- [ ] **T008** Record token capture per completed phase using `.specify/extensions/token-analyzer/` scripts (or `record-token-step.sh`). **Verify**: phase records exist under the token-analyzer data path.
- [ ] **T009** Generate token analysis report. **Verify**: report file exists.

## Phase 6 — Report

- [ ] **T010** Post results comment to GitHub issue #11 including outcome summary and token report path. **Verify**: comment URL captured.

## Notes

- Auto-implement scope is additive only. Do not edit templates, the AI-safety guide, or other content pages.
- Korean is canonical; English and Japanese follow.
