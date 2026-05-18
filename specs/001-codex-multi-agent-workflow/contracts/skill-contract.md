# Contract: Codex Skills

## Required Skills

- `.agents/skills/speckit-auto/SKILL.md`
- `.agents/skills/speckit-rules/SKILL.md`
- `.agents/skills/speckit-guards/SKILL.md`
- `.agents/skills/speckit-token-observability/SKILL.md`

## `speckit-auto`

Must orchestrate this order:

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

Must default to gated mode and stop before automation when configured guards fail.

## `speckit-rules`

Must summarize workflow-wide rules:

- Spec before code.
- Token analysis after every completed phase.
- Missing token data must be reported.
- Token analysis is not a quality gate unless thresholds are configured.
- No Claude Code path assumptions.
- Existing configuration is preserved unless minimal update is required.

## `speckit-guards`

Must document and expose these scripts:

- `guard-no-app-code-change.sh`
- `guard-before-implement.sh`
- `guard-before-commit.sh`
- `guard-before-pr.sh`
- `guard-token-analyzer-available.sh`
- `record-token-step.sh`
- `generate-token-report.sh`

## `speckit-token-observability`

Must define:

- When token analysis runs.
- Run label format.
- Token artifact locations.
- Supported and unsupported phase capture behavior.
- Missing token-analyzer behavior by execution mode.
- Token budget handling.
- Final-output and PR-body token summaries.

## Validation

- Every skill must be Markdown.
- Every skill must reference only project-local Codex and Spec Kit paths.
- No skill may assume Claude Code paths.
- Guard and token observability skills must identify read-only boundaries for token analysis.
