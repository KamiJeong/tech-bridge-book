# Feature Specification: Initial GitBook Documentation Structure

**Feature Branch**: `002-initial-gitbook-structure`

**Created**: 2026-05-18

**Status**: Draft

**Input**: User description: "Create the initial GitBook documentation structure for Tech Bridge Book. The documentation should teach AI and practical technology to non-developers from beginner level to real-world work application. Create a multilingual structure for Korean, English, and Japanese. Include landing page, introduction page, curriculum overview, learner guide, glossary, lesson template, exercise template, thinking question template, AI safety and privacy guide, and chapter structure from beginner to practical work usage. Do not write full lesson content yet. First create the information architecture, folder structure, naming convention, and page templates."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Navigate the Book Structure (Priority: P1)

A learner or editor can open the repository as a GitBook source and understand the main learning path, language sections, and available guide pages before any full lessons are written.

**Why this priority**: The book needs a visible information architecture before lesson drafting can proceed.

**Independent Test**: Open the root navigation and verify that Korean, English, and Japanese sections all expose the same landing, introduction, curriculum overview, learner guide, glossary, safety guide, templates, and chapter index.

**Acceptance Scenarios**:

1. **Given** a new contributor opens the GitBook navigation, **When** they scan the table of contents, **Then** they see aligned Korean, English, and Japanese structures.
2. **Given** a learner enters any language section, **When** they open the landing page, **Then** they can identify the book purpose and next page without encountering full lesson drafts.

---

### User Story 2 - Use Authoring Templates (Priority: P2)

An editor can create future lessons, exercises, and thinking questions from reusable templates that follow the constitution's required lesson structure.

**Why this priority**: Templates prevent future lesson drift and make multilingual content easier to keep aligned.

**Independent Test**: Review the template pages in each language and confirm that required sections, practical work context, exercise prompts, thinking questions, safety notes, and next steps are represented.

**Acceptance Scenarios**:

1. **Given** an editor starts a new lesson, **When** they copy the lesson template, **Then** the draft includes all required sections from the constitution.
2. **Given** an editor adds an exercise or thinking question, **When** they use the matching template, **Then** the prompt includes workplace context and beginner-friendly wording.

---

### User Story 3 - Establish Shared Terms and Safety Guidance (Priority: P3)

A learner or editor can find glossary placeholders and AI safety/privacy guidance in each language before detailed lessons are created.

**Why this priority**: AI literacy and multilingual terminology consistency are constitutional requirements for future content.

**Independent Test**: Open glossary and AI safety/privacy pages in all three languages and confirm they define the intended use, placeholder format, privacy caution, AI limits, copyright awareness, and human judgment expectations.

**Acceptance Scenarios**:

1. **Given** an editor introduces a recurring term, **When** they open the glossary page, **Then** they can see how to record Korean, English, and Japanese terminology consistently.
2. **Given** a learner reads the safety guide, **When** they review the privacy section, **Then** they are warned not to paste sensitive personal or workplace data into AI tools without safeguards.

### Edge Cases

- If a future topic becomes too broad for one GitBook page, the chapter index must direct authors to split it into smaller lessons.
- If a term has no natural one-to-one translation, glossary entries must preserve meaning rather than force literal translation.
- If an AI example could involve personal, confidential, proprietary, or regulated data, the safety guide must instruct authors to use fictional or sanitized examples.

### Learner, Curriculum & Publishing Expectations *(mandatory)*

