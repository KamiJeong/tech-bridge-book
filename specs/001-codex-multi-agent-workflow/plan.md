# Implementation Plan: Codex Spec Kit Multi-Agent Workflow With Mandatory Token Analysis

**Branch**: `001-codex-multi-agent-workflow` | **Date**: 2026-05-18 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from `specs/001-codex-multi-agent-workflow/spec.md`

## Summary

Add a Codex-native Spec Kit orchestration layer made of project-scoped Codex agent definitions, Codex skills, guard scripts, and token-analysis conventions. The implementation will be documentation- and shell-script-focused: create workflow assets under `.codex/agents/` and `.agents/skills/`, update `AGENTS.md` to point to the active plan and workflow guidance, and define read-only token observability artifacts under `.specify/token-analysis/` for every Spec Kit and custom orchestration phase.

## Technical Context

**Language/Version**: POSIX-compatible shell scripts, Markdown, TOML, and JSON. No application runtime is introduced.

**Primary Dependencies**: Existing Spec Kit project structure, existing Codex skill layout, existing `.specify/extensions/token-analyzer/` extension, Git, GitHub CLI for optional PR mode, and common local CLI tools (`bash`, `jq`, `rg`, `git`).

**Version Pinning Strategy**: No package dependencies are introduced. Version guard produced a skipped report because no lockfile, package manifest, or tech-stack decision record exists for dependency verification.

**Storage**: Repository files only: `.codex/agents/`, `.agents/skills/`, `AGENTS.md`, and `.specify/token-analysis/`.

**Testing**: Shell syntax checks for guard scripts, agent-definition structural validation, JSON validation with `jq`, repository scans with `rg`, and manual workflow dry-run checks through generated quickstart steps.

**Type Safety**: JSON artifacts validated by documented schemas/contracts; TOML agents validated by parseability, required fields, expected role names, expected phases, and non-empty structured arrays; shell scripts use strict mode.

**Target Platform**: Local developer workstation running the repository's Spec Kit workflow.

**Project Type**: Developer workflow and repository automation guidance.

**Performance Goals**: Token availability checks and report generation complete in under 30 seconds for a typical single-slice run excluding the underlying Spec Kit phase work.

**Performance Budget**: Guard and report scripts should run in under 30 seconds on a single-slice run using local filesystem inputs. Verify with command timing during implementation if scripts become non-trivial.

**Constraints**: Token analysis must be read-only for product artifacts; automation must stop on CRITICAL analyze issues, failed tests, high-risk slices, unrelated user changes, unclear base branch, missing GitHub CLI for PR mode, and explicitly configured blocking token budgets.

**Security/Privacy Constraints**: Token artifacts must not store secrets, raw prompts, raw CLI response files, private keys, credential values, or unrelated repository state. PR automation requires authenticated GitHub CLI and must not push from `main`, `master`, or `develop`.

**Accessibility Standard**: Markdown reports and PR body sections use clear headings, readable lists/tables, and text warnings that do not depend on color.

**Design System/Storybook Impact**: N/A. No reusable UI components or visual design system changes.

**Local-First Strategy**: All workflow checks, reports, and dry-run validations operate on local files. GitHub is used only when draft PR creation is explicitly requested.

**Quality Commands**: `jq empty` for JSON artifacts, `bash -n` for shell guard scripts, `.agents/skills/speckit-guards/scripts/validate-agent-definitions.sh` for agent role definitions, `rg` scans for forbidden Claude Code path assumptions and missing token-analysis references, `git status --short` for unrelated-change checks, and dry-run script execution where safe.

**Extension Gates**: `version-guard.check` before planning, optional `git.commit` and docguard review hooks before planning, optional `git.commit` and token-analyzer baseline hooks after planning. Token observability is required for this workflow, with estimation fallback when exact token data is unavailable.

**Scale/Scope**: 14 Codex agent definitions, 4 Codex skills, 8 guard/report scripts, token-analysis run conventions, per-slice and aggregate reporting guidance, and PR body token-summary requirements.

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- **Spec Before Code**: PASS. `spec.md` exists and contains prioritized user stories, acceptance scenarios, success criteria, assumptions, and clarifications.
- **Single Source of Truth**: PASS. This plan derives from `spec.md`; downstream tasks must update spec, plan, and tasks together if scope changes.
- **Explicit Overrides Only**: PASS. No overrides are requested.
- **Version-Pinned Stack**: PASS. No package stack is introduced; version guard skipped due to no dependency sources and recorded this in `version-guard-report.md`.
- **Type Safety**: PASS. JSON contracts and parseability checks define validation strategy for generated artifacts.
- **Code Quality**: PASS. Shell strict mode, minimal scripts, existing repo layout, and focused Markdown/TOML conventions are identified.
- **Testing Standards**: PASS. Each story has an independent verification route; implementation tasks must include script, JSON, path, and forbidden-reference checks.
- **UX Consistency**: PASS. Developer-facing Markdown and CLI output expectations are specified.
- **Design System/Storybook Governance**: PASS. N/A with rationale: no UI component changes.
- **Accessibility**: PASS. Markdown output accessibility requirements are defined.
- **Performance Budgets**: PASS. Local guard/report script budget is defined.
- **Security/Privacy**: PASS. Secret exclusion, raw response exclusion, GitHub CLI trust boundary, and publishing restrictions are defined.
- **Module Boundaries**: PASS. `.codex/agents/`, `.agents/skills/`, `.specify/token-analysis/`, and `AGENTS.md` ownership boundaries are explicit.
- **Local-First/Cost-Aware**: PASS. Token observability and fallback estimation are local-first and cost-aware.
- **AI Agent Governance**: PASS. Agent roles, destructive-action boundaries, and review evidence expectations are explicit.
- **Definition of Done**: PASS. Validation and generated artifacts are listed in this plan and will be translated into tasks.

