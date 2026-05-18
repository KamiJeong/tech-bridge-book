# Contract: Codex Agent Definitions

Each required Codex agent is a TOML file under `.codex/agents/`.

## Required Files

- `.codex/agents/speckit-slicer.toml`
- `.codex/agents/speckit-scheduler.toml`
- `.codex/agents/speckit-specifier.toml`
- `.codex/agents/speckit-clarifier.toml`
- `.codex/agents/speckit-checklister.toml`
- `.codex/agents/speckit-planner.toml`
- `.codex/agents/speckit-tasker.toml`
- `.codex/agents/speckit-analyzer.toml`
- `.codex/agents/speckit-implementer.toml`
- `.codex/agents/speckit-reviewer.toml`
- `.codex/agents/speckit-integrator.toml`
- `.codex/agents/speckit-committer.toml`
- `.codex/agents/speckit-pr-creator.toml`
- `.codex/agents/speckit-token-reporter.toml`

## Required Fields

Each TOML file must include:

- `name`
- `description`
- `phase`
- `developer_instructions`

Codex role TOML must not use project-only top-level keys such as `inputs`,
`outputs`, `responsibilities`, `prohibited_actions`, `token_analysis`, or
`stop_conditions`. Those details must be represented inside
`developer_instructions` so Codex can deserialize the role file.

`developer_instructions` must include these sections:

- `Inputs:`
- `Outputs:`
- `Responsibilities:`
- `Prohibited actions:`
- `Token analysis:`
- `Stop conditions:`

## Required Role Constraints

- Slicer must not create implementation plans or edit application code.
- Scheduler must decide execution strategy and report dependency/conflict evidence.
- Specifier must focus on WHAT and WHY, not HOW.
- Clarifier must include options, recommendation, reason, risk level, and auto-select eligibility.
- Analyzer must be read-focused and must not modify application code.
- Implementer must implement only tasks listed in `tasks.md`.
- Reviewer must review the diff against spec, plan, tasks, and constitution.
- Integrator must check cross-slice drift and merge readiness.
- Committer must commit only intended files after validation passes.
- PR creator must use GitHub CLI, draft PRs, and token summary body content.
- Token reporter must not modify product specs, plans, tasks, or implementation code.

## Token Analysis Requirement

Every agent must state that it triggers token analysis after its phase, including the phase name and expected artifact path under `.specify/token-analysis/runs/<run-label>/steps/<phase>.json`.

## Validation Requirement

Malformed, incomplete, mismatched, or unexpected role definitions must fail
validation. Validation must parse each TOML file and enforce required files,
required fields, no unsupported top-level fields, expected `name` and `phase`
values, required `developer_instructions` sections, and the expected token step
reference.
