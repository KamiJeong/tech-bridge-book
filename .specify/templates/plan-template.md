# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]

**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

**Note**: This template is filled in by the `/speckit-plan` command. See `.specify/templates/plan-template.md` for the execution workflow.

## Summary

[Extract from feature spec: primary requirement + technical approach from research]

## Technical Context

<!--
  ACTION REQUIRED: Replace the content in this section with the technical details
  for the project. The structure here is presented in advisory capacity to guide
  the iteration process.
-->

**Language/Version**: [e.g., Python 3.11, Swift 5.9, Rust 1.75 or NEEDS CLARIFICATION]

**Primary Dependencies**: [e.g., FastAPI, UIKit, LLVM or NEEDS CLARIFICATION]

**Version Pinning Strategy**: [lockfile, exact versions, supported ranges, or NEEDS CLARIFICATION]

**Storage**: [if applicable, e.g., PostgreSQL, CoreData, files or N/A]

**Testing**: [e.g., pytest, XCTest, cargo test or NEEDS CLARIFICATION]

**Type Safety**: [type checker, strict mode, schema/runtime validation, or NEEDS CLARIFICATION]

**Target Platform**: [e.g., Linux server, iOS 15+, WASM or NEEDS CLARIFICATION]

**Project Type**: [e.g., library/cli/web-service/mobile-app/compiler/desktop-app or NEEDS CLARIFICATION]

**Performance Goals**: [domain-specific, e.g., 1000 req/s, 10k lines/sec, 60 fps or NEEDS CLARIFICATION]

**Performance Budget**: [measurable budget and command/tool used to verify it, or NEEDS CLARIFICATION]

**Constraints**: [domain-specific, e.g., <200ms p95, <100MB memory, offline-capable or NEEDS CLARIFICATION]

**Security/Privacy Constraints**: [data classes, trust boundaries, secrets, retention, external services, or NEEDS CLARIFICATION]

**Accessibility Standard**: [WCAG 2.2 AA, platform standard, N/A with rationale, or NEEDS CLARIFICATION]

**Design System/Storybook Impact**: [affected components/tokens/stories or N/A with rationale]

**Local-First Strategy**: [local services, fixtures, mocks, seeded data, metered API controls, or NEEDS CLARIFICATION]

**Quality Commands**: [format, lint, type-check, tests, Storybook, accessibility, performance, security scans]

**Extension Gates**: [version-guard/docguard/verify/verify-tasks/token-analyzer hooks that apply]

**Scale/Scope**: [domain-specific, e.g., 10k users, 1M LOC, 50 screens or NEEDS CLARIFICATION]

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- **Spec Before Code**: spec.md exists and contains prioritized user stories,
  acceptance scenarios, success criteria, assumptions, and open questions.
- **Single Source of Truth**: plan scope matches spec.md and no downstream
  artifact contradicts the spec or constitution.
- **Explicit Overrides Only**: all deviations are recorded in Complexity
  Tracking with reason, owner, impact, and simpler alternative considered.
- **Version-Pinned Stack**: language, framework, tooling, and dependency
  versions are pinned or marked NEEDS CLARIFICATION before implementation.
- **Type Safety**: public contracts, module boundaries, data models, and
  untrusted inputs have typed and validated strategies.
- **Code Quality**: formatting, linting, static analysis, and local conventions
  are identified.
- **Testing Standards**: every changed behavior and user story has an
  independently executable verification path.
- **UX Consistency**: affected user flows, states, responsive behavior, and
  content expectations are captured.
- **Design System/Storybook Governance**: reusable UI changes include component
  catalog and visual-state coverage.
- **Accessibility**: applicable WCAG/platform criteria and verification steps
  are defined.
- **Performance Budgets**: measurable budgets and verification tools are
  specified for performance-sensitive work.
- **Security/Privacy**: data classes, trust boundaries, permissions, retention,
  secrets, and external services are reviewed.
- **Module Boundaries**: affected modules, interfaces, ownership, and dependency
  direction are explicit.
- **Local-First/Cost-Aware**: local validation path and metered-service controls
  are documented.
- **AI Agent Governance**: agent assumptions, destructive action boundaries, and
  verification evidence expectations are explicit.
- **Definition of Done**: required quality gates and completion evidence are
  listed before implementation.

## Project Structure

### Documentation (this feature)

```text
specs/[###-feature]/
├── plan.md              # This file (/speckit-plan command output)
├── research.md          # Phase 0 output (/speckit-plan command)
├── data-model.md        # Phase 1 output (/speckit-plan command)
├── quickstart.md        # Phase 1 output (/speckit-plan command)
├── contracts/           # Phase 1 output (/speckit-plan command)
└── tasks.md             # Phase 2 output (/speckit-tasks command - NOT created by /speckit-plan)
```

### Source Code (repository root)
<!--
  ACTION REQUIRED: Replace the placeholder tree below with the concrete layout
  for this feature. Delete unused options and expand the chosen structure with
  real paths (e.g., apps/admin, packages/something). The delivered plan must
  not include Option labels.
-->

```text
# [REMOVE IF UNUSED] Option 1: Single project (DEFAULT)
src/
├── models/
├── services/
├── cli/
└── lib/

tests/
├── contract/
├── integration/
└── unit/

# [REMOVE IF UNUSED] Option 2: Web application (when "frontend" + "backend" detected)
backend/
├── src/
│   ├── models/
│   ├── services/
│   └── api/
└── tests/

frontend/
├── src/
│   ├── components/
│   ├── pages/
│   └── services/
└── tests/

# [REMOVE IF UNUSED] Option 3: Mobile + API (when "iOS/Android" detected)
api/
└── [same as backend above]

ios/ or android/
└── [platform-specific structure: feature modules, UI flows, platform tests]
```

**Structure Decision**: [Document the selected structure and reference the real
directories captured above]

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Owner | Expiration/Follow-up | Simpler Alternative Rejected Because |
|-----------|------------|-------|----------------------|-------------------------------------|
| [e.g., unpinned dependency] | [current need] | [name/role] | [date/task] | [why pinning is not possible yet] |
| [e.g., skipped accessibility test] | [specific problem] | [name/role] | [date/task] | [why normal verification cannot run] |
