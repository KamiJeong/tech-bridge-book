---
name: "speckit-auto"
description: "Orchestrate the Codex Spec Kit multi-agent workflow with mandatory token observability."
compatibility: "Requires Spec Kit feature artifacts and Codex project-scoped agents"
---

# Spec Kit Auto Workflow

Default mode is `gated`. Before starting a full workflow, check token-analyzer
availability with `.agents/skills/speckit-guards/scripts/guard-token-analyzer-available.sh`.

## GitHub Issue Trigger Mode

When a GitHub issue title, body, or comment contains `$speckit-auto`, treat the
issue as an instruction to run this skill for Codex-only work. Use the issue body
as the feature request and inspect linked comments, checklists, and sub-issues
before starting.

This trigger does not override normal safety gates. Follow the requested mode
from the issue when present; otherwise use `gated`. Implementation is allowed
only when the issue explicitly requests `auto-implement` or when the user has
already approved implementation in the current conversation. Commit and PR
creation still require explicit `auto-commit` or `auto-pr` permission.

Use GitHub issue labels as live workflow state:

- Add `trigger:speckit-auto` and `agent:codex` when taking the issue.
- Add exactly one `mode:*` label when the mode is known.
- Add `status:in-progress` when work starts.
- Move the active `phase:*` label after every completed phase.
- Use `status:needs-clarification` when a required decision is missing.
- Use `status:blocked` when a stop condition is hit.
- Use `status:waiting-review` after implementation and review evidence are ready.
- Use `status:done` only after the requested terminal action is complete.
- Use `status:failed` when the workflow cannot continue because validation or a
  required external operation failed.

Always add an issue comment before starting a phase and after completing a phase.
Comments should state what Codex is doing, which files or artifacts are in scope,
which label changed, and any gate result. Keep comments short and factual.

If the issue is too broad or Codex determines sub-issues are needed, create
sub-issues only in the same GitHub repository. Link them from the parent issue,
label the parent with `status:needs-sub-issues` and `relationship:parent`, label
each child with `relationship:sub-issue`, `trigger:speckit-auto`, `agent:codex`,
and the relevant `type:*`, `priority:*`, `risk:*`, and `mode:*` labels. Add a
parent issue comment explaining the split and the execution order.

Use the GitHub app tools when available for labels, comments, issue creation,
and issue inspection. Use `gh` only as a fallback when the app tools cannot
perform the needed operation.

## Orchestration Order

1. intake
2. slicing
3. scheduling
4. per-slice Spec Kit workflow
5. implementation
6. review
7. integration
8. token reporting
9. commit
10. PR creation

After every completed phase, record token usage using token-analyzer when
available or `.agents/skills/speckit-guards/scripts/record-token-step.sh` when a
phase is custom or unsupported.

## Intake And Slicing

Accept the feature request and determine whether it should be split before
running specify. Treat the request as a slicing candidate when it spans multiple
independent deliverables, shared contracts, or more than one implementation area,
unless the user or workflow explicitly overrides the decision.

Intake artifacts should capture:

- original request summary
- target epic slug
- proposed slice ids
- explicit overrides
- assumptions
- token run label

## Scheduling

For sliced work, build:

- dependency graph
- conflict matrix
- execution plan
- selected strategy

Allowed strategies are `single-spec`, `sequential`,
`foundation-first-then-parallel`, `parallel-safe`, and `stop-and-ask`. Use
`stop-and-ask` when dependency, file, contract, configuration, or repository-state
conflicts are unclear.

## Per-Slice Workflow

For each approved slice, run:

1. specify
2. clarify
3. checklist
4. plan
5. tasks
6. analyze
7. implement
8. review

In `plan-only`, stop after analyze and token reporting. In `gated`, ask before
implementation, commit, and PR. In `auto-implement`, implement only when analyze
passes and the slice is low risk. In `auto-pr`, implement, validate, token-report,
commit, push, and create a draft PR only when explicitly requested.

## Integration

After multiple slices are implemented, check cross-slice file conflicts, shared
contract drift, integration risks, and merge readiness. Record token analysis for
integration.

## Commit

Commit only after review and validation pass. Use conventional commits by
default. Commit only intended files, never secrets, and include token-analysis
artifacts only when they belong to the current run. `auto-commit` is an explicit
permission flag, not a standalone mode.

## Draft PR

Use GitHub CLI. Create draft PRs by default. Never push directly from `main`,
`master`, or `develop`. Include changed files, spec, plan, tasks, tests, risks,
reviewer notes, and token summary. Print PR URLs after creation.

Required PR section:

```markdown
## Token Analysis

- Run label:
- Token report:
- Total tokens:
- Most expensive phase:
- Missing token data:
- Token budget status:
- Notes:
```
