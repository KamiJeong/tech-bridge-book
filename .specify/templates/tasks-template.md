---

description: "Task list template for lesson and curriculum work"
---

# Tasks: [FEATURE NAME]

**Input**: Design documents from `/specs/[###-feature-name]/`

**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Verification**: Every lesson change MUST have an independently executable
review path. Include tasks for multilingual consistency, lesson structure,
exercise coverage, AI safety when applicable, and GitBook Markdown review unless
the plan records an explicit override with owner, risk, and manual evidence.

**Organization**: Tasks are grouped by user story to enable independent drafting,
localization, and verification of each learner-facing increment.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Path Conventions

- **Korean canonical source**: `[content-root]/ko/[lesson].md`
- **English localization**: `[content-root]/en/[lesson].md`
- **Japanese localization**: `[content-root]/ja/[lesson].md`
- **Terminology/glossary**: `[content-root]/glossary/[terms].md`
- Paths shown below are examples - adjust based on plan.md structure

<!--
  ============================================================================
  IMPORTANT: The tasks below are SAMPLE TASKS for illustration purposes only.

  The /speckit-tasks command MUST replace these with actual tasks based on:
  - User stories from spec.md (with their priorities P1, P2, P3...)
  - Feature requirements from plan.md
  - Lesson requirements from plan.md
  - Terminology/glossary impact from data-model.md or research.md
  - Markdown/GitBook and multilingual consistency checks from contracts/

  Tasks MUST be organized by user story so each story can be:
  - Drafted independently
  - Reviewed independently
  - Delivered as a useful learner-facing increment

  DO NOT keep these sample tasks in the generated tasks.md file.
  ============================================================================
-->

## Phase 1: Setup (Shared Content Structure)

**Purpose**: Content paths and shared review structure

- [ ] T001 Create or confirm lesson directories for Korean, English, and Japanese Markdown files
- [ ] T002 Identify canonical Korean source file and matching English/Japanese file paths
- [ ] T003 [P] Create or update glossary/terminology tracking file
- [ ] T004 [P] Confirm GitBook Markdown conventions for headings, callouts, tables, links, and file naming
- [ ] T005 [P] Record curriculum position, prerequisite lesson, and next-step target

---

## Phase 2: Foundational (Blocking Content Decisions)

**Purpose**: Core content decisions that MUST be complete before ANY user story can be drafted

**CRITICAL**: No user story work can begin until this phase is complete

Examples of foundational tasks (adjust based on your project):

- [ ] T006 Define target learner, prior knowledge, and 13+ difficulty boundary
- [ ] T007 [P] Define learning goal and practical work scenario
- [ ] T008 [P] List required lesson sections and acceptance checklist
- [ ] T009 Define key terms, analogies, and glossary entries
- [ ] T010 Define hands-on exercise or mini-task and thinking question
- [ ] T011 Define AI safety, privacy, copyright, data sensitivity, and human judgment notes if applicable
- [ ] T012 Define translation/localization rules for Korean, English, and Japanese
- [ ] T013 Define Markdown/GitBook review criteria

**Checkpoint**: Foundation ready - user story drafting can now begin in parallel

---

## Phase 3: User Story 1 - [Title] (Priority: P1) MVP

**Goal**: [Brief description of what this story delivers]

**Independent Test**: [How to verify this story works on its own]

### Verification for User Story 1

> **NOTE: Define review checks before drafting or localization**

- [ ] T014 [P] [US1] Lesson-structure checklist for required sections
- [ ] T015 [P] [US1] Multilingual consistency checklist for Korean, English, and Japanese
- [ ] T016 [P] [US1] GitBook Markdown review checklist for headings, callouts, tables, links, and page length

### Authoring for User Story 1

- [ ] T017 [US1] Draft canonical Korean lesson in [path]
- [ ] T018 [US1] Add simple example, hands-on exercise, thinking question, common mistakes, summary, and next step
- [ ] T019 [US1] Add AI safety notes where applicable
- [ ] T020 [US1] Localize English version in [path]
- [ ] T021 [US1] Localize Japanese version in [path]
- [ ] T022 [US1] Update glossary or terminology notes in [path]
- [ ] T023 [US1] Review all three language versions for structure, meaning, terminology, examples, exercises, and learning outcomes

**Checkpoint**: At this point, User Story 1 should be readable, localized, and reviewable independently

---

## Phase 4: User Story 2 - [Title] (Priority: P2)

**Goal**: [Brief description of what this story delivers]

**Independent Test**: [How to verify this story works on its own]

### Verification for User Story 2

