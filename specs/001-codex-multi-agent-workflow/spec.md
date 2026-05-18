# Feature Specification: Codex Spec Kit Multi-Agent Workflow With Mandatory Token Analysis

**Feature Branch**: `001-codex-multi-agent-workflow`

**Created**: 2026-05-18

**Status**: Draft

**Input**: User description: "Codex-specific Spec Kit multi-agent workflow setup with mandatory token analysis integrated into every Spec Kit-related phase and custom orchestration phase."

## Clarifications

### Session 2026-05-18

- Q: Should `auto-commit` be treated as a standalone execution mode or as an explicit permission for commit automation? → A: `auto-commit` is an explicit permission flag, not a standalone execution mode.
- Q: What default rule should decide whether a large feature request is split into slices? → A: Split when a request spans multiple independent deliverables, shared contracts, or more than one implementation area; allow explicit override.

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Configure Codex Spec Kit Workflow Assets (Priority: P1)

A repository maintainer can add project-scoped Codex agents, skills, guard conventions, and token observability conventions so future Spec Kit work follows one consistent Codex-native workflow.

**Why this priority**: The workflow cannot be used safely until the required Codex agents, skills, and project guidance exist in the expected project locations.

**Independent Test**: Can be tested by inspecting the repository and confirming all required Codex agents, skills, guard scripts, and token-analysis conventions are present without Claude Code path assumptions or unnecessary replacement of existing configuration.

**Acceptance Scenarios**:

1. **Given** the repository has existing Spec Kit and Codex configuration, **When** the workflow setup is added, **Then** Codex agents are available under `.codex/agents/` and Codex skills are available under `.agents/skills/`.
2. **Given** existing repository configuration files are present, **When** the workflow setup is added, **Then** existing configuration is preserved unless a minimal, documented update is required for the workflow.
3. **Given** a maintainer reviews project-level guidance, **When** they open `AGENTS.md`, **Then** the guidance points Codex users to the multi-agent workflow and token observability rules.

---

### User Story 2 - Plan Large Features Through Slices and Scheduling (Priority: P1)

A maintainer can submit a large feature request and receive a decision on whether it should run as a single spec or be split into smaller approved slices with dependencies, conflicts, and execution strategy clearly documented.

**Why this priority**: Large requests create the highest risk of scope drift, hidden conflicts, and excessive token usage, so intake, slicing, and scheduling must happen before downstream Spec Kit phases.

**Independent Test**: Can be tested by running the workflow in planning mode for a large request and verifying that intake artifacts, slice definitions, dependency graph, conflict matrix, execution plan, and strategy decision are produced.

**Acceptance Scenarios**:

1. **Given** a large feature request, **When** the workflow begins, **Then** it determines whether the request should be split before running specify.
2. **Given** slicing is needed, **When** intake and slicing complete, **Then** each slice is small enough to become an independently approved Spec Kit workflow input.
3. **Given** slices have been identified, **When** scheduling completes, **Then** the workflow records one of these strategies: `single-spec`, `sequential`, `foundation-first-then-parallel`, `parallel-safe`, or `stop-and-ask`.
4. **Given** a request spans multiple independent deliverables, shared contracts, or more than one implementation area, **When** no explicit override is provided, **Then** the workflow treats the request as a slicing candidate.

---

### User Story 3 - Observe Token Usage Across Every Phase (Priority: P1)

A maintainer can review token usage for every custom orchestration phase and every Spec Kit phase, including clear warnings when exact token data is unavailable or the token-analyzer extension is missing.

**Why this priority**: Token analysis is a required observability step for this workflow and must not silently disappear, especially before automated implementation, commit, or PR modes.

**Independent Test**: Can be tested by completing a plan-only workflow run and confirming each completed phase has a token step file, a per-slice report, and an aggregate epic report under `.specify/token-analysis/`.

**Acceptance Scenarios**:

