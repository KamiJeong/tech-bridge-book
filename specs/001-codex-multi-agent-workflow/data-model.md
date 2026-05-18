# Data Model: Codex Spec Kit Multi-Agent Workflow With Mandatory Token Analysis

## Epic

Represents one large feature request that may contain one or more slices.

**Fields**:

- `epic_slug`: Stable lowercase slug used in run labels.
- `feature_directory`: Path to the active Spec Kit feature directory.
- `mode`: One of `plan-only`, `gated`, `auto-implement`, or `auto-pr`.
- `auto_commit_enabled`: Boolean permission flag; not a standalone mode.
- `slices`: Ordered list of Slice records.
- `aggregate_token_report`: Path to full-epic token report when generated.

**Validation rules**:

- `mode` must be one of the supported execution modes.
- `auto_commit_enabled` may only trigger commit automation after review and validation pass.
- Full workflow automation must stop for missing token-analyzer in `auto-implement`, `auto-pr`, or when `auto_commit_enabled` is true unless the user explicitly approves continuing.

## Slice

Represents an independently approved unit of Spec Kit work.

**Fields**:

- `slice_id`: Stable id such as `s01`.
- `title`: Human-readable slice title.
- `status`: Intake, specified, clarified, planned, tasked, analyzed, implemented, reviewed, integrated, or stopped.
- `risk_level`: Low, medium, high, or critical.
- `dependencies`: Other slice ids that must complete first.
- `conflicts`: Files, contracts, configuration, or workflow areas that could conflict with other slices.
- `token_run_label`: Run label for token-analysis artifacts.

**Validation rules**:

- `slice_id` must be stable within the epic.
- High-risk slices stop before implementation unless explicitly approved.
- CRITICAL analyze findings stop the slice.

## Execution Strategy

Represents scheduling output for one epic.

**Fields**:

- `strategy`: `single-spec`, `sequential`, `foundation-first-then-parallel`, `parallel-safe`, or `stop-and-ask`.
- `dependency_graph`: Slice dependency relationships.
- `conflict_matrix`: Pairwise slice conflict assessment.
- `execution_plan`: Ordered or grouped execution steps.
- `rationale`: Reason the strategy was selected.

**Validation rules**:

- `parallel-safe` is valid only when shared file, contract, configuration, and repository-state conflicts are absent or controlled.
- `stop-and-ask` is required when safe execution cannot be determined.

## Codex Agent Definition

Represents one TOML agent under `.codex/agents/`.

**Fields**:

- `name`: Agent identifier matching the file role.
- `description`: One-sentence responsibility summary.
- `developer_instructions`: Codex-readable role guidance containing expected
  phase, inputs, outputs, responsibilities, prohibited actions,
  token-analysis obligations, and stop conditions.

**Validation rules**:

- Every required agent must include token-analysis obligations.
- Read-focused agents must prohibit application code edits.
- Commit and PR agents must exclude unrelated user changes and secrets.
- Project-only role metadata such as phase, inputs, outputs, and stop
  conditions must not appear as top-level TOML keys because Codex rejects
  unknown role fields.

## Codex Skill

Represents one reusable skill under `.agents/skills/`.

**Fields**:

- `name`: Skill name.
- `description`: Trigger and purpose.
- `workflow`: Ordered instructions.
- `guardrails`: Stop conditions and safety rules.
- `token_observability`: When and how token data is recorded.
- `scripts`: Referenced helper scripts when applicable.

**Validation rules**:

- `speckit-auto` must orchestrate the full workflow order.
- `speckit-token-observability` must define run labels, artifacts, missing extension behavior, unsupported phase handling, and PR/final summaries.
- `speckit-guards` must reference all required guard scripts.

## Token Step Record

Represents one per-phase token artifact at `.specify/token-analysis/runs/<run-label>/steps/<phase>.json`.

**Fields**:

- `phase`
- `command` or `agent_name`
- `run_label`
- `slice_id`
- `timestamp`
- `model`
- `input_tokens`
- `output_tokens`
- `total_tokens`
- `estimated_tokens`
- `artifact_paths`
- `quality_notes`
- `capture_method`

**Validation rules**:

- `capture_method` must be `exact`, `parsed`, `estimated`, or `unavailable`.
- If exact values are unavailable, `estimated_tokens` or a clear unavailable note must be present.
- Artifact paths must not point to raw secret files or temporary raw CLI response files.

## Token Report

Represents per-slice and aggregate token summaries.

**Fields**:

- `run_label`
- `scope`: Slice or epic.
- `phase_breakdown`
- `total_by_slice`
- `total_by_phase`
- `missing_token_data`
- `budget_status`
- `expensive_phases`
- `recommendations`
- `baseline_comparison`

**Validation rules**:

- Missing token data must be listed explicitly.
- High token usage warns by default and blocks only when explicit blocking thresholds are configured.
- Aggregate reports must include all completed slices in the epic.

## Token Budget

Optional configuration at `.specify/token-analysis/token-budget.json`.

**Fields**:

- `warn_total_tokens_per_slice`
- `warn_total_tokens_per_epic`
- `block_total_tokens_per_slice`
- `block_total_tokens_per_epic`
- `warn_on_missing_phase_data`

**Validation rules**:

- Warning thresholds do not block.
- Blocking thresholds block only when non-null and explicitly configured.
- Missing token data warns by default when the file is absent.

## Guard Result

Represents output from safety guard scripts.

**Fields**:

- `guard`
- `status`: pass, warn, or fail.
- `message`
- `details`
- `checked_paths`
- `next_action`

**Validation rules**:

- Fail status must stop the protected operation.
- Warnings must be visible in final output.
- Guards must not alter product artifacts except when their documented purpose is to write token-analysis records.
