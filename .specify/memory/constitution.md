<!--
Sync Impact Report
Version change: template -> 1.0.0
Modified principles:
- Placeholder principles -> I. Spec Before Code
- Placeholder principles -> II. Single Source of Truth
- Placeholder principles -> III. Explicit Overrides Only
- Placeholder principles -> IV. Version-Pinned Stack
- Placeholder principles -> V. Type Safety
- Placeholder principles -> VI. Code Quality
- Placeholder principles -> VII. Testing Standards
- Placeholder principles -> VIII. UX Consistency
- Placeholder principles -> IX. Design System and Storybook Governance
- Placeholder principles -> X. Accessibility
- Placeholder principles -> XI. Performance Budgets
- Placeholder principles -> XII. Security and Privacy by Default
- Placeholder principles -> XIII. Clear Module Boundaries
- Placeholder principles -> XIV. Local-First and Cost-Aware Development
- Placeholder principles -> XV. AI Agent Governance
- Placeholder principles -> XVI. Definition of Done
Added sections:
- Operational Constraints
- Spec-Driven Workflow and Quality Gates
Removed sections:
- None
Templates requiring updates:
- ✅ updated .specify/templates/plan-template.md
- ✅ updated .specify/templates/spec-template.md
- ✅ updated .specify/templates/tasks-template.md
- ✅ checked .specify/templates/commands/*.md (directory absent)
- ✅ updated AGENTS.md
Follow-up TODOs:
- None
-->

# AI-Assisted Spec-Driven Development Constitution

## Core Principles

### I. Spec Before Code
Every feature, fix, refactor, and extension MUST begin with an approved
specification or an explicitly documented override. Code generation,
implementation planning, task creation, and extension quality gates MUST trace
back to a spec artifact before source files are changed.

**Rationale**: The specification is the contract between product intent,
engineering design, AI agents, and validation. Starting with code creates
unreviewable assumptions and weakens later verification.

**Enforcement guidance**: `/speckit.specify` MUST capture user value,
requirements, success criteria, risks, and open questions. `/speckit.clarify`
MUST resolve material ambiguity before planning. `/speckit.plan`,
`/speckit.tasks`, and `/speckit.implement` MUST refuse work that lacks a spec,
unless the override is recorded in the plan and reviewed at completion.

**Violation examples**:
- Implementing a UI flow directly from chat without creating or updating
  `spec.md`.
- Adding a dependency or data model during implementation that was not covered
  in `plan.md`.
- Marking a requirement complete when no acceptance scenario verifies it.

### II. Single Source of Truth
The active feature directory under `specs/` MUST be the source of truth for
scope, requirements, architecture, tasks, acceptance criteria, and verification
evidence. Generated or downstream artifacts MUST not contradict `spec.md`,
`plan.md`, `tasks.md`, contracts, or this constitution.

**Rationale**: A single source of truth prevents drift between instructions,
agent memory, generated tasks, and implementation reality.

**Enforcement guidance**: When conflict exists, this constitution has highest
authority, then the approved spec, then the plan, then tasks. Any change in code
scope MUST update the owning artifact in the same change set. `/speckit.analyze`
and extension gates SHOULD report contradictions as blockers.

**Violation examples**:
- A task says tests are optional while the spec marks the story as regulated or
  security-sensitive.
- README instructions describe a different architecture from `plan.md`.
- A contract file is changed without updating the related requirement.

### III. Explicit Overrides Only
Teams and AI agents MUST not silently bypass constitutional rules, approved
requirements, version constraints, task dependencies, review gates, or quality
checks. Overrides MUST be explicit, scoped, time-bounded where applicable, and
recorded with the reason, owner, impact, and follow-up validation.

**Rationale**: Hidden exceptions become permanent policy and make automated
quality gates unreliable.

**Enforcement guidance**: Overrides MUST be documented in `plan.md` under
Complexity Tracking or an equivalent feature-level decision log. `/speckit.plan`
MUST identify the simpler alternative rejected. `/speckit.implement` MUST
preserve the override record and reference it in completion notes.

**Violation examples**:
- Skipping accessibility tests because the UI is "temporary" without recording
  an approved exception.
- Using an unpinned package because installation was faster.
- Ignoring a failing quality gate without a documented owner and remediation.

### IV. Version-Pinned Stack
Language runtimes, frameworks, build tools, UI libraries, testing tools, and
externally generated APIs MUST be version-pinned before implementation. Plans
MUST use current verified versions or record a documented constraint when a
legacy version is required.

**Rationale**: AI-generated code is vulnerable to stale APIs and incompatible
examples. Pinning versions makes generated implementation, tests, and quality
gates reproducible.

**Enforcement guidance**: `/speckit.plan` MUST list exact versions or version
ranges with lockfile strategy. Version Guard SHOULD run before planning, before
implementation, and after implementation when configured. Code MUST not use APIs
that are incompatible with the pinned versions.

**Violation examples**:
- Writing React, Next.js, OpenAI API, or Storybook code without identifying the
  project version.
- Depending on latest package behavior without a lockfile or constraint.
- Copying API patterns from outdated documentation.

### V. Type Safety
Production code MUST use the strongest practical type system available in the
selected stack. Public module boundaries, API contracts, data models, component
props, environment configuration, and persisted payloads MUST be typed and
validated at runtime where untrusted data enters the system.

**Rationale**: Type safety reduces ambiguity for humans and AI agents, catches
integration errors earlier, and protects module contracts as the codebase
evolves.

**Enforcement guidance**: `/speckit.plan` MUST identify type-check commands.
`/speckit.tasks` MUST include tasks for contract types, schema validation, and
type-check execution when applicable. `any`, unchecked casts, disabled strict
mode, or equivalent escapes MUST have narrow justification.

**Violation examples**:
- Accepting API input without schema validation.
- Exporting an untyped shared helper across module boundaries.
- Disabling type errors instead of correcting the data model.

### VI. Code Quality
Code MUST be simple, cohesive, readable, formatted, linted, and aligned with
existing repository patterns. Implementations MUST prefer established local
abstractions over new patterns unless the plan documents why the existing
approach does not fit.

**Rationale**: Spec-driven work only remains maintainable when implementation
quality is predictable and easy to review.

**Enforcement guidance**: `/speckit.plan` MUST name formatting, linting, and
static analysis commands. `/speckit.tasks` MUST include quality tasks for each
story or cross-cutting phase. `/speckit.implement` MUST avoid unrelated
refactors and MUST not hide complexity behind generic helper layers.

**Violation examples**:
- Introducing a second state-management style for one feature.
- Adding broad utility functions with no direct feature need.
- Leaving lint, formatting, or dead-code failures unresolved.

### VII. Testing Standards
Every changed behavior MUST have tests at the lowest effective level, and every
user story MUST have an independently executable verification path. Tests MUST
be written before or alongside implementation and MUST fail for the intended
reason before the implementation is accepted when test-first sequencing is
practical.

**Rationale**: Tests convert the spec into executable evidence and protect
against phantom completion by AI agents.

**Enforcement guidance**: `/speckit.specify` MUST define independent tests for
each user story. `/speckit.tasks` MUST include unit, contract, integration,
end-to-end, accessibility, or visual-regression tasks according to risk.
Skipping tests MAY occur only through an explicit override with manual
verification evidence and follow-up risk accepted by an owner.

**Violation examples**:
- Marking a story complete based only on manual inspection.
- Updating shared validation logic without unit or contract coverage.
- Writing tests that assert implementation details instead of user-visible
  outcomes or stable contracts.

### VIII. UX Consistency
User-facing work MUST follow the approved product flows, information
architecture, interaction patterns, content tone, responsive behavior, and error
states defined in the spec and design system. New UI patterns MUST be justified
in the plan and reviewed against existing product behavior.

**Rationale**: Consistent UX lowers cognitive load and prevents feature work
from degrading product coherence over time.

**Enforcement guidance**: `/speckit.specify` MUST capture key journeys, states,
and success criteria. `/speckit.plan` MUST identify affected surfaces and UX
constraints. `/speckit.tasks` MUST include responsive, empty, loading, error,
and edge-state implementation and verification tasks when UI is changed.

**Violation examples**:
- Adding a modal flow where the product uses inline editing for the same task.
- Shipping a desktop-only layout for a feature that must work on mobile.
- Omitting empty, loading, disabled, and error states.

### IX. Design System and Storybook Governance
Reusable UI MUST be built from the approved design system primitives. New
components, variants, tokens, or interaction patterns MUST be represented in
Storybook or the repository's equivalent component catalog before they are
treated as reusable product surface.

**Rationale**: Design system governance keeps UI change reviewable, reusable,
and consistent across features.

**Enforcement guidance**: `/speckit.plan` MUST identify design system impact.
`/speckit.tasks` MUST include Storybook stories, visual states, token updates,
and visual-regression coverage when a reusable UI component changes. Local,
one-off styling MAY be used only for isolated product-specific layout that does
not introduce reusable semantics.

**Violation examples**:
- Creating a second button component instead of extending the design system
  button.
- Adding a new color token without documenting use and contrast behavior.
- Reusing a component across screens without a Storybook story for its states.

### X. Accessibility
User-facing interfaces MUST meet WCAG 2.2 AA unless a stricter product,
regulatory, or platform standard applies. Keyboard navigation, focus order,
semantic structure, name/role/value, color contrast, reduced motion, and screen
reader behavior MUST be considered in specs, plans, tasks, and verification.

**Rationale**: Accessibility is a core quality requirement, not a polish task,
and it is cheaper to design and test before implementation hardens.

**Enforcement guidance**: `/speckit.specify` MUST include accessibility
acceptance criteria for user-facing changes. `/speckit.tasks` MUST include
automated and manual accessibility verification where applicable.
`/speckit.implement` MUST not ship inaccessible custom controls when native or
design-system primitives can satisfy the requirement.

**Violation examples**:
- Implementing a clickable `div` without keyboard support.
- Using color alone to communicate validation state.
- Adding animation without respecting reduced-motion preferences.

### XI. Performance Budgets
Features MUST define and respect performance budgets appropriate to their
surface, such as load time, interaction latency, bundle impact, memory, storage,
API latency, throughput, rendering frame rate, or token cost. Budgets MUST be
measurable and verified before completion.

**Rationale**: Performance regressions are difficult to identify after scope
expands and especially costly when AI agents add unnecessary code or network
calls.

**Enforcement guidance**: `/speckit.specify` MUST capture user-visible
performance outcomes when relevant. `/speckit.plan` MUST translate them into
technical budgets and measurement commands. `/speckit.tasks` MUST include
profiling or regression checks for performance-sensitive work.

**Violation examples**:
- Adding a large frontend dependency for a minor formatting task.
- Making serial API calls where the spec requires fast first interaction.
- Shipping without measuring a declared p95 latency or bundle budget.

### XII. Security and Privacy by Default
Features MUST minimize data collection, protect secrets, validate inputs,
authorize access, preserve auditability for sensitive actions, and avoid sending
private data to external services unless the spec explicitly approves it.
Security and privacy risks MUST be considered before implementation.

**Rationale**: Security and privacy requirements are architectural constraints;
late fixes are expensive and easy for AI agents to miss.

**Enforcement guidance**: `/speckit.specify` MUST identify data categories,
trust boundaries, permissions, retention, and privacy expectations.
`/speckit.plan` MUST include threat-model notes for sensitive work.
`/speckit.tasks` MUST include validation, authorization, secret handling, and
security test tasks where applicable.

**Violation examples**:
- Logging tokens, personal data, or request bodies containing secrets.
- Adding an external analytics or AI service without data-use approval.
- Trusting client-provided authorization fields.

### XIII. Clear Module Boundaries
Modules MUST have explicit ownership, stable public interfaces, and limited
dependencies. Cross-module calls MUST use approved contracts rather than
reaching into internal implementation details. Shared code MUST be introduced
only when at least two concrete consumers justify it or the plan documents a
near-term architectural need.

**Rationale**: Clear boundaries make features independently testable and reduce
the blast radius of AI-generated changes.

**Enforcement guidance**: `/speckit.plan` MUST define affected modules,
interfaces, data flow, and ownership. `/speckit.tasks` MUST sequence boundary
changes before dependent implementation. `/speckit.analyze` SHOULD flag circular
dependencies, hidden coupling, and cross-story file conflicts.

**Violation examples**:
- Importing a component's private helper from another feature area.
- Creating a shared package for one use case.
- Changing a public contract without updating downstream consumers and tests.

### XIV. Local-First and Cost-Aware Development
Development, validation, and demonstrations SHOULD run locally by default using
deterministic fixtures, mocks, or local services. Paid, metered, remote, or
production-like services MAY be used only when the plan explains why local
substitutes are insufficient and how cost, data exposure, and failure modes are
controlled.

**Rationale**: Local-first workflows reduce cost, speed iteration, protect
privacy, and make AI-assisted implementation reproducible.

**Enforcement guidance**: `/speckit.plan` MUST identify local setup commands,
required services, environment variables, seeded data, and any metered external
calls. `/speckit.tasks` MUST include local verification steps and cost controls
for AI, analytics, cloud, or third-party APIs.

**Violation examples**:
- Requiring production credentials for routine tests.
- Running token-heavy AI calls in tests without a mock mode or budget.
- Depending on a remote service when a local fixture would validate the same
  behavior.

### XV. AI Agent Governance
AI agents MUST follow the same specs, plans, tasks, quality gates, security
rules, and ownership boundaries as human contributors. Agents MUST preserve user
changes, disclose assumptions, avoid destructive actions without approval, and
record meaningful verification results.

**Rationale**: AI assistance increases throughput only when its changes remain
auditable, bounded, and reviewable.

**Enforcement guidance**: `/speckit.implement` MUST work task-by-task, update
task state truthfully, and provide evidence for completed work. Agents MUST not
mark tasks complete when code, tests, or docs do not support the claim.
Extension gates SHOULD detect phantom completions, documentation drift, version
violations, and unverified changes.

**Violation examples**:
- Reverting unrelated user edits to make a patch easier.
- Inventing test results instead of running or clearly reporting them as not
  run.
- Completing tasks out of dependency order without recording an override.

### XVI. Definition of Done
A change is done only when the spec, plan, tasks, implementation, tests,
documentation, accessibility checks, performance checks, security/privacy review,
and extension quality gates required for the scope are complete or explicitly
overridden. Completion MUST include evidence that each accepted user story works
independently.

**Rationale**: Definition of Done prevents partial implementation from being
mistaken for delivered value.

**Enforcement guidance**: `/speckit.tasks` MUST include final verification and
documentation tasks. `/speckit.implement` MUST run the relevant checks, update
task status only for implemented work, and summarize residual risk.
`/speckit.analyze` and extension gates SHOULD block release when artifacts and
implementation disagree.

**Violation examples**:
- Shipping code while `tasks.md` has incomplete required verification tasks.
- Closing a story that lacks acceptance evidence or updated docs.
- Treating a passing unit test as sufficient for a changed end-to-end workflow.

## Operational Constraints

Specs, plans, tasks, and implementation artifacts MUST use precise MUST, SHOULD,
and MAY language. Ambiguity MUST be resolved through `/speckit.clarify` before
planning when it affects scope, UX, data, security, performance, versioning,
cost, or test strategy.

All technical plans MUST document the version-pinned stack, local development
commands, module boundaries, quality commands, test commands, accessibility
strategy, performance budgets, security/privacy assumptions, and extension gates
that apply to the feature. Missing information MUST be marked `NEEDS
CLARIFICATION` until resolved or explicitly overridden.

Design system and Storybook governance apply to reusable UI. Feature-specific
screens MAY use local composition, but reusable controls, tokens, patterns, and
states MUST be cataloged and tested through the approved component workflow.

## Spec-Driven Workflow and Quality Gates

`/speckit.specify` MUST produce user stories, acceptance scenarios, measurable
success criteria, data and privacy assumptions, accessibility criteria, and
performance expectations for applicable surfaces.

`/speckit.clarify` MUST resolve material uncertainty before planning and MUST
write the answer back to the spec or related design artifact.

`/speckit.plan` MUST translate the spec into a version-pinned technical plan,
module structure, contracts, local-first development approach, quality commands,
and a Constitution Check. Any violation MUST be justified in Complexity Tracking
before Phase 0 research or Phase 1 design proceeds.

`/speckit.tasks` MUST generate dependency-ordered tasks that are independently
testable by user story, include required test and quality-gate work, and capture
cross-cutting UX, Storybook, accessibility, performance, security, privacy, and
documentation tasks.

`/speckit.implement` MUST execute tasks without inventing scope, preserve
artifact traceability, run applicable checks, and report incomplete verification
honestly.

`/speckit.analyze` and extension-based quality gates SHOULD verify consistency
across `spec.md`, `plan.md`, `tasks.md`, implementation, docs, version
constraints, and completed task claims. Mandatory extension hooks MUST be
treated as release blockers unless an explicit override is recorded.

## Governance

This constitution supersedes conflicting process instructions, generated
templates, agent memory, and feature artifacts. Feature artifacts may add stricter
requirements but MUST NOT weaken these principles without an amendment.

Amendments MUST include the proposed text, rationale, migration impact,
affected templates or extension gates, and version bump. Amendments require
review by the project owner or delegated maintainer before they are ratified.

Versioning follows semantic governance:
- MAJOR for backward-incompatible principle removals, weaker obligations, or
  redefinitions that change compliance expectations.
- MINOR for new principles, new required sections, or materially expanded
  enforcement guidance.
- PATCH for clarifications, examples, typo fixes, or non-semantic refinements.

Compliance review MUST occur during `/speckit.plan`, before implementation
begins, before tasks are marked complete, and during extension quality gates.
Unresolved constitutional violations MUST be tracked as explicit overrides or
block completion.

**Version**: 1.0.0 | **Ratified**: 2026-05-13 | **Last Amended**: 2026-05-13