- **Target Learner**: Non-developers with basic computer literacy who want practical AI and technology confidence for work.
- **Difficulty Standard**: Approachable for motivated beginners age 13+ while respecting adult learners and naming real concepts plainly.
- **Curriculum Position**: Foundation for the full progressive path: digital literacy, AI fundamentals, prompting, data/documents, automation, mini-projects, and real-world patterns.
- **Practical Work Scenario**: Documents, spreadsheets, reports, planning, customer communication, marketing, operations, research, and automation.
- **Output Languages**: Korean canonical source plus English and Japanese aligned versions.
- **GitBook Format**: GitBook-friendly Markdown with predictable file names, short sections, clean headings, and root navigation.
- **AI Safety Scope**: AI limits, hallucination risk, privacy, copyright, data sensitivity, and human judgment.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: The repository MUST include a root GitBook navigation page that links to Korean, English, and Japanese content sections.
- **FR-002**: Each language section MUST include landing, introduction, curriculum overview, learner guide, glossary, AI safety/privacy guide, template index, and chapter index pages.
- **FR-003**: Each language section MUST include lesson, exercise, and thinking question templates.
- **FR-004**: Each language section MUST use aligned file names and page purposes so future translations can be compared by path.
- **FR-005**: The chapter structure MUST progress from beginner digital literacy through real-world practical usage.
- **FR-006**: The pages MUST avoid full lesson content and instead provide information architecture, authoring guidance, placeholders, and templates.
- **FR-007**: The glossary guidance MUST support Korean, English, and Japanese term alignment.
- **FR-008**: The AI safety/privacy guide MUST cover realistic AI limits, hallucination risk, privacy, copyright, sensitive data, and human judgment.
- **FR-009**: The structure MUST be clean GitBook-friendly Markdown with readable headings, short paragraphs, and predictable links.

### Terminology, Safety & Data *(mandatory)*

- **Terminology**: Initial glossary placeholders for AI, prompt, data, automation, privacy, hallucination, and human judgment in Korean, English, and Japanese.
- **Glossary Impact**: Create language-local glossary pages with a shared entry format.
- **AI/Data Safety**: Include guidance to avoid confidential, personal, proprietary, or regulated data in AI tools without safeguards.
- **Human Judgment**: Explain that AI output should be checked by a person before work use.

### Key Content Artifacts *(include if feature involves structured content)*

- **GitBook Navigation**: Root `SUMMARY.md` linking the multilingual documentation structure.
- **Language Sections**: `content/ko/`, `content/en/`, and `content/ja/` with aligned page names.
- **Templates**: Lesson, exercise, and thinking question templates in each language.
- **Safety Guide**: AI safety and privacy guide in each language.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: A reviewer can identify the complete Korean, English, and Japanese page set from navigation in under 3 minutes.
- **SC-002**: 100% of required page types listed in the issue exist in all three language sections.
- **SC-003**: 100% of language sections use aligned file names for matching page purposes.
- **SC-004**: A future lesson author can create a new lesson outline from the template without needing to invent the required section order.
- **SC-005**: Safety guidance explicitly covers at least five risks: hallucination, privacy, sensitive data, copyright, and human judgment.

## Assumptions

- Korean is the canonical source language, with English and Japanese localized to preserve meaning and structure.
- GitBook Markdown is the publishing source and root `SUMMARY.md` is the primary navigation artifact.
- Full lesson content is out of scope for this feature.
- Future lesson pages will be added under the aligned language directories.

## Constitution Alignment *(mandatory)*

- **Non-Developer-First Education**: Pages and templates use plain language and avoid developer-first assumptions.
- **13+ Difficulty Standard**: Guidance is beginner-friendly without childish framing.
- **Theory Plus Action**: Templates require explanations plus exercises and thinking questions.
- **Practical Work Connection**: Templates require workplace scenarios and examples.
- **Multilingual Consistency**: Korean, English, and Japanese sections share aligned paths and page purposes.
- **Consistent Lesson Structure**: The lesson template includes all required sections.
- **AI Literacy and Safety**: Safety guide covers AI limits, hallucination, privacy, copyright, data sensitivity, and human judgment.
- **GitBook Readability**: Markdown pages use concise headings, lists, and predictable links.
- **Progressive Learning Path**: Chapter index follows the required beginner-to-practical sequence.
- **Lesson Definition of Done**: Templates encode the evidence future lessons must provide.
