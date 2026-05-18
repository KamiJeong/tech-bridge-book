# Tasks: Codex Spec Kit Multi-Agent Workflow With Mandatory Token Analysis

**Input**: Design documents from `specs/001-codex-multi-agent-workflow/`

**Prerequisites**: [plan.md](./plan.md), [spec.md](./spec.md), [research.md](./research.md), [data-model.md](./data-model.md), [contracts/](./contracts), [quickstart.md](./quickstart.md)

**Tests**: Every changed behavior has an independently executable validation task using shell syntax checks, JSON validation, path scans, contract checks, or quickstart dry-runs.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing.

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Create the workflow asset directories and shared token-analysis locations without changing product application code.

- [X] T001 Create `.codex/agents/` directory for project-scoped Codex agents
- [X] T002 Create `.agents/skills/speckit-auto/`, `.agents/skills/speckit-rules/`, `.agents/skills/speckit-guards/scripts/`, and `.agents/skills/speckit-token-observability/` directories
- [X] T003 [P] Ensure `.specify/token-analysis/runs/`, `.specify/token-analysis/baselines/`, and `.specify/token-analysis/comparisons/` directories exist
- [X] T004 [P] Create validation evidence log in `specs/001-codex-multi-agent-workflow/tasks-validation.md` with sections for setup, per-story checks, guard results, token-analysis evidence, and final quickstart validation

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Establish shared rules, contracts, and reusable token observability before any story-specific workflow behavior is implemented.

**Critical**: No user story work should begin until this phase is complete.

