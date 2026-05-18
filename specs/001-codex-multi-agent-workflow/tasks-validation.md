# Tasks Validation Evidence

## Setup

- Confirm required directories:
  ```bash
  test -d .codex/agents
  test -d .agents/skills
  test -d .agents/skills/speckit-guards/scripts
  test -d .specify/token-analysis/runs
  test -d .specify/token-analysis/baselines
  test -d .specify/token-analysis/comparisons
  ```

## Foundation Checks

- Guard script syntax:
  ```bash
  bash -n .agents/skills/speckit-guards/scripts/*.sh
  ```

- Agent definition structural validation:
  ```bash
  .agents/skills/speckit-guards/scripts/validate-agent-definitions.sh
  ```

- Token step schema:
  ```bash
  jq empty specs/001-codex-multi-agent-workflow/contracts/token-step.schema.json
  ```

## User Story 1 Checks

- Required agent files:
  ```bash
  for agent in speckit-slicer speckit-scheduler speckit-specifier speckit-clarifier speckit-checklister speckit-planner speckit-tasker speckit-analyzer speckit-implementer speckit-reviewer speckit-integrator speckit-committer speckit-pr-creator speckit-token-reporter; do
    test -f ".codex/agents/${agent}.toml" || exit 1
  done
  ```

- Required skill files:
  ```bash
  test -f .agents/skills/speckit-auto/SKILL.md
  test -f .agents/skills/speckit-rules/SKILL.md
  test -f .agents/skills/speckit-guards/SKILL.md
  test -f .agents/skills/speckit-token-observability/SKILL.md
  ```

- Malformed and incomplete agent definition rejection:
  ```bash
  tmp_dir="$(mktemp -d)"
  cp .codex/agents/*.toml "$tmp_dir/"
  printf 'name = [\n' > "$tmp_dir/speckit-slicer.toml"
  .agents/skills/speckit-guards/scripts/validate-agent-definitions.sh --agent-dir "$tmp_dir" && exit 1 || true
  printf 'name = "speckit-slicer"\nphase = "slicing"\n' > "$tmp_dir/speckit-slicer.toml"
  .agents/skills/speckit-guards/scripts/validate-agent-definitions.sh --agent-dir "$tmp_dir" && exit 1 || true
  rm -rf "$tmp_dir"
  ```

- Forbidden path literal scan:
  ```bash
  ! rg "\\.claude/" .codex .agents AGENTS.md
  ```

## User Story 2 Checks

- Slicing and scheduling outputs should include intake summary, slice list,
  dependency graph, conflict matrix, execution plan, selected strategy, and token
  records for `intake`, `slicing`, and `scheduling`.

- Token step existence check:
  ```bash
  test -f .specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/steps/intake.json
  test -f .specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/steps/slicing.json
  test -f .specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/steps/scheduling.json
  ```

## User Story 3 Checks

- Token step schema validation:
  ```bash
  jq empty .specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/steps/*.json
  ```

- Token report artifacts:
  ```bash
  test -f .specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/metadata.json
  test -f .specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/summary.json
  test -f .specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/report.md
  test -f .specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/quality-notes.md
  ```

- Missing exact token data warning:
  ```bash
  rg "Exact token data unavailable|estimated" .specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/report.md
  ```

## User Story 4 Checks

- Gated dry-run checklist must verify specify, clarify, checklist, plan, tasks,
  analyze, implement, and review order.
- CRITICAL analyze fixture:
  ```bash
  .agents/skills/speckit-guards/scripts/guard-before-implement.sh --analyze-file specs/001-codex-multi-agent-workflow/fixtures/critical-analyze-result.md && exit 1 || true
  ```
- Token analysis read-only check:
  ```bash
  git status --short -- specs/001-codex-multi-agent-workflow/spec.md specs/001-codex-multi-agent-workflow/plan.md specs/001-codex-multi-agent-workflow/tasks.md
  ```

## User Story 5 Checks

- PR token section fields:
  ```bash
  rg "Run label|Token report|Total tokens|Most expensive phase|Missing token data|Token budget status|Notes" .codex/agents/speckit-pr-creator.toml
  ```
- Protected branch stop-condition: `main`, `master`, and `develop` must be
  rejected by `guard-before-pr.sh`.
- Intended-files-only commit checklist: validation pass, no unrelated changes,
  no suspected secrets, and only current-run token artifacts.

## Guard Results

- `bash -n .agents/skills/speckit-guards/scripts/*.sh`: PASS
- `.agents/skills/speckit-guards/scripts/validate-agent-definitions.sh`: PASS
- Malformed and incomplete agent definition rejection: EXPECTED FAIL, invalid TOML and incomplete role definitions rejected
- `jq empty specs/001-codex-multi-agent-workflow/contracts/token-step.schema.json`: PASS
- `.agents/skills/speckit-guards/scripts/guard-token-analyzer-available.sh`: PASS, token-analyzer extension directory detected
- `guard-before-implement.sh` against `fixtures/critical-analyze-result.md`: EXPECTED FAIL, CRITICAL analyze issue blocked implementation
- Required agent file check: PASS
- Required skill file check: PASS
- Forbidden path literal scan `! rg "\\.claude/" .codex .agents AGENTS.md`: PASS
- Custom phase token step existence check for `intake`, `slicing`, and `scheduling`: PASS
- Token step JSON validation for current run: PASS
- PR token section field validation in `.codex/agents/speckit-pr-creator.toml`: PASS
- Codex agent TOML parse validation with Python `tomllib`: PASS
- Codex agent structural validation: PASS
- Generated workflow asset placeholder scan: PASS
- After-implementation version guard validation: SKIPPED, no dependency sources found and no package compatibility rules apply

## Token-Analysis Evidence

- Existing run label: `2026-05-18-codex-multi-agent-workflow-s01-gated`
- Current step files include `specify`, `clarify`, `plan`, `tasks`, `analyze`, `intake`, `slicing`, `scheduling`, `implement`, `review`, and `integration`.
- Exact runtime token data is unavailable for local Codex execution; step files use estimated capture where exact or parsed data is unavailable.
- Token report regenerated from all current step files after implementation.

## Final Quickstart Validation

- Required paths validated: PASS
- Required agents validated: PASS
- Required guard scripts passed shell syntax validation: PASS
- Token analyzer detection validated: PASS
- Token report generation validated during implementation: PASS
- Forbidden path literal scan validated: PASS
- PR token section contract validated: PASS
