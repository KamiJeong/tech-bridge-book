# Implementation Plan: Initial GitBook Documentation Structure

**Branch**: `002-initial-gitbook-structure` | **Date**: 2026-05-18 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from `specs/002-initial-gitbook-structure/spec.md`

## Summary

Create the first GitBook-ready documentation skeleton for Tech Bridge Book. The implementation will add a root navigation file, aligned Korean/English/Japanese content folders, required guide pages, chapter indexes, glossary placeholders, and reusable page templates without drafting full lesson content.

## Technical Context

**Canonical Source Language**: Korean

**Target Output Languages**: Korean, English, Japanese

**Publishing Format**: GitBook-friendly Markdown

**Target Learner**: Non-developers with basic computer literacy who want practical AI and technology skills for work.

**Difficulty Standard**: 13+ beginner-friendly adult learner standard.

**Curriculum Position**: Foundation for the whole learning path.

**Practical Work Scenario**: Documents, spreadsheets, reports, planning, customer communication, marketing, operations, research, and automation.

**Lesson Files**: No full lesson files. Template and guide paths live under `content/ko/`, `content/en/`, and `content/ja/`.

**Terminology/Glossary Impact**: Add starter glossary pages in all three languages with aligned entry format.

**AI Safety Scope**: Include hallucination, privacy, sensitive data, copyright, and human judgment.

**Markdown/GitBook Checks**: Verify required files exist, root navigation links match file paths, headings are readable, and pages avoid full lesson drafts.

**Translation Consistency Checks**: Compare matching paths across Korean, English, and Japanese for purpose, structure, templates, and safety topics.

**Quality Commands**: `find content -type f`, `rg` path checks, `bash -n` for shell scripts already present, and manual Markdown link/path review.

**Extension Gates**: Token observability required; version guard validation is applicable but expected to skip dependency checks because this feature adds Markdown only.

**Scale/Scope**: 1 root navigation file plus 10 Markdown files per language section.

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- **Non-Developer-First Education**: PASS. Target learner and plain-language guidance are explicit.
- **13+ Difficulty Standard**: PASS. Templates require approachable adult beginner language.
- **Theory Plus Action**: PASS. Lesson and exercise templates require learner action.
- **Practical Work Connection**: PASS. Templates require practical work scenarios.
- **Multilingual Consistency**: PASS. Aligned language folders and file names are planned.
- **Consistent Lesson Structure**: PASS. Lesson template includes the required structure.
- **AI Literacy and Safety**: PASS. Safety guide is a required artifact.
- **GitBook Readability**: PASS. Structure is Markdown-first with root navigation.
- **Progressive Learning Path**: PASS. Chapter index follows the constitution sequence.
- **Lesson Definition of Done**: PASS. Templates encode future completion evidence.

## Project Structure

### Documentation (this feature)

```text
specs/002-initial-gitbook-structure/
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── checklists/
│   └── requirements.md
└── tasks.md
```

### Content Files (repository root)

```text
SUMMARY.md
content/
├── ko/
│   ├── README.md
│   ├── introduction.md
│   ├── curriculum-overview.md
│   ├── learner-guide.md
│   ├── glossary.md
│   ├── ai-safety-privacy.md
│   ├── chapters/README.md
│   └── templates/
│       ├── README.md
│       ├── lesson-template.md
│       ├── exercise-template.md
│       └── thinking-question-template.md
├── en/
│   └── same aligned paths as ko
└── ja/
    └── same aligned paths as ko
```

**Structure Decision**: Use `content/<language>/` because it keeps matching language pages comparable by path while leaving room for future lessons under each language section.

## Phase 0: Research

Completed in [research.md](./research.md).

## Phase 1: Design

Completed artifacts:

- [data-model.md](./data-model.md)
- [quickstart.md](./quickstart.md)

## Post-Design Constitution Check

- **Non-Developer-First Education**: PASS. Guide pages and templates remain non-developer-first.
- **13+ Difficulty Standard**: PASS. Template language avoids childish or expert-only framing.
- **Theory Plus Action**: PASS. Exercise and thinking-question templates are first-class artifacts.
- **Practical Work Connection**: PASS. Work scenarios are required in templates.
- **Multilingual Consistency**: PASS. All language paths are aligned.
- **Consistent Lesson Structure**: PASS. Lesson template maps directly to the constitution.
- **AI Literacy and Safety**: PASS. Safety guide covers required risks.
- **GitBook Readability**: PASS. GitBook navigation and short Markdown pages are planned.
- **Progressive Learning Path**: PASS. Chapter index follows the required sequence.
- **Lesson Definition of Done**: PASS. Authoring templates preserve future evidence requirements.

## Complexity Tracking

No constitutional violations or approved overrides.