## Project Structure

### Documentation (this feature)

```text
specs/001-codex-multi-agent-workflow/
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── contracts/
│   ├── agent-definition-contract.md
│   ├── skill-contract.md
│   ├── token-step.schema.json
│   └── pr-token-section-contract.md
├── checklists/
│   └── requirements.md
└── tasks.md
```

### Source Code (repository root)

```text
.codex/
└── agents/
    ├── speckit-slicer.toml
    ├── speckit-scheduler.toml
    ├── speckit-specifier.toml
    ├── speckit-clarifier.toml
    ├── speckit-checklister.toml
    ├── speckit-planner.toml
    ├── speckit-tasker.toml
    ├── speckit-analyzer.toml
    ├── speckit-implementer.toml
    ├── speckit-reviewer.toml
    ├── speckit-integrator.toml
    ├── speckit-committer.toml
    ├── speckit-pr-creator.toml
    └── speckit-token-reporter.toml

.agents/
└── skills/
    ├── speckit-auto/
    │   └── SKILL.md
    ├── speckit-rules/
    │   └── SKILL.md
    ├── speckit-guards/
    │   ├── SKILL.md
    │   └── scripts/
    │       ├── guard-no-app-code-change.sh
    │       ├── guard-before-implement.sh
    │       ├── guard-before-commit.sh
    │       ├── guard-before-pr.sh
    │       ├── guard-token-analyzer-available.sh
    │       ├── validate-agent-definitions.sh
    │       ├── record-token-step.sh
    │       └── generate-token-report.sh
    └── speckit-token-observability/
        └── SKILL.md

.specify/
└── token-analysis/
    ├── baselines/
    ├── comparisons/
    └── runs/
        └── <run-label>/
            ├── metadata.json
            ├── quality-notes.md
            ├── report.md
            ├── summary.json
            └── steps/
                └── <phase>.json

AGENTS.md
```

**Structure Decision**: Use the repository's existing Spec Kit/Codex project layout. Workflow agents live under `.codex/agents/`, reusable Codex skills under `.agents/skills/`, and token observability output under `.specify/token-analysis/`. No application `src/` tree is introduced.

## Phase 0: Research

Completed in [research.md](./research.md).

## Phase 1: Design & Contracts

Completed artifacts:

- [data-model.md](./data-model.md)
- [quickstart.md](./quickstart.md)
- [agent-definition-contract.md](./contracts/agent-definition-contract.md)
- [skill-contract.md](./contracts/skill-contract.md)
- [token-step.schema.json](./contracts/token-step.schema.json)
- [pr-token-section-contract.md](./contracts/pr-token-section-contract.md)

## Post-Design Constitution Check

- **Spec Before Code**: PASS. Design artifacts trace back to `spec.md`.
- **Single Source of Truth**: PASS. Plan, data model, quickstart, and contracts align with spec terminology.
- **Explicit Overrides Only**: PASS. No overrides introduced.
- **Version-Pinned Stack**: PASS. No package dependencies introduced; skipped version guard documented.
- **Type Safety**: PASS. Token step JSON schema and required TOML/Markdown contracts define artifact validation.
- **Code Quality**: PASS. Scripts are bounded to guard/report responsibilities and validated by shell syntax checks.
- **Testing Standards**: PASS. Quickstart and contracts define verification paths for each artifact class.
- **UX Consistency**: PASS. Developer-facing reports and PR body format are specified.
- **Design System/Storybook Governance**: PASS. N/A remains valid.
- **Accessibility**: PASS. Markdown output remains text-first and table/list based.
- **Performance Budgets**: PASS. Guard/report script budget remains measurable.
- **Security/Privacy**: PASS. Secrets, raw prompts, and raw CLI response files are excluded from token artifacts.
- **Module Boundaries**: PASS. Agent, skill, guard, token-analysis, and guidance boundaries are explicit.
- **Local-First/Cost-Aware**: PASS. Local validation and estimation fallback remain central.
- **AI Agent Governance**: PASS. Agent constraints, stop conditions, and automation permissions are represented in design artifacts.
- **Definition of Done**: PASS. Tasks can be generated from this plan without unresolved clarification markers.

## Complexity Tracking

No constitutional violations or approved overrides.
