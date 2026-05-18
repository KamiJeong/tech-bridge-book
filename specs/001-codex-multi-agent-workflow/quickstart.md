# Quickstart: Validate the Codex Spec Kit Multi-Agent Workflow Setup

Use these steps after implementation to validate the workflow assets without running product code.

## 1. Confirm Required Paths

```bash
test -d .codex/agents
test -d .agents/skills/speckit-auto
test -d .agents/skills/speckit-rules
test -d .agents/skills/speckit-guards
test -d .agents/skills/speckit-token-observability
test -d .specify/token-analysis
```

## 2. Check Required Agents

```bash
for agent in \
  speckit-slicer speckit-scheduler speckit-specifier speckit-clarifier \
  speckit-checklister speckit-planner speckit-tasker speckit-analyzer \
  speckit-implementer speckit-reviewer speckit-integrator speckit-committer \
  speckit-pr-creator speckit-token-reporter; do
  test -f ".codex/agents/${agent}.toml" || exit 1
done
```

## 3. Check Required Guard Scripts

```bash
for script in \
  guard-no-app-code-change.sh guard-before-implement.sh guard-before-commit.sh \
  guard-before-pr.sh guard-token-analyzer-available.sh record-token-step.sh \
  generate-token-report.sh; do
  bash -n ".agents/skills/speckit-guards/scripts/${script}" || exit 1
done
```

## 4. Verify Token Analyzer Detection

```bash
.agents/skills/speckit-guards/scripts/guard-token-analyzer-available.sh
```

Expected result in this repository: pass, because `.specify/extensions/token-analyzer/` exists.

## 5. Record a Dry-Run Token Step

```bash
.agents/skills/speckit-guards/scripts/record-token-step.sh \
  --run-label 2026-05-18-codex-multi-agent-workflow-s01-gated \
  --phase plan \
  --slice-id s01 \
  --capture-method estimated \
  --estimated-input 1 \
  --estimated-output 1 \
  --artifact specs/001-codex-multi-agent-workflow/plan.md \
  --notes "dry run"
```

Then validate:

```bash
jq empty .specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/steps/plan.json
```

## 6. Generate a Token Report

```bash
.agents/skills/speckit-guards/scripts/generate-token-report.sh \
  --run-label 2026-05-18-codex-multi-agent-workflow-s01-gated
```

Expected artifacts:

- `.specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/summary.json`
- `.specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/report.md`
- `.specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/quality-notes.md`

## 7. Check Forbidden Path Assumptions

```bash
! rg "\\.claude/" .codex .agents AGENTS.md
```

## 8. Confirm PR Token Section Contract

Inspect `speckit-pr-creator.toml` and `speckit-auto/SKILL.md` to verify PR bodies include:

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