1. **Given** a phase completes, **When** token data is exact, parsed, estimated, or unavailable, **Then** a phase step file is created with the capture method and any missing-data notes.
2. **Given** token-analyzer supports a standard Spec Kit phase, **When** that phase completes, **Then** the workflow attempts to use the supported token-analyzer command or hook.
3. **Given** a custom or unsupported phase completes, **When** exact capture is unavailable, **Then** the workflow records an estimate with phase name, run label, timestamp, model if known, artifact paths, estimated tokens, and explanatory notes.
4. **Given** token-analyzer is unavailable, **When** plan-only or gated mode runs, **Then** the workflow continues with a clear warning.
5. **Given** token-analyzer is unavailable, **When** auto-implement, auto-pr, or a run with the auto-commit permission flag is requested, **Then** the workflow stops before automation and asks for explicit user approval to continue.

---

### User Story 4 - Execute Guarded Spec Kit Slice Workflow (Priority: P2)

A maintainer can run each approved slice through specify, clarify, checklist, plan, tasks, analyze, implement, and review with safeguards that stop unsafe automation and preserve product artifacts from token-analysis mutation.

**Why this priority**: The workflow must be useful beyond planning while still enforcing Spec Kit order, review discipline, and safety constraints.

**Independent Test**: Can be tested by running a low-risk slice through gated mode and verifying token analysis runs after every phase, implementation waits for approval, CRITICAL issues stop the flow, and product artifacts are unchanged by token analysis.

**Acceptance Scenarios**:

1. **Given** an approved slice, **When** the per-slice workflow runs, **Then** the phases occur in this order: specify, clarify, checklist, plan, tasks, analyze, implement, review.
2. **Given** analyze reports a CRITICAL issue, **When** implementation would begin, **Then** the workflow stops and reports the blocker.
3. **Given** tests fail during implementation or review, **When** automation would continue, **Then** the workflow stops and reports the failing tests.
4. **Given** token analysis runs for a phase, **When** it records results, **Then** it writes only token-analysis artifacts and does not modify product specs, plans, tasks, or implementation code.

---

### User Story 5 - Safely Commit and Create Draft PRs With Token Summary (Priority: P3)

A maintainer can optionally integrate multiple slices, commit intended files, push a feature branch, and create a draft PR that includes changed files, risks, test results, reviewer notes, and token analysis summary.

**Why this priority**: Publishing is valuable after validation, but it is lower priority than creating a safe workflow and observing token usage.

**Independent Test**: Can be tested in auto-pr mode with explicit approval and a valid GitHub CLI session by confirming commits exclude unrelated changes and the draft PR body contains the required token analysis section.

**Acceptance Scenarios**:

1. **Given** multiple slices are implemented, **When** integration runs, **Then** cross-slice conflicts, contract drift, integration risks, and merge readiness are reported before commit or PR creation.
2. **Given** validation has passed, **When** commit mode runs, **Then** only intended files are committed with a conventional commit message and current-run token-analysis artifacts.
3. **Given** draft PR creation runs, **When** the PR body is generated, **Then** it includes a `Token Analysis` section with run label, token report, total tokens, most expensive phase, missing token data, budget status, and notes.
4. **Given** the current branch is `main`, `master`, or `develop`, **When** push or PR automation is requested, **Then** the workflow stops and reports that publishing from protected base branches is not allowed.

### Edge Cases

- Token-analyzer extension directory is missing, commands are unavailable, and scripts cannot be found.
- A standard token-analyzer hook exists for some phases but not all required phases.
- Exact token counts are unavailable because model or runtime usage data is not exposed.
- Token budget configuration is absent.
- Token budget warning thresholds are exceeded.
- Token budget blocking thresholds are explicitly configured and exceeded.
- Missing token data occurs in one or more phases.
- A user requests auto-pr without explicitly allowing automated implementation, commit, push, and draft PR creation.
- Slices appear parallel-safe but share files, contracts, configuration, or repository state that could conflict.
- Unrelated user changes are present before implementation, commit, or PR creation.
- GitHub CLI is missing, unauthenticated, or pointed at an unclear remote.
- Existing Codex, Spec Kit, or project configuration already defines similarly named assets.

