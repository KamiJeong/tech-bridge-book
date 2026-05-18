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

**Canonical Source Language**: [Korean unless explicitly overridden]

**Target Output Languages**: [Korean, English, Japanese or NEEDS CLARIFICATION]

**Publishing Format**: [GitBook-friendly Markdown]

**Target Learner**: [non-developer learner profile and assumed prior knowledge]

**Difficulty Standard**: [13+ beginner-friendly adult learner standard]

**Curriculum Position**: [digital literacy / AI fundamentals / prompting / data and documents / automation / mini-project / real-world pattern]

**Practical Work Scenario**: [documents, spreadsheets, reports, planning, customer communication, marketing, operations, research, automation, or other]

**Lesson Files**: [planned ko/en/ja Markdown paths]

**Terminology/Glossary Impact**: [new or changed terms and where they are recorded]

**AI Safety Scope**: [AI limits, hallucination, privacy, copyright, data sensitivity notes, or N/A with rationale]

**Markdown/GitBook Checks**: [heading, callout, table, link, page length, file naming checks]

**Translation Consistency Checks**: [meaning, structure, terminology, examples, exercises, next steps]

**Quality Commands**: [Markdown lint, link checks, glossary checks, repository scans, or manual review steps]

**Extension Gates**: [docguard/verify/verify-tasks/token-analyzer/git hooks that apply]

**Scale/Scope**: [number of lessons, language files, glossary entries, diagrams/tables, or NEEDS CLARIFICATION]

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- **Non-Developer-First Education**: target learner, assumed prior knowledge,
  jargon handling, analogies/examples, and glossary needs are explicit.
- **13+ Difficulty Standard**: the plan avoids childish simplification and
  expert-only explanation; complex topics are split when needed.
- **Theory Plus Action**: every lesson includes core explanation plus at least
  one exercise, thinking question, or mini-task.
- **Practical Work Connection**: each lesson maps to a real work scenario.
- **Multilingual Consistency**: Korean canonical source and English/Japanese
  localization paths, terminology, and review steps are defined.
- **Consistent Lesson Structure**: required lesson sections are present or any
  deviation is recorded as an explicit override.
- **AI Literacy and Safety**: AI-related lessons include limits,
  hallucination, privacy, copyright, data sensitivity, and human judgment.
- **GitBook Readability**: Markdown structure, page length, callouts, tables,
  links, and file naming are covered.
- **Progressive Learning Path**: curriculum position, prerequisites, and next
  step are identified.
- **Lesson Definition of Done**: completion evidence includes all language
  versions, terminology, exercise, thinking question, practical scenario,
  Markdown review, and next step.

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

### Content Files (repository root)
<!--
  ACTION REQUIRED: Replace the placeholder tree below with the concrete layout
  for this feature. Delete unused options and expand the chosen structure with
  real content paths.
-->

```text
[content-root]/
├── ko/
│   └── [lesson].md
├── en/
│   └── [lesson].md
├── ja/
│   └── [lesson].md
└── glossary/
    └── [terms].md
```

**Structure Decision**: [Document the selected structure and reference the real
directories captured above]

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Owner | Expiration/Follow-up | Simpler Alternative Rejected Because |
|-----------|------------|-------|----------------------|-------------------------------------|
| [e.g., only Korean draft in first pass] | [current need] | [name/role] | [date/task] | [why full ko/en/ja completion is not possible yet] |
| [e.g., lesson exceeds target page length] | [specific problem] | [name/role] | [date/task] | [why splitting cannot happen yet] |