- [ ] T024 [P] [US2] Lesson-structure checklist for required sections
- [ ] T025 [P] [US2] Multilingual consistency and GitBook Markdown review

### Authoring for User Story 2

- [ ] T026 [US2] Draft canonical Korean lesson/content update in [path]
- [ ] T027 [US2] Localize English version in [path]
- [ ] T028 [US2] Localize Japanese version in [path]
- [ ] T029 [US2] Update terminology and next-step links across related lessons

**Checkpoint**: At this point, User Stories 1 AND 2 should both work independently

---

## Phase 5: User Story 3 - [Title] (Priority: P3)

**Goal**: [Brief description of what this story delivers]

**Independent Test**: [How to verify this story works on its own]

### Verification for User Story 3

- [ ] T030 [P] [US3] Lesson-structure checklist for required sections
- [ ] T031 [P] [US3] Multilingual consistency and GitBook Markdown review

### Authoring for User Story 3

- [ ] T032 [US3] Draft canonical Korean lesson/content update in [path]
- [ ] T033 [US3] Localize English version in [path]
- [ ] T034 [US3] Localize Japanese version in [path]

**Checkpoint**: All user stories should now be independently readable, localized, and reviewable

---

[Add more user story phases as needed, following the same pattern]

---

## Phase N: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories

- [ ] TXXX [P] Final terminology consistency pass across Korean, English, and Japanese
- [ ] TXXX [P] Final AI safety and human judgment review where applicable
- [ ] TXXX [P] Final GitBook Markdown formatting, link, heading, callout, table, and file naming review
- [ ] TXXX Confirm every lesson includes exercise, thinking question, practical work scenario, summary, and next step
- [ ] TXXX Run configured extension quality gates
- [ ] TXXX Run quickstart.md validation

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all user stories
- **User Stories (Phase 3+)**: All depend on Foundational phase completion
  - User stories can then proceed in parallel (if staffed)
  - Or sequentially in priority order (P1 → P2 → P3)
- **Polish (Final Phase)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational (Phase 2) - No dependencies on other stories
- **User Story 2 (P2)**: Can start after Foundational (Phase 2) - May integrate with US1 but should be independently testable
- **User Story 3 (P3)**: Can start after Foundational (Phase 2) - May integrate with US1/US2 but should be independently testable

### Within Each User Story

- Review checklists MUST be defined before drafting/localization unless an
  explicit override is recorded in plan.md
- Canonical Korean source before English/Japanese localization
- Terminology decisions before final translation review
- Core lesson content before GitBook formatting review
- Story complete before moving to next priority

### Parallel Opportunities

- All Setup tasks marked [P] can run in parallel
- All Foundational tasks marked [P] can run in parallel (within Phase 2)
- Once Foundational phase completes, all user stories can start in parallel (if team capacity allows)
- All review checks for a user story marked [P] can run in parallel
- Localization tasks for different language files can run in parallel after the
  canonical Korean source is stable
- Different user stories can be worked on in parallel by different contributors

---

## Parallel Example: User Story 1

```bash
# Launch review checks for User Story 1 together:
Task: "Lesson-structure checklist for required sections"
Task: "GitBook Markdown review checklist for headings and links"

# Launch localization tasks after the Korean source is stable:
Task: "Localize English version in [path]"
Task: "Localize Japanese version in [path]"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational (CRITICAL - blocks all stories)
3. Complete Phase 3: User Story 1
4. **STOP and VALIDATE**: Review User Story 1 independently
5. Publish/demo if ready

### Incremental Delivery

1. Complete Setup + Foundational → Foundation ready
2. Add User Story 1 → Review independently → Publish/Demo (MVP)
3. Add User Story 2 → Review independently → Publish/Demo
4. Add User Story 3 → Review independently → Publish/Demo
5. Each story adds value without breaking previous stories

### Parallel Contributor Strategy

With multiple contributors:

1. Team completes Setup + Foundational together
2. Once Foundational is done:
   - Contributor A: User Story 1
   - Contributor B: User Story 2
   - Contributor C: User Story 3
3. Stories complete and align independently

---

## Notes

- [P] tasks = different files, no dependencies
- [Story] label maps task to specific user story for traceability
- Each user story should be independently completable and reviewable
- Verify review criteria before drafting unless plan.md records an explicit override
- Keep glossary, AI safety, and GitBook review tasks with the story that introduces them
- Run multilingual consistency, AI safety, GitBook Markdown, glossary, and extension gates before marking done
- Commit after each task or logical group
- Stop at any checkpoint to validate story independently
- Avoid: vague tasks, same file conflicts, cross-story dependencies that break independence