### UX, Accessibility & Performance Expectations *(mandatory for user-facing changes)*

- **UX Consistency**: N/A. The feature is a developer workflow and repository guidance setup, not an end-user interface.
- **Accessibility**: Generated Markdown reports, PR body sections, and guidance must use clear headings, readable tables or lists, and text-only warnings that do not depend on color.
- **Performance**: Workflow checks and token report generation should complete in under 30 seconds for a typical single-slice run excluding the underlying Spec Kit phase work.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: The workflow MUST define project-scoped Codex agents under `.codex/agents/` for slicer, scheduler, specifier, clarifier, checklister, planner, tasker, analyzer, implementer, reviewer, integrator, committer, PR creator, and token reporter roles.
- **FR-002**: Each Codex agent definition MUST state its responsibility boundary and token-analysis obligation for its phase.
- **FR-003**: The slicer agent MUST split large feature requests into smaller Spec Kit-ready slices, produce intake artifacts, avoid implementation plans, avoid application code edits, and trigger token analysis after slicing.
- **FR-003a**: The slicer agent MUST treat a request as a slicing candidate when it spans multiple independent deliverables, shared contracts, or more than one implementation area, unless the user or workflow explicitly overrides the decision.
- **FR-004**: The scheduler agent MUST build a dependency graph, conflict matrix, execution plan, and execution strategy decision, then trigger token analysis after scheduling.
- **FR-005**: The specifier agent MUST convert one approved slice into a WHAT/WHY-focused Spec Kit specification and trigger token analysis after specify.
- **FR-006**: The clarifier agent MUST present clarification options with recommended option, reason, risk level, and auto-select eligibility; low-risk recommended options must be recorded as accepted assumptions, while high-risk decisions must require user approval.
- **FR-007**: The checklister, planner, tasker, analyzer, implementer, reviewer, integrator, committer, PR creator, and token reporter agents MUST each enforce the responsibility and safety constraints described by their role before reporting completion.
- **FR-008**: The workflow MUST define Codex skills under `.agents/skills/` for auto orchestration, workflow rules, safety guards, and token observability.
- **FR-009**: The auto orchestration skill MUST cover intake, slicing, scheduling, per-slice Spec Kit workflow, implementation, review, integration, token reporting, commit, and PR creation.
- **FR-010**: The token observability skill MUST define when token analysis runs, run-label generation, artifact locations, unsupported phase handling, missing token-analyzer behavior, final-output summary requirements, and PR-body summary requirements.
- **FR-011**: The guard skill MUST provide scripts for no-application-code-change checks, pre-implement checks, pre-commit checks, pre-PR checks, token-analyzer availability checks, token step recording, and token report generation.
- **FR-012**: Before any full workflow starts, the workflow MUST check whether token-analyzer appears installed by verifying at least one of the extension directory, available token-analyzer commands, or available token-analyzer scripts.
- **FR-013**: If token-analyzer is missing, the workflow MUST recommend `specify extension add token-analyzer`.
- **FR-014**: If token-analyzer is missing in `plan-only` or `gated` mode, the workflow MUST continue only after reporting a clear warning.
- **FR-015**: If token-analyzer is missing in `auto-implement`, `auto-pr`, or any mode where the `auto-commit` permission flag is enabled, the workflow MUST stop before automation and ask for explicit user approval before continuing.
- **FR-016**: The workflow MUST attempt to record token usage after each custom orchestration phase: intake, slicing, scheduling, integration, review, commit, and PR creation.
- **FR-017**: The workflow MUST attempt to record token usage after each Spec Kit phase: specify, clarify, checklist, plan, tasks, analyze, and implement.
- **FR-018**: For standard token-analyzer-supported phases, including specify, plan, tasks, and implement, the workflow MUST use the token-analyzer command or supported hook when available.
- **FR-019**: For unsupported or optional phases, the workflow MUST record exact data when available or estimated data when exact capture is unavailable.
- **FR-020**: Token step files MUST be stored at `.specify/token-analysis/runs/<run-label>/steps/<phase>.json`.
- **FR-021**: Each token step file MUST include phase, command or agent name, run label, slice id, timestamp, model if known, input tokens if known, output tokens if known, total tokens if known, estimated tokens when exact values are unavailable, artifact paths, quality notes if available, and capture method.
- **FR-022**: Capture method MUST be one of `exact`, `parsed`, `estimated`, or `unavailable`.
- **FR-023**: Token analysis artifacts MUST use run labels formatted as `<date>-<epic-slug>-<slice-id>-<mode>`, such as `2026-05-18-admin-backoffice-s01-gated`.
- **FR-024**: Token analysis artifacts MUST include metadata, per-phase step files, summary, report, quality notes, comparisons directory, and baselines directory under `.specify/token-analysis/`.
- **FR-025**: At the end of each slice, the workflow MUST generate a per-slice token summary with per-phase breakdown, unusually expensive phases, missing token data, and token-reduction recommendations.
- **FR-026**: At the end of a full epic, the workflow MUST generate an aggregate token report with totals by slice, totals by phase, sequential versus parallel-safe cost comparison when data exists, and baseline comparison when a baseline exists.
- **FR-027**: If `.specify/token-analysis/token-budget.json` exists, the workflow MUST use it for optional warning and blocking thresholds.
- **FR-028**: If no token budget configuration exists, the workflow MUST proceed without budget enforcement while still warning about missing token data by default.
- **FR-029**: Warning thresholds MUST warn without blocking, and blocking thresholds MUST block only when explicitly configured.
- **FR-030**: Missing token data MUST be reported clearly and MUST NOT silently pass.
- **FR-031**: Token analysis MUST be read-only with respect to product artifacts and MUST NOT mutate specs, plans, tasks, or implementation code.
- **FR-032**: The workflow MUST support `plan-only`, `gated`, `auto-implement`, and `auto-pr` execution modes.
- **FR-033**: The default execution mode MUST be gated.
- **FR-034**: In `plan-only` mode, the workflow MUST run slicing, scheduling, specify, clarify, checklist, plan, tasks, analyze, token analysis after each phase, and token reporting without implementation.
- **FR-035**: In `gated` mode, the workflow MUST run through analyze, run token analysis after each phase, and ask for approval before implementation, commit, and PR unless explicitly allowed.
- **FR-036**: In `auto-implement` mode, the workflow MUST implement only if analyze passes and the slice is low risk, and MUST NOT auto-commit or auto-create PR unless explicitly requested through explicit automation permissions.
- **FR-037**: In `auto-pr` mode, the workflow MUST implement, validate, token-report, commit, push, and create a draft PR only when explicitly requested.
- **FR-038**: The workflow MUST stop on CRITICAL analyze issues, failed tests, high-risk slices, unrelated user changes, unclear base branch, missing or unauthenticated GitHub CLI for PR mode, and explicitly configured blocking token budgets.
- **FR-039**: PR bodies MUST include a `Token Analysis` section with run label, token report, total tokens, most expensive phase, missing token data, token budget status, and notes.
- **FR-040**: Commit behavior MUST use conventional commits by default, commit only after validation passes, include only intended files, avoid secrets, include only current-run token-analysis artifacts, and exclude temporary raw CLI response files unless explicitly required.
- **FR-041**: PR behavior MUST use GitHub CLI, create draft PRs by default, avoid direct pushes to `main`, `master`, or `develop`, include token report links or paths, and print PR URLs after creation.
- **FR-042**: The workflow MUST treat `auto-commit` as an explicit permission flag that can be enabled for `gated` or `auto-implement` runs after review and validation pass; it MUST NOT be treated as a standalone execution mode.
- **FR-043**: The setup MUST NOT assume Claude Code `.claude/` paths.
- **FR-044**: The setup MUST preserve existing Codex, Spec Kit, and project configuration unless minimal additions or updates are necessary for this workflow.

