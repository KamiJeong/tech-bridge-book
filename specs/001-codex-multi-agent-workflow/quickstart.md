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
test -f .github/labels.json
test -f .github/ISSUE_TEMPLATE/speckit-auto.yml
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
  generate-token-report.sh validate-agent-definitions.sh; do
  bash -n ".agents/skills/speckit-guards/scripts/${script}" || exit 1
done
```

## 4. Validate Agent Definitions

```bash
.agents/skills/speckit-guards/scripts/validate-agent-definitions.sh
```

Expected result: pass. A malformed TOML file, missing required field, wrong
`name`, missing phase instruction, unsupported top-level field, or missing token
step reference must fail.

## 5. Verify Token Analyzer Detection

```bash
.agents/skills/speckit-guards/scripts/guard-token-analyzer-available.sh
```

Expected result in this repository: pass, because `.specify/extensions/token-analyzer/` exists.

## 6. Record a Dry-Run Token Step

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

## 7. Generate a Token Report

```bash
.agents/skills/speckit-guards/scripts/generate-token-report.sh \
  --run-label 2026-05-18-codex-multi-agent-workflow-s01-gated
```

Expected artifacts:

- `.specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/summary.json`
- `.specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/report.md`
- `.specify/token-analysis/runs/2026-05-18-codex-multi-agent-workflow-s01-gated/quality-notes.md`

## 8. Check Forbidden Path Assumptions

```bash
! rg "\\.claude/" .codex .agents AGENTS.md
```

## 9. Confirm PR Token Section Contract

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

## 10. Validate GitHub Issue Trigger Assets

```bash
jq empty .github/labels.json
python3 -c 'import yaml; yaml.safe_load(open(".github/ISSUE_TEMPLATE/speckit-auto.yml", encoding="utf-8"))'
rg '\$speckit-auto' .agents/skills/speckit-auto/SKILL.md .github/ISSUE_TEMPLATE/speckit-auto.yml
```

Expected result: labels parse as JSON, the issue template parses as YAML, and
both the skill and issue template document the `$speckit-auto` trigger.
