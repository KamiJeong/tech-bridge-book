# Research: Initial GitBook Documentation Structure

## Decision: Use Aligned Language Folders

Use `content/ko/`, `content/en/`, and `content/ja/` with the same file names for matching page purposes.

**Rationale**: Matching paths make translation review, link checks, and future lesson creation easier for non-developer contributors.

**Alternatives considered**: A single mixed-language page was rejected because it would make GitBook navigation crowded and translation drift harder to detect.

## Decision: Root SUMMARY.md Controls Navigation

Create a root `SUMMARY.md` that links all required pages in each language section.

**Rationale**: GitBook users expect a readable table of contents. A single navigation file makes missing pages visible.

**Alternatives considered**: Separate language-only summaries were deferred because the repository does not yet need separate GitBook spaces.

## Decision: Templates Instead of Full Lessons

Create reusable lesson, exercise, and thinking question templates in each language.

**Rationale**: The issue explicitly asks not to write full lesson content. Templates provide authoring structure without pretending the curriculum is drafted.

**Alternatives considered**: Drafting sample lessons was rejected as out of scope.

## Decision: Safety Guidance Is a Core Page

Add an AI safety and privacy guide to each language section.

**Rationale**: The constitution requires AI literacy and safety coverage, and future AI lessons need a common baseline.

**Alternatives considered**: Safety notes only inside templates were rejected because learners and editors need a standalone reference.