### Security, Privacy & Data *(mandatory)*

- **Data Classification**: Internal developer workflow metadata, repository paths, token usage estimates, command names, quality notes, and PR summary data.
- **Trust Boundaries**: Local repository state, Codex agents and skills, Spec Kit extension hooks, Git commands, GitHub CLI, and GitHub remote publishing.
- **Retention & Minimization**: Store only token-analysis metadata needed for observability, comparison, budgets, and review. Avoid storing raw prompts, secrets, raw CLI responses, or unrelated repository state.
- **Secrets & Permissions**: PR creation requires an authenticated GitHub CLI session with repository permissions. Token reports must not include credentials, tokens, private keys, or secret environment values.
- **External Services**: GitHub may be used for push and draft PR creation only in explicitly requested PR automation modes.

### Key Entities *(include if feature involves data)*

- **Epic**: A large user request that may contain one or more slices and has aggregate token reporting.
- **Slice**: A smaller approved unit of work that can run through Spec Kit phases independently.
- **Run Label**: Stable identifier for token-analysis artifacts using date, epic slug, slice id, and mode.
- **Execution Strategy**: Workflow decision that determines single-spec, sequential, foundation-first-then-parallel, parallel-safe, or stop-and-ask behavior.
- **Token Step Record**: Per-phase JSON artifact containing token usage data, capture method, artifacts, and notes.
- **Token Report**: Human-readable and machine-readable summary of token usage for a slice or full epic.
- **Token Budget**: Optional configuration that defines warning and blocking thresholds.
- **Guard Result**: Outcome from a safety check before implementation, commit, or PR creation.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: 100% of required Codex agent definitions are present under `.codex/agents/` after setup.
- **SC-002**: 100% of required Codex skills and guard scripts are present under `.agents/skills/` after setup.
- **SC-003**: 100% of completed workflow phases produce a token step record or an explicit missing-data record under `.specify/token-analysis/`.
- **SC-004**: A plan-only single-slice workflow produces a per-slice token report and an aggregate epic token report without modifying product implementation code.
- **SC-005**: Missing token-analyzer availability is detected before a full workflow starts and produces the correct warning or stop behavior for the selected mode.
- **SC-006**: Auto-implement, auto-pr, and any run with the auto-commit permission flag stop before automation when token-analyzer is missing unless the user explicitly approves continuing.
- **SC-007**: 100% of generated PR bodies in PR mode include the required Token Analysis section fields.
- **SC-008**: Token budget warnings do not block workflow progress unless explicit blocking thresholds are configured.
- **SC-009**: Safety guards prevent publishing from `main`, `master`, or `develop` in 100% of attempted PR automation runs.
- **SC-010**: No generated workflow asset references `.claude/` paths.

## Assumptions

- The repository already uses Spec Kit and may have existing extension hook configuration.
- The token-analyzer extension is the preferred source for standard phase token data when available.
- Exact runtime token usage may not always be available from Codex or local tools, so estimated records are acceptable when clearly marked.
- The workflow artifacts are intended for repository maintainers and AI coding agents, not end users.
- Draft PR creation is optional and requires explicit user request plus a working authenticated GitHub CLI session.
- Guard scripts may be shell scripts because the project initialization uses shell scripting.
- Existing Spec Kit phase skills remain the canonical implementation for their phases; this feature adds Codex orchestration, agents, guards, and token observability conventions around them.

## Constitution Alignment *(mandatory)*

- **Spec Before Code**: This specification is the source of truth for the workflow setup before agents, skills, scripts, and guidance are added or changed.
- **Explicit Overrides**: None.
- **Single Source of Truth**: Scope changes must update this `spec.md`, downstream `plan.md`, `tasks.md`, and generated token-observability guidance.
- **Local-First/Cost-Aware**: Token analysis runs locally where possible, stores minimal observability artifacts, supports estimates when exact data is unavailable, and treats high usage as advisory unless explicit blocking thresholds are configured.