- [X] T005 Create `.agents/skills/speckit-token-observability/SKILL.md` with run label format, artifact paths, supported phase capture behavior, unsupported phase estimation behavior, missing token-analyzer behavior, token budget handling, final output summary, and PR body summary rules
- [X] T006 Create `.agents/skills/speckit-rules/SKILL.md` with workflow-wide rules for Spec Kit order, default gated mode, token analysis after every completed phase, missing token data warnings, explicit blocking thresholds, no Claude Code path assumptions, and minimal configuration updates
- [X] T007 Create `.agents/skills/speckit-guards/SKILL.md` documenting each guard script in `.agents/skills/speckit-guards/scripts/`
- [X] T008 Create `.agents/skills/speckit-guards/scripts/record-token-step.sh` to write `.specify/token-analysis/runs/<run-label>/steps/<phase>.json` records matching `specs/001-codex-multi-agent-workflow/contracts/token-step.schema.json`
- [X] T009 Create `.agents/skills/speckit-guards/scripts/generate-token-report.sh` to write `.specify/token-analysis/runs/<run-label>/summary.json`, `.specify/token-analysis/runs/<run-label>/report.md`, and `.specify/token-analysis/runs/<run-label>/quality-notes.md`
- [X] T010 Create `.agents/skills/speckit-guards/scripts/guard-token-analyzer-available.sh` to detect `.specify/extensions/token-analyzer/`, token-analyzer commands, or token-analyzer scripts and recommend `specify extension add token-analyzer` when missing
- [X] T011 Create `.agents/skills/speckit-guards/scripts/guard-no-app-code-change.sh` to fail when protected planning or analysis phases modify application code outside allowed workflow artifact paths
- [X] T012 Create `.agents/skills/speckit-guards/scripts/guard-before-implement.sh` to stop on CRITICAL analyze issues, failed prerequisite checks, high-risk slices, unrelated user changes, or missing token-analyzer in automation modes without approval
- [X] T013 Create `.agents/skills/speckit-guards/scripts/guard-before-commit.sh` to stop on failed validation, unrelated user changes, suspected secrets, or missing token-analyzer when the auto-commit permission flag is enabled without approval
- [X] T014 Create `.agents/skills/speckit-guards/scripts/guard-before-pr.sh` to stop on protected branches, missing or unauthenticated GitHub CLI, unclear base branch, failed validation, unrelated user changes, or missing token-analyzer without approval
- [X] T015 [P] Validate shell syntax for guard scripts with `bash -n .agents/skills/speckit-guards/scripts/*.sh` and record output in `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T016 [P] Validate token step JSON schema with `jq empty specs/001-codex-multi-agent-workflow/contracts/token-step.schema.json` and record output in `specs/001-codex-multi-agent-workflow/tasks-validation.md`

**Checkpoint**: Foundation ready; user story implementation can begin.

---

## Phase 3: User Story 1 - Configure Codex Spec Kit Workflow Assets (Priority: P1) MVP

**Goal**: Required Codex agents, skills, guard conventions, token observability conventions, and AGENTS guidance are present in the expected project locations.

**Independent Test**: Inspect the repository and confirm all required Codex agents, skills, guard scripts, and token-analysis conventions exist without Claude Code path assumptions or unnecessary configuration replacement.

### Tests for User Story 1

- [X] T017 [P] [US1] Add repository path validation commands for `.codex/agents/`, `.agents/skills/`, `.agents/skills/speckit-guards/scripts/`, and `.specify/token-analysis/` to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T018 [P] [US1] Add forbidden path scan command `! rg "\\.claude/" .codex .agents AGENTS.md` to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T019 [P] [US1] Add required agent file existence check for all `.codex/agents/*.toml` files to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T020 [P] [US1] Add required skill file existence check for `.agents/skills/speckit-auto/SKILL.md`, `.agents/skills/speckit-rules/SKILL.md`, `.agents/skills/speckit-guards/SKILL.md`, and `.agents/skills/speckit-token-observability/SKILL.md` to `specs/001-codex-multi-agent-workflow/tasks-validation.md`

### Implementation for User Story 1

- [X] T021 [P] [US1] Create `.codex/agents/speckit-slicer.toml` with role boundary, inputs, outputs, prohibited implementation planning and application code edits, stop conditions, and token analysis after slicing
- [X] T022 [P] [US1] Create `.codex/agents/speckit-scheduler.toml` with dependency graph, conflict matrix, execution plan, strategy decision, stop-and-ask criteria, and token analysis after scheduling
- [X] T023 [P] [US1] Create `.codex/agents/speckit-specifier.toml` with WHAT/WHY-only spec creation responsibilities and token analysis after specify
- [X] T024 [P] [US1] Create `.codex/agents/speckit-clarifier.toml` with options, recommended option, reason, risk level, auto-select behavior, high-risk approval behavior, and token analysis after clarify
- [X] T025 [P] [US1] Create `.codex/agents/speckit-checklister.toml` with spec quality validation responsibilities and token analysis after checklist
- [X] T026 [P] [US1] Create `.codex/agents/speckit-planner.toml` with approved-spec planning responsibilities, no code implementation permission, and token analysis after plan
- [X] T027 [P] [US1] Create `.codex/agents/speckit-tasker.toml` with dependency-ordered task generation responsibilities and token analysis after tasks
- [X] T028 [P] [US1] Create `.codex/agents/speckit-analyzer.toml` with read-focused consistency analysis, CRITICAL/HIGH/MEDIUM/LOW reporting, no application code edits, and token analysis after analyze
- [X] T029 [P] [US1] Create `.codex/agents/speckit-implementer.toml` with tasks.md-only implementation rules, test batching, conflict stop behavior, and token analysis after implement
- [X] T030 [P] [US1] Create `.codex/agents/speckit-reviewer.toml` with diff review against spec, plan, tasks, and constitution plus token analysis after review
- [X] T031 [P] [US1] Create `.codex/agents/speckit-integrator.toml` with cross-slice conflict, contract drift, integration risk, merge readiness checks, and token analysis after integration
- [X] T032 [P] [US1] Create `.codex/agents/speckit-committer.toml` with validation-before-commit, conventional commit default, intended-files-only behavior, secret exclusion, current-run token artifact inclusion, and token analysis before and after commit
- [X] T033 [P] [US1] Create `.codex/agents/speckit-pr-creator.toml` with GitHub CLI draft PR behavior, protected branch stop behavior, PR body token section requirements, PR URL output, and token analysis after PR creation
- [X] T034 [P] [US1] Create `.codex/agents/speckit-token-reporter.toml` with per-slice and full-epic aggregation, baseline comparison, token budget handling, and product artifact read-only constraints
- [X] T035 [US1] Update `AGENTS.md` between SPECKIT markers to reference `specs/001-codex-multi-agent-workflow/plan.md`, `.agents/skills/speckit-auto/SKILL.md`, and `.agents/skills/speckit-token-observability/SKILL.md`
- [X] T036 [US1] Run US1 validation commands from `specs/001-codex-multi-agent-workflow/tasks-validation.md` and append pass/fail evidence to `specs/001-codex-multi-agent-workflow/tasks-validation.md`

**Checkpoint**: User Story 1 is complete when all required agents, skills, guards, token directories, and AGENTS guidance exist and validation commands pass.

---

## Phase 4: User Story 2 - Plan Large Features Through Slices and Scheduling (Priority: P1)

**Goal**: Large requests can be evaluated, sliced, dependency-mapped, conflict-mapped, and assigned an execution strategy before specify.

**Independent Test**: Run the workflow in planning mode for a large request and verify intake artifacts, slice definitions, dependency graph, conflict matrix, execution plan, strategy decision, and token records are produced.

### Tests for User Story 2

- [X] T037 [P] [US2] Add sample large-request fixture to `specs/001-codex-multi-agent-workflow/fixtures/large-feature-request.md`
- [X] T038 [P] [US2] Add expected slicing and scheduling outputs checklist to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T039 [P] [US2] Add validation command that checks intake, slicing, and scheduling token step files under `.specify/token-analysis/runs/<run-label>/steps/` to `specs/001-codex-multi-agent-workflow/tasks-validation.md`

### Implementation for User Story 2

- [X] T040 [US2] Add intake, slicing heuristic, explicit override behavior, and intake artifact requirements to `.agents/skills/speckit-auto/SKILL.md`
- [X] T041 [US2] Add dependency graph, conflict matrix, execution plan, and strategy decision workflow to `.agents/skills/speckit-auto/SKILL.md`
- [X] T042 [US2] Add execution strategy rules for `single-spec`, `sequential`, `foundation-first-then-parallel`, `parallel-safe`, and `stop-and-ask` to `.agents/skills/speckit-rules/SKILL.md`
- [X] T043 [US2] Add token recording instructions for custom phases `intake`, `slicing`, and `scheduling` to `.agents/skills/speckit-token-observability/SKILL.md`
- [X] T044 [US2] Run US2 validation commands from `specs/001-codex-multi-agent-workflow/tasks-validation.md` and append pass/fail evidence to `specs/001-codex-multi-agent-workflow/tasks-validation.md`

**Checkpoint**: User Story 2 is complete when large-request slicing and scheduling behavior is documented, testable, and token-observed.

---

## Phase 5: User Story 3 - Observe Token Usage Across Every Phase (Priority: P1)

**Goal**: Every custom orchestration phase and Spec Kit phase attempts token capture, records exact/parsed/estimated/unavailable data, and generates per-slice and aggregate reports.

**Independent Test**: Complete a plan-only workflow run and confirm every completed phase has a token step file, a per-slice report, and an aggregate epic report under `.specify/token-analysis/`.

### Tests for User Story 3

- [X] T045 [P] [US3] Add token step schema validation command for `.specify/token-analysis/runs/<run-label>/steps/*.json` to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T046 [P] [US3] Add token report artifact validation command for `metadata.json`, `summary.json`, `report.md`, and `quality-notes.md` to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T047 [P] [US3] Add missing token data warning validation command for `.specify/token-analysis/runs/<run-label>/report.md` to `specs/001-codex-multi-agent-workflow/tasks-validation.md`

### Implementation for User Story 3

- [X] T048 [US3] Implement exact, parsed, estimated, and unavailable capture method handling in `.agents/skills/speckit-guards/scripts/record-token-step.sh`
- [X] T049 [US3] Implement artifact path, quality notes, model, token totals, and capture method fields in `.agents/skills/speckit-guards/scripts/record-token-step.sh`
- [X] T050 [US3] Implement per-slice summary aggregation, expensive phase detection, missing data detection, and recommendations in `.agents/skills/speckit-guards/scripts/generate-token-report.sh`
- [X] T051 [US3] Implement aggregate epic report behavior across run directories in `.agents/skills/speckit-guards/scripts/generate-token-report.sh`
- [X] T052 [US3] Implement optional `.specify/token-analysis/token-budget.json` warning and blocking threshold handling in `.agents/skills/speckit-guards/scripts/generate-token-report.sh`
- [X] T053 [US3] Document standard phase token-analyzer usage for `specify`, `plan`, `tasks`, and `implement` in `.agents/skills/speckit-token-observability/SKILL.md`
- [X] T054 [US3] Document custom and unsupported phase estimation behavior for `intake`, `slicing`, `scheduling`, `clarify`, `checklist`, `analyze`, `integration`, `review`, `commit`, and `PR creation` in `.agents/skills/speckit-token-observability/SKILL.md`
- [X] T055 [US3] Run US3 validation commands from `specs/001-codex-multi-agent-workflow/tasks-validation.md` and append pass/fail evidence to `specs/001-codex-multi-agent-workflow/tasks-validation.md`

**Checkpoint**: User Story 3 is complete when token recording and reporting can represent every required phase without silently skipping missing data.

---

## Phase 6: User Story 4 - Execute Guarded Spec Kit Slice Workflow (Priority: P2)

**Goal**: Each approved slice can run through the guarded Spec Kit phase sequence with approval gates and stop conditions.

**Independent Test**: Run a low-risk slice through gated mode and verify token analysis after every phase, implementation waits for approval, CRITICAL issues stop the flow, and token analysis does not mutate product artifacts.

### Tests for User Story 4

- [X] T056 [P] [US4] Add gated-mode dry-run checklist for specify, clarify, checklist, plan, tasks, analyze, implement, and review phases to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T057 [P] [US4] Add CRITICAL analyze issue stop-condition fixture to `specs/001-codex-multi-agent-workflow/fixtures/critical-analyze-result.md`
- [X] T058 [P] [US4] Add token-analysis read-only validation command comparing product artifact status before and after token recording to `specs/001-codex-multi-agent-workflow/tasks-validation.md`

### Implementation for User Story 4

- [X] T059 [US4] Add per-slice Spec Kit phase sequence and default gated approval behavior to `.agents/skills/speckit-auto/SKILL.md`
- [X] T060 [US4] Add stop conditions for CRITICAL analyze issues, failed tests, high-risk slices, unrelated user changes, unclear base branch, and missing token-analyzer automation approval to `.agents/skills/speckit-rules/SKILL.md`
- [X] T061 [US4] Implement analyze-result, risk-level, unrelated-change, test-status, and token-analyzer checks in `.agents/skills/speckit-guards/scripts/guard-before-implement.sh`
- [X] T062 [US4] Implement product-artifact read-only checks for token analysis in `.agents/skills/speckit-guards/scripts/guard-no-app-code-change.sh`
- [X] T063 [US4] Add review phase responsibilities, test evidence requirements, risk reporting, missing coverage reporting, and regression concern reporting to `.codex/agents/speckit-reviewer.toml`
- [X] T064 [US4] Run US4 validation commands from `specs/001-codex-multi-agent-workflow/tasks-validation.md` and append pass/fail evidence to `specs/001-codex-multi-agent-workflow/tasks-validation.md`

**Checkpoint**: User Story 4 is complete when guarded slice execution is documented, guarded by scripts, and independently dry-runnable.

---

## Phase 7: User Story 5 - Safely Commit and Create Draft PRs With Token Summary (Priority: P3)

**Goal**: Multiple slices can optionally be integrated, committed, pushed, and opened as a draft PR with token analysis summary after validation.

**Independent Test**: In explicitly requested auto-pr mode with valid GitHub CLI, confirm commits exclude unrelated changes and the draft PR body contains the required Token Analysis section.

### Tests for User Story 5

- [X] T065 [P] [US5] Add PR body token section validation command matching `specs/001-codex-multi-agent-workflow/contracts/pr-token-section-contract.md` to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T066 [P] [US5] Add protected branch stop-condition validation for `main`, `master`, and `develop` to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T067 [P] [US5] Add intended-files-only commit validation checklist to `specs/001-codex-multi-agent-workflow/tasks-validation.md`

### Implementation for User Story 5

- [X] T068 [US5] Add integration phase workflow for cross-slice conflicts, shared contract drift, integration risks, and merge readiness to `.agents/skills/speckit-auto/SKILL.md`
- [X] T069 [US5] Add commit phase workflow using explicit auto-commit permission flag, validation pass requirement, conventional commit default, intended-files-only behavior, secret exclusion, and current-run token artifact inclusion to `.agents/skills/speckit-auto/SKILL.md`
- [X] T070 [US5] Add draft PR workflow using GitHub CLI, protected branch restrictions, token report links or paths, reviewer notes, risks, changed files, tests, and PR URL output to `.agents/skills/speckit-auto/SKILL.md`
- [X] T071 [US5] Implement validation-pass, intended-files-only, secret scan, current-run token artifact, and missing token-analyzer checks in `.agents/skills/speckit-guards/scripts/guard-before-commit.sh`
- [X] T072 [US5] Implement protected branch, GitHub CLI availability, GitHub CLI authentication, unclear base branch, unrelated changes, and missing token-analyzer checks in `.agents/skills/speckit-guards/scripts/guard-before-pr.sh`
- [X] T073 [US5] Add required PR Token Analysis section template and field rules to `.codex/agents/speckit-pr-creator.toml`
- [X] T074 [US5] Run US5 validation commands from `specs/001-codex-multi-agent-workflow/tasks-validation.md` and append pass/fail evidence to `specs/001-codex-multi-agent-workflow/tasks-validation.md`

**Checkpoint**: User Story 5 is complete when commit and draft PR automation are guarded, explicitly permissioned, and token-summary aware.

---

## Phase 8: Polish & Cross-Cutting Concerns

**Purpose**: Final consistency, report updates, and full workflow validation.

- [X] T075 [P] Run `bash -n .agents/skills/speckit-guards/scripts/*.sh` and append output to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T076 [P] Run `jq empty specs/001-codex-multi-agent-workflow/contracts/token-step.schema.json .specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/steps/*.json` and append output to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T077 [P] Run `! rg "\\.claude/" .codex .agents AGENTS.md` and append expected no-match evidence to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T078 Run quickstart validation from `specs/001-codex-multi-agent-workflow/quickstart.md` and append output to `specs/001-codex-multi-agent-workflow/tasks-validation.md`
- [X] T079 Update `.specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/steps/tasks.json` with tasks phase token analysis after task generation
- [X] T080 Update `.specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/summary.json`, `.specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/report.md`, and `.specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/quality-notes.md` to include the tasks phase

---

## Dependencies & Execution Order

### Phase Dependencies

- Setup (Phase 1): No dependencies.
- Foundational (Phase 2): Depends on Phase 1 and blocks all user stories.
- User Story 1 (Phase 3): Depends on Phase 2 and is the MVP.
- User Story 2 (Phase 4): Depends on Phase 2; may run in parallel with US1 after shared foundations exist.
- User Story 3 (Phase 5): Depends on Phase 2; should complete before relying on automated workflow modes.
- User Story 4 (Phase 6): Depends on US1 and US3 because guarded execution needs agents and token observability.
- User Story 5 (Phase 7): Depends on US1, US3, and US4 because publishing requires agents, token summaries, and guard behavior.
- Polish (Phase 8): Depends on all selected stories.

### User Story Dependencies

- US1: Independent after foundational tasks; MVP scope.
- US2: Independent after foundational tasks; uses slicer and scheduler agent definitions from US1 when available.
- US3: Independent after foundational tasks; required before automation can be trusted.
- US4: Requires US1 and US3.
- US5: Requires US1, US3, and US4.

### Parallel Opportunities

- T003 and T004 can run in parallel after T001 and T002.
- T015 and T016 can run in parallel after T008 through T014.
- T017 through T020 can run in parallel.
- T021 through T034 can run in parallel because each task writes a different agent file.
- T037 through T039 can run in parallel.
- T045 through T047 can run in parallel.
- T056 through T058 can run in parallel.
- T065 through T067 can run in parallel.
- T075 through T077 can run in parallel.

## Parallel Example: User Story 1

```text
Task: "T021 Create .codex/agents/speckit-slicer.toml"
Task: "T022 Create .codex/agents/speckit-scheduler.toml"
Task: "T023 Create .codex/agents/speckit-specifier.toml"
Task: "T024 Create .codex/agents/speckit-clarifier.toml"
Task: "T025 Create .codex/agents/speckit-checklister.toml"
Task: "T026 Create .codex/agents/speckit-planner.toml"
Task: "T027 Create .codex/agents/speckit-tasker.toml"
Task: "T028 Create .codex/agents/speckit-analyzer.toml"
Task: "T029 Create .codex/agents/speckit-implementer.toml"
Task: "T030 Create .codex/agents/speckit-reviewer.toml"
Task: "T031 Create .codex/agents/speckit-integrator.toml"
Task: "T032 Create .codex/agents/speckit-committer.toml"
Task: "T033 Create .codex/agents/speckit-pr-creator.toml"
Task: "T034 Create .codex/agents/speckit-token-reporter.toml"
```

## Implementation Strategy

### MVP First

1. Complete Phase 1 setup.
2. Complete Phase 2 foundational skills and guard scripts.
3. Complete Phase 3 User Story 1.
4. Stop and validate required Codex agents, skills, guards, token directories, and AGENTS guidance.

### Incremental Delivery

1. Deliver US1 to make workflow assets visible and discoverable.
2. Deliver US2 to make large-feature intake and scheduling usable.
3. Deliver US3 to make token observability complete across phases.
4. Deliver US4 to make guarded implementation and review usable.
5. Deliver US5 to add optional integration, commit, push, and draft PR automation.

### Validation Strategy

1. Run story-specific validation commands after each story phase.
2. Record evidence in `specs/001-codex-multi-agent-workflow/tasks-validation.md`.
3. Run the quickstart validation before marking the feature complete.
4. Do not proceed past guard failures without an explicit documented override.
