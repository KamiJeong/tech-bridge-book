# Contract: PR Token Analysis Section

Every draft PR created by the workflow must include this section.

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

## Field Rules

- `Run label` must match `<date>-<epic-slug>-<slice-id>-<mode>`.
- `Token report` must point to the generated report path or PR-accessible link.
- `Total tokens` must show exact total when available; otherwise show estimated total and mark it as estimated.
- `Most expensive phase` must name the highest known or estimated phase, or state `unknown` when no phase token data exists.
- `Missing token data` must say `None` or list phases with unavailable exact data.
- `Token budget status` must state whether no budget file exists, warnings were triggered, or explicit blocking thresholds passed.
- `Notes` must include any user approval to continue without token-analyzer in automation modes.

## Safety Rules

- The PR creator must create draft PRs by default.
- The PR creator must not push from `main`, `master`, or `develop`.
- The PR creator must stop if GitHub CLI is missing or unauthenticated.
- The PR creator must not include secrets, raw prompts, raw CLI responses, or unrelated user changes.
