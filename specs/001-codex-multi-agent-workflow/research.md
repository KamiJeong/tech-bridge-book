# Research: Codex Spec Kit Multi-Agent Workflow With Mandatory Token Analysis

## Decision: Implement as Repository Workflow Assets

**Rationale**: The feature is a Codex/Spec Kit workflow setup, not product application behavior. The required artifacts naturally map to project-scoped agent definitions, skills, shell guard scripts, Markdown guidance, JSON token records, and TOML agent configuration.

**Alternatives considered**:

- Application source modules: Rejected because no runtime application behavior is requested.
- External package or plugin: Rejected because the acceptance criteria require project-local `.codex/agents/`, `.agents/skills/`, `AGENTS.md`, and `.specify/token-analysis/` artifacts.

## Decision: Keep Token Analysis Observability-Only by Default

**Rationale**: The specification requires token analysis after every phase but says token usage is not a quality gate unless thresholds are explicitly configured. The plan therefore treats missing or high token data as warnings by default, with blocking only when `.specify/token-analysis/token-budget.json` contains explicit blocking thresholds.

**Alternatives considered**:

- Always block on high token usage: Rejected because the spec explicitly says not to treat token analysis as a default quality gate.
- Silently continue when token data is missing: Rejected because the spec requires clear reporting and no silent skips.

## Decision: Use Exact Token Data When Available, Estimated Records Otherwise

**Rationale**: The existing token-analyzer extension includes scripts for supported phases, but exact model usage may not be exposed for custom orchestration phases or local Codex runs. Estimated records keep observability complete while clearly marking uncertainty through `capture_method`.

**Alternatives considered**:

- Record only exact token data: Rejected because many required custom phases would have no token record.
- Store raw CLI responses for later parsing: Rejected because the spec excludes temporary raw CLI response files unless explicitly required and raises privacy risk.

## Decision: Represent `auto-commit` as a Permission Flag

**Rationale**: Clarification established that `auto-commit` is not a standalone execution mode. Treating it as an explicit permission flag preserves the required mode list while giving guard scripts a precise automation condition to check.

**Alternatives considered**:

- Add a fifth `auto-commit` mode: Rejected because it would contradict the required execution mode list.
- Allow commits only inside `auto-pr`: Rejected because the clarified workflow allows explicit commit automation outside PR creation.

## Decision: Use Slicing Heuristic With Explicit Override

**Rationale**: The slicer needs a testable default. A request becomes a slicing candidate when it spans multiple independent deliverables, shared contracts, or more than one implementation area, unless explicitly overridden.

**Alternatives considered**:

- Split only on user request: Rejected because the workflow must proactively decide before specify.
- Always ask before slicing: Rejected because it adds unnecessary friction for low-risk obvious splits.
- Fixed task-count threshold only: Rejected because task count is unavailable before planning and does not capture contract conflict risk.

## Decision: Define Contracts for Generated Artifacts

**Rationale**: The feature's correctness depends on predictable agent files, skill files, token step records, and PR token summaries. Contracts make the later task list independently verifiable without imposing application runtime code.

**Alternatives considered**:

- Rely only on prose in `spec.md`: Rejected because task verification would be weaker.
- Use a full schema for every Markdown artifact: Rejected because lightweight Markdown contracts are sufficient and easier to maintain.

## Decision: Version Guard Skips Dependency Verification

**Rationale**: The repository has no package manifests, lockfiles, or tech-stack decision record. The feature introduces no package dependency. A skipped version-guard artifact is the correct result and prevents downstream phases from assuming version verification occurred.

**Alternatives considered**:

- Invent a technology stack: Rejected because it would violate existing project structure and introduce unnecessary dependencies.
- Browse package registries anyway: Rejected because no packages are selected or locked.
