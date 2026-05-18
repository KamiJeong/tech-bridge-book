# template-spec-kit-codex

This repository is a **Spec Kit starter template for Codex/GitHub Copilot-style agents**.

It is **not an application** with product code. Instead, it gives you a prepared workspace for **AI-assisted, spec-driven development**:

- Codex is configured as the default integration
- Spec Kit workflow files are already present
- agent skill files are included under `.agents/skills/`
- project rules live in `.specify/memory/constitution.md`
- extension hooks are configured in `.specify/extensions.yml`

## What this project is for

Use this template when you want to start a repository where work follows the Spec Kit flow:

1. define a feature in a spec
2. create an implementation plan
3. generate tasks
4. implement with an AI agent
5. run review and verification gates

The default workflow in this repo is:

`/speckit.specify` → `/speckit.plan` → `/speckit.tasks` → `/speckit.implement`

## What is included

- **`.specify/`**: Spec Kit configuration, templates, workflow definitions, scripts, and extension settings
- **`.agents/skills/`**: skill definitions for commands such as specify, plan, tasks, implement, analyze, verify, docguard, and git helpers
- **`AGENTS.md`**: agent context entrypoint

This repository also includes configuration for a Codex integration and references community Spec Kit extensions such as git automation, documentation checks, version guardrails, verification, and task verification.

## Repository structure

```text
.
├── .agents/           # AI agent skill definitions
├── .specify/          # Spec Kit config, templates, scripts, workflows, memory
├── AGENTS.md          # Agent bootstrap/context file
└── README.md
```

## How to use it

1. Create or clone a repository from this template.
2. Open it in an environment that supports the Spec Kit + Codex workflow.
3. Review and update `.specify/memory/constitution.md` for your team rules.
4. Add your feature specs under `specs/` as you begin work.
5. Run the Spec Kit commands in order:
   - `/speckit.specify`
   - `/speckit.plan`
   - `/speckit.tasks`
   - `/speckit.implement`

## Spec Kit extensions

Extensions are optional (or required) plugins that add commands and **lifecycle hooks** to the core Spec Kit workflow. Hooks fire automatically at key stages (e.g. `before_plan`, `after_implement`) so you get consistent quality gates, git automation, and observability without manually calling each tool.

Extension definitions live under `.specify/extensions/<id>/extension.yml`. Which hooks are active and whether they are enabled is controlled by `.specify/extensions.yml`.

### Bundled extensions

#### `git` — Git Branching Workflow

Automates all routine git operations so the agent never forgets to commit or branch.

| Command | Description |
|---|---|
| `speckit.git.initialize` | Initialize a Git repository with an initial commit |
| `speckit.git.feature` | Create a numbered feature branch before specification begins |
| `speckit.git.validate` | Validate that the current branch follows naming conventions |
| `speckit.git.remote` | Detect the Git remote URL for GitHub integration |
| `speckit.git.commit` | Auto-commit changes at the end of each Spec Kit stage |

**Hooks:** runs `git.initialize` before constitution setup; creates a feature branch before `specify`; auto-commits before and after every major stage (specify, clarify, plan, tasks, implement, checklist, analyze, taskstoissues).

---

#### `docguard` — DocGuard CDD Enforcement

Enforces Canonical-Driven Development (CDD) — keeps documentation in sync with implementation through 19 automated validators.

| Command | Description |
|---|---|
| `speckit.docguard.guard` | Run the full 19-validator quality gate with severity triage and a remediation plan |
| `speckit.docguard.review` | Read-only cross-document semantic consistency analysis |
| `speckit.docguard.score` | Calculate a CDD maturity score with an improvement roadmap |
| `speckit.docguard.diagnose` | Diagnose all issues and generate an AI remediation plan |
| `speckit.docguard.fix` | AI-driven documentation repair with codebase research and validation loops |
| `speckit.docguard.generate` | Reverse-engineer canonical docs from an existing codebase |

**Hooks:** reviews documentation consistency before `tasks`; shows a CDD maturity score after `tasks`; runs the full quality gate after `implement`.

---

#### `version-guard` — Version Guard

Pins your tech-stack to verified versions before any code is written, then validates that generated code does not use deprecated or incompatible APIs.

| Command | Description |
|---|---|
| `speckit.version-guard.check` | Check tech-stack versions against live registries and write constraints |
| `speckit.version-guard.load` | Load saved version constraints into agent context before task generation or implementation |
| `speckit.version-guard.validate` | Scan generated code for API patterns incompatible with the pinned versions |

**Hooks:** checks versions before `plan`; loads constraints before `tasks` and `implement`; validates generated code after `implement`.

---

#### `verify` — Verify Extension

A post-implementation quality gate that validates the implementation against spec, plan, and task artifacts.

| Command | Description |
|---|---|
| `speckit.verify.run` | Validate that the implementation matches all specification artifacts |

**Hooks:** runs automatically after `implement` (optional, prompted).

---

#### `verify-tasks` — Verify Tasks Extension

Detects *phantom completions* — tasks marked `[X]` in `tasks.md` that have no real implementation backing them.

| Command | Description |
|---|---|
| `speckit.verify-tasks.run` | Scan for phantom completions in a fresh session |

**Hooks:** runs automatically after `implement` (optional, prompted).

---

#### `token-analyzer` — Token Consumption Analyzer

Captures and compares token usage across SDD workflow stages so you can measure and optimize agent efficiency.

| Command | Description |
|---|---|
| `speckit.token-analyzer.baseline` | Capture a token-metric baseline for the current stage |
| `speckit.token-analyzer.compare` | Compare token consumption between two workflow runs |
| `speckit.token-analyzer.report` | Generate a full token analysis report from captured data |

**Hooks:** captures a baseline after `specify`, `plan`, `tasks`, and `implement`.

---

### How hooks work

The file `.specify/extensions.yml` declares every hook slot. Each entry has:

```yaml
- extension: git           # which extension owns this command
  command: speckit.git.commit
  enabled: true            # set to false to disable
  optional: true           # if true, agent may prompt before running
  prompt: "Commit changes?" # shown to the user when optional
  description: "..."
```

Set `enabled: false` on any hook to disable it project-wide without removing the extension.

### Adding or removing extensions

1. Place the extension folder under `.specify/extensions/<id>/`.
2. Add or remove the corresponding hook entries in `.specify/extensions.yml`.
3. For community extensions, the catalog URL is configured in `.specify/extension-catalogs.yml`.

## Important note

Because this is a template/configuration repository, you should expect to add your own:

- product source code
- tests
- build tooling
- deployment configuration

The files already in this repo are mainly there to define **process, workflow, and agent behavior**.
