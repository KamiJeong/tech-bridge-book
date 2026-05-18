# Tasks: Initial GitBook Documentation Structure

**Input**: Design documents from `specs/002-initial-gitbook-structure/`

## Phase 1: Setup

- [x] T001 Create root GitBook navigation in `SUMMARY.md`
- [x] T002 Create aligned language directories under `content/ko`, `content/en`, and `content/ja`

## Phase 2: Foundational

- [x] T003 Create matching core guide page set for all language sections
- [x] T004 Create matching template directories for all language sections

## Phase 3: User Story 1 - Navigate the Book Structure (Priority: P1)

**Goal**: Learners and editors can understand the multilingual book structure from navigation and landing pages.

**Independent Test**: Open `SUMMARY.md` and confirm each language links to the same page purposes.

- [x] T005 [US1] Add Korean landing and navigation-oriented guide pages in `content/ko/`
- [x] T006 [US1] Add English landing and navigation-oriented guide pages in `content/en/`
- [x] T007 [US1] Add Japanese landing and navigation-oriented guide pages in `content/ja/`
- [x] T008 [US1] Add progressive chapter indexes in `content/ko/chapters/README.md`, `content/en/chapters/README.md`, and `content/ja/chapters/README.md`

## Phase 4: User Story 2 - Use Authoring Templates (Priority: P2)

**Goal**: Editors can create future lessons, exercises, and thinking questions from consistent templates.

**Independent Test**: Review all template pages and confirm lesson structure, workplace context, exercise prompt, thinking question, safety notes, and next step are present.

- [x] T009 [US2] Add Korean authoring templates in `content/ko/templates/`
- [x] T010 [US2] Add English authoring templates in `content/en/templates/`
- [x] T011 [US2] Add Japanese authoring templates in `content/ja/templates/`

## Phase 5: User Story 3 - Establish Shared Terms and Safety Guidance (Priority: P3)

**Goal**: Learners and editors can find starter glossary and AI safety/privacy guidance in all languages.

**Independent Test**: Open glossary and safety pages in all language sections and confirm shared term format and safety risks are covered.

- [x] T012 [US3] Add glossary starter pages in `content/ko/glossary.md`, `content/en/glossary.md`, and `content/ja/glossary.md`
- [x] T013 [US3] Add AI safety and privacy guides in `content/ko/ai-safety-privacy.md`, `content/en/ai-safety-privacy.md`, and `content/ja/ai-safety-privacy.md`

## Final Phase: Polish & Cross-Cutting Concerns

- [x] T014 Validate required file presence with `find content -type f | sort`
- [x] T015 Validate navigation paths and safety coverage with repository scans
- [x] T016 Record token analysis and issue status evidence for GitHub issue `#5`

## Dependencies

User Story 1 depends on setup and foundational directory creation. User Stories 2 and 3 can be reviewed independently after the language sections exist.

## Implementation Strategy

Create the navigation and aligned page skeleton first, then add templates and safety/glossary guidance. Keep all pages as IA and template content, not full lesson drafts.
