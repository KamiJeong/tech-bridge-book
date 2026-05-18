# Feature Specification: Multilingual GitBook Documentation Refresh

**Feature Branch**: `003-gitbook-multilingual-docs`

**Created**: 2026-05-18

**Status**: Draft

**Input**: User description (GitHub issue #11): "Create the initial GitBook documentation structure for Tech Bridge Book. The documentation should teach AI and practical technology to non-developers from beginner level to real-world work application. Create a multilingual structure for Korean, English, and Japanese. Include: landing page, introduction page, curriculum overview, learner guide, glossary, lesson template, exercise template, thinking question template, AI safety and privacy guide, chapter structure from beginner to practical work usage. Requirements: prerequisite-before-reading note."

**Context Note**: An earlier feature (spec `002-initial-gitbook-structure`) already produced the bilingual content scaffold under `content/{ko,en,ja}/` and `SUMMARY.md`. This spec re-scopes the work to (a) verify the existing scaffold against the issue's expanded requirements, and (b) add the new "prerequisite before reading" guidance that issue #11 explicitly requires.

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Read Prerequisite Guidance Before Starting (Priority: P1)

A learner opening the book for the first time can find a short, plainly written "prerequisite before reading" note in their language before any lesson content. The note tells them what general computer skills, expectations, and mindset they need to begin.

**Why this priority**: Issue #11 explicitly adds this requirement on top of the prior structure. Without it, beginners may abandon the book or attempt lessons that assume skills they lack.

**Independent Test**: Open `content/ko/README.md`, `content/en/README.md`, and `content/ja/README.md` (or the introduction page if placed there) and confirm each contains a clearly labeled "Prerequisite before reading" section with parity across all three languages.

**Acceptance Scenarios**:

1. **Given** a beginner opens any language landing page, **When** they scroll above the curriculum links, **Then** they see a "Prerequisite before reading" section that names the basic skills, the workplace mindset, and the expected reading effort.
2. **Given** a learner switches between Korean, English, and Japanese versions, **When** they compare the prerequisite section, **Then** the meaning, scope, and tone match without literal translation drift.

---

### User Story 2 - Confirm Aligned Multilingual Structure (Priority: P2)

A contributor can verify that the Korean, English, and Japanese sections share the same page set (landing, introduction, curriculum overview, learner guide, glossary, AI safety/privacy guide, chapter index, and three templates) and aligned file names before drafting lessons.

**Why this priority**: The book is multilingual-first; any structural drift introduced after issue #5 must be caught and fixed before lesson authoring resumes.

**Independent Test**: Run a directory diff across `content/ko/`, `content/en/`, and `content/ja/` and confirm every non-language-specific file exists at the same relative path in all three trees, and that `SUMMARY.md` references each file.

**Acceptance Scenarios**:

1. **Given** a reviewer inspects the three language trees, **When** they compare relative paths, **Then** every required page (landing, introduction, curriculum overview, learner guide, glossary, AI safety/privacy, chapters index, three templates) is present in all three languages.
2. **Given** a reviewer opens `SUMMARY.md`, **When** they walk the Korean, English, and Japanese sections, **Then** every entry resolves to an existing file.

---

### User Story 3 - Reuse Templates and Safety Guidance Without Editing the Originals (Priority: P3)

An author writing a new lesson can copy the lesson, exercise, and thinking-question templates and reference the AI safety/privacy guide and glossary placeholders without modifying the source templates or the safety guide for one-off needs.

**Why this priority**: Template stability is a constitutional concern; this story protects future authors from accidental drift introduced during the refresh.

**Independent Test**: Open the three template files in each language and confirm they still expose required sections (audience, why-it-matters, concept, example, exercise, thinking question, common mistakes, summary, next step) without lesson-specific content.

**Acceptance Scenarios**:

1. **Given** an author copies the lesson template, **When** they save the copy under a new chapter folder, **Then** the original template remains unchanged and the copy contains all required sections.
2. **Given** an author references the AI safety/privacy guide, **When** they cite it from a lesson, **Then** the guide still covers AI limits, hallucination, privacy, copyright, sensitive workplace data, and human judgment.

### Edge Cases

- If a learner's first language is none of ko/en/ja, the prerequisite note must direct them to the most accessible alternative (English) and acknowledge translation limits.
- If the existing scaffold already contains a section that resembles a prerequisite note but is not labeled as such, the refresh must consolidate it under a single, clearly labeled section to avoid duplication.
- If `SUMMARY.md` references a page that the prior implementation removed or renamed, the refresh must restore alignment in the language tree with the smallest possible change.

### Learner, Curriculum & Publishing Expectations *(mandatory)*

- **Target Learner**: Non-developers with basic computer literacy who want practical AI and technology confidence for work.
- **Difficulty Standard**: Approachable for motivated beginners age 13+, respecting adult learners; no jargon without a glossary entry.
- **Curriculum Position**: Foundation refresh — must precede all chapter authoring and link forward to the curriculum overview and chapter index.
- **Practical Work Scenario**: Documents, spreadsheets, reports, planning, customer communication, marketing, operations, research, and automation.
- **Output Languages**: Korean canonical source plus aligned English and Japanese versions.
- **GitBook Format**: GitBook-friendly Markdown with predictable file names, short sections, clean headings, and a root `SUMMARY.md` navigation that already exists.
- **AI Safety Scope**: AI limits, hallucination risk, privacy, copyright, data sensitivity, and human judgment — already covered in `ai-safety-privacy.md` and must not regress.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Each language tree (`content/ko`, `content/en`, `content/ja`) MUST contain a clearly labeled "Prerequisite before reading" section on the landing page (`README.md`).
- **FR-002**: The prerequisite section MUST name basic skills (browser, documents, spreadsheets), the expected reading mindset, and an honest time/effort expectation, in beginner-friendly wording.
- **FR-003**: The prerequisite section MUST preserve meaning across ko/en/ja without literal-translation drift.
- **FR-004**: The existing structure (landing, introduction, curriculum-overview, learner-guide, glossary, ai-safety-privacy, chapters/README, templates with lesson/exercise/thinking-question) MUST remain present in all three languages with aligned relative paths.
- **FR-005**: `SUMMARY.md` MUST continue to list every required page in all three language sections and MUST NOT reference missing files.
- **FR-006**: Existing template files MUST NOT be edited as part of this refresh; required template sections MUST remain intact.
- **FR-007**: The AI safety/privacy guide MUST continue to cover AI limits, hallucination, privacy, copyright, data sensitivity, and human judgment in all three languages; no regression is allowed.
- **FR-008**: Any new content introduced by this refresh MUST be GitBook-friendly Markdown with short sections, clean headings, and no broken internal links.

### Terminology, Safety & Data *(mandatory)*

- **Terminology**: Reuses existing glossary terms. New term added: "prerequisite" (ko: 사전 준비, en: prerequisite, ja: 事前準備) — to be added to each language glossary if not already present.
- **Glossary Impact**: Add a single glossary entry for "prerequisite before reading" in all three languages if missing.
- **AI/Data Safety**: No new AI features; safety guide unchanged. Prerequisite note must remind learners not to paste sensitive workplace data into AI tools while practicing.
- **Human Judgment**: Prerequisite note must remind learners that the book teaches judgment, not just steps.

### Key Content Artifacts

- **Prerequisite Section (ko/en/ja)**: New section embedded in each language `README.md` describing required prior skills and mindset.
- **SUMMARY.md**: Existing root navigation; verified intact, no new top-level entries needed.
- **Glossary entry (optional)**: Single new entry for "prerequisite before reading" across ko/en/ja glossaries.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: A first-time learner can identify the required prior skills within 30 seconds of opening any language landing page.
- **SC-002**: 100% of required pages (10 per language × 3 languages = 30) resolve to existing files and are listed in `SUMMARY.md`.
- **SC-003**: Prerequisite sections in ko/en/ja preserve the same meaning, scope, and tone (reviewer confirms parity on a single-page side-by-side review).
- **SC-004**: GitBook builds the navigation without warnings or broken links after the refresh.

## Assumptions

- The existing `content/{ko,en,ja}/` scaffold from spec `002-initial-gitbook-structure` is correct and should be reused, not rebuilt.
- Issue #11's "auto-implement" mode authorizes additive, low-risk changes (new prerequisite section, optional glossary entry) but not destructive rewrites of existing pages.
- Editing existing `introduction.md` or `learner-guide.md` is out of scope unless they overlap with the new prerequisite section in a way that creates duplication.
- The prior implementation already satisfies the bulk of issue #11's structural requirements; this refresh's net new work is the prerequisite note and a parity audit.

## Constitution Alignment *(mandatory)*

- **Non-Developer-First Education**: Prerequisite note is written in plain language; no jargon introduced.
- **13+ Difficulty Standard**: Tone matches existing pages; respects adult beginners without being childish.
- **Theory Plus Action**: Prerequisite note ends with one concrete action ("open the introduction page").
- **Practical Work Connection**: Prerequisite note references workplace scenarios (documents, spreadsheets).
- **Multilingual Consistency**: ko canonical, en/ja aligned; reviewed side-by-side.
- **Consistent Lesson Structure**: Not a lesson; section follows the page-level conventions of existing landing pages.
- **AI Literacy and Safety**: Prerequisite note links to `ai-safety-privacy.md` and reminds learners about data sensitivity.
- **GitBook Readability**: Short headings, no nested deep lists, GitBook-friendly Markdown.
- **Progressive Learning Path**: Prerequisite note explicitly points to "introduction → curriculum overview" as the next steps.
- **Lesson Definition of Done**: Three language landing pages updated; SUMMARY.md verified; reviewer confirms ko/en/ja parity.
