# Plan: Using Claude — Multilingual Course Specification

**Feature**: 003-using-claude-course
**Branch**: codex/issue-14-using-claude-course
**Issue**: #14
**Mode**: auto-pr
**Strategy**: sequential (3 slices)

---

## Constitution Check

*GATE: Must pass before implementation.*

- **Non-Developer-First Education**: PASS. The course targets non-developers and beginner-adjacent roles, avoids developer-first assumptions, and includes plain-language terminology.
- **13+ Difficulty Standard**: PASS. The requested tone is adult-beginner friendly, practical, and not childish.
- **Theory Plus Action**: PASS. Lesson templates require core explanation, Claude prompt examples, hands-on exercise, and thinking question.
- **Practical Work Connection**: PASS. Curriculum chapters and templates require workplace scenarios and practical use cases.
- **Multilingual Consistency**: PASS. Korean, English, and Japanese paths mirror each other and Korean remains canonical.
- **Consistent Lesson Structure**: PASS. Lesson templates preserve constitution-required headings and add Claude-specific prompt and safety sections.
- **AI Literacy and Safety**: PASS. Safety checklist covers hallucination, privacy, sensitive data, copyright-aware use, high-risk decisions, and human review.
- **GitBook Readability**: PASS. Files are GitBook-friendly Markdown with predictable paths and shallow headings.
- **Progressive Learning Path**: PASS. Chapters move from readiness and mental model to prompting, workflows, technical collaboration, projects, and safety.
- **Lesson Definition of Done**: PASS. Definition-of-done pages require all three languages, exercise, thinking question, safety review, practical scenario, and next step.

## Quality Gates

- **Terminology handling**: Course glossary must include at least 15 aligned terms in Korean, English, and Japanese.
- **Markdown/GitBook checks**: Validate `SUMMARY.md` links, chapter directories, short headings, and predictable kebab-case paths.
- **Translation consistency checks**: Compare mirrored paths across `content/ko`, `content/en`, and `content/ja` for matching document sets and chapter counts.
- **Lesson completion evidence**: Each definition-of-done page must list multilingual files, exercise, thinking question, practical scenario, safety review, glossary impact, and next step.
- **Token observability**: Record intake, implementation, review, token-reporting, commit, and PR phases under `.specify/token-analysis/runs/2026-05-19-using-claude-course-s01-auto-pr/`.

## Architecture Overview

This plan delivers the information architecture, course specification, and reusable reference materials for the "Using Claude" course. Full lesson content is out of scope for this slice — only structural placeholders, spec documents, and templates are created.

### Slice Breakdown

| Slice | Deliverable | Files |
|---|---|---|
| S1 | Course IA & Folder Structure | `content/ko|en|ja/courses/using-claude/` directories, chapter `README.md` stubs, `SUMMARY.md` updates |
| S2 | Course Specification Documents | `course-overview.md`, `curriculum-map.md` per language |
| S3 | Templates & Reference Materials | `prompt-pattern-library.md`, `safety-checklist.md`, `glossary.md`, `definition-of-done.md` per language |

---

## Slice 1: Course IA & Folder Structure

### Goal
Create the complete folder structure for the "Using Claude" course in all three languages, with chapter directory stubs and course landing pages. Update `SUMMARY.md` to include the new course.

### Files Changed

**New files (Korean)**:
- `content/ko/courses/using-claude/README.md`
- `content/ko/courses/using-claude/ch00-before-you-start/README.md`
- `content/ko/courses/using-claude/ch01-what-claude-is/README.md`
- `content/ko/courses/using-claude/ch02-mental-model/README.md`
- `content/ko/courses/using-claude/ch03-better-questions/README.md`
- `content/ko/courses/using-claude/ch04-messy-thoughts/README.md`
- `content/ko/courses/using-claude/ch05-writing-rewriting/README.md`
- `content/ko/courses/using-claude/ch06-summarizing-documents/README.md`
- `content/ko/courses/using-claude/ch07-research-support/README.md`
- `content/ko/courses/using-claude/ch08-planning-work/README.md`
- `content/ko/courses/using-claude/ch09-tables-checklists/README.md`
- `content/ko/courses/using-claude/ch10-multilingual-work/README.md`
- `content/ko/courses/using-claude/ch11-technical-understanding/README.md`
- `content/ko/courses/using-claude/ch12-developer-collaboration/README.md`
- `content/ko/courses/using-claude/ch13-artifacts/README.md`
- `content/ko/courses/using-claude/ch14-claude-code-intro/README.md`
- `content/ko/courses/using-claude/ch15-mini-projects/README.md`
- `content/ko/courses/using-claude/ch16-safety-next-steps/README.md`

**Mirror files (English & Japanese)**: Same structure under `content/en/` and `content/ja/`

**Modified files**:
- `SUMMARY.md` — Add "Using Claude" course section for all three languages

### Risks
- `SUMMARY.md` edit must not break existing navigation links.

---

## Slice 2: Course Specification Documents

### Goal
Create the course overview, curriculum map, course-level lesson template, exercise template, and thinking question template as reference documents within each language directory.

### Files Changed (per language)
- `content/ko/courses/using-claude/course-overview.md`
- `content/ko/courses/using-claude/curriculum-map.md`
- `content/ko/courses/using-claude/templates/lesson-template.md`
- `content/ko/courses/using-claude/templates/exercise-template.md`
- `content/ko/courses/using-claude/templates/thinking-question-template.md`

**Mirror**: same paths under `content/en/` and `content/ja/`

---

## Slice 3: Templates & Reference Materials

### Goal
Create the course-level prompt pattern library, AI safety checklist, glossary structure, and definition of done document in all three languages.

### Files Changed (per language)
- `content/ko/courses/using-claude/prompt-pattern-library.md`
- `content/ko/courses/using-claude/safety-checklist.md`
- `content/ko/courses/using-claude/glossary.md`
- `content/ko/courses/using-claude/definition-of-done.md`

**Mirror**: same paths under `content/en/` and `content/ja/`

---

## Validation Criteria

- `find content/ko/courses/using-claude -type f | sort` returns at least 27 files
- `SUMMARY.md` includes "Using Claude" course entries for all three languages
- All 17 chapter directories per language contain a `README.md`
- `course-overview.md` contains: audience table, learning outcomes (10+), prerequisites, scope, out-of-scope
- `curriculum-map.md` contains all 17 chapter entries with goal, learning outcome, key concept, use case
- `prompt-pattern-library.md` contains 13+ named patterns
- `safety-checklist.md` contains 10 caution areas
- `glossary.md` contains 15+ term entries
- `definition-of-done.md` contains all 12 completion criteria

---

## Tech Stack Notes

- All files: GitBook-compatible Markdown
- Folder structure: kebab-case, chapter numbers zero-padded to 2 digits
- No frontmatter required unless GitBook plugin demands it
- Language directories: `ko/`, `en/`, `ja/`
