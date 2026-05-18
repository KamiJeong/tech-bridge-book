# Tech Bridge Book

Tech Bridge Book is a GitBook-friendly multilingual education document
collection about AI and practical technology.

The project is for non-developers who want to learn from beginner level to
real-world work application. Content should feel approachable but meaningful:
not childish, not expert-only, and useful for practical work such as documents,
spreadsheets, reports, planning, customer communication, marketing, operations,
research, and automation.

Primary output languages:

- Korean: canonical source language unless a spec says otherwise
- English: localized from the Korean source
- Japanese: localized from the Korean source

Primary publishing format:

- GitBook-friendly Markdown

## Current Project State

This repository currently contains the Spec Kit and Codex workflow foundation
for the book. It is not yet a finished GitBook content repository.

Current assets include:

- `.specify/memory/constitution.md`: project constitution for Tech Bridge Book
- `.specify/templates/`: Spec Kit templates customized for lesson and
  curriculum work
- `.agents/skills/`: Codex skills for Spec Kit commands and supporting gates
- `.codex/agents/`: project-scoped Codex agent role definitions
- `specs/001-codex-multi-agent-workflow/`: completed workflow setup spec and
  validation evidence
- `AGENTS.md`: Codex entrypoint instructions for this workspace

Expected future content assets include:

- Korean lesson files
- English lesson files
- Japanese lesson files
- glossary and terminology files
- GitBook navigation or table-of-contents files
- Markdown linting, link checking, or publishing validation scripts

## Content Rules

All lesson work must follow `.specify/memory/constitution.md`.

In short, every lesson must:

- assume a non-developer learner
- follow a 13+ difficulty standard
- include theory plus learner action
- connect to a practical work scenario
- exist in Korean, English, and Japanese
- preserve terminology and learning outcomes across languages
- follow the required lesson structure
- include AI safety guidance when AI is involved
- be clean GitBook-friendly Markdown
- include a clear next step

Required lesson structure:

1. Title
2. Who this lesson is for
3. What you will learn
4. Why this matters in real work
5. Core concept explanation
6. Simple example
7. Hands-on exercise
8. Thinking question
9. Common mistakes
10. Summary
11. Next step

## How To Use With Codex

Open this repository in Codex and work through the Spec Kit flow. Codex should
read `AGENTS.md`, then the constitution and active templates.

Use this workflow for a new lesson or curriculum change:

1. Create or update the feature spec.

   ```text
   $speckit-specify Create a lesson about [topic].
   Target learner: [non-developer learner profile].
   Learning goal: [what the learner should understand or do].
   Practical work use case: [documents/spreadsheets/reports/etc.].
   Exercise: [mini-task idea].
   Output languages: Korean, English, Japanese.
   ```

2. Clarify unclear decisions if Codex reports ambiguity.

   ```text
   $speckit-clarify
   ```

3. Generate the content plan.

   ```text
   $speckit-plan
   ```

4. Generate tasks for drafting, localization, glossary updates, safety review,
   and GitBook Markdown review.

   ```text
   $speckit-tasks
   ```

5. Implement the lesson content.

   ```text
   $speckit-implement
   ```

6. Review consistency and completion.

   ```text
   $speckit-analyze
   ```

Useful direct request format:

```text
Create a Tech Bridge Book lesson on "AI hallucination".
Audience: office workers with no technical background.
Practical use case: checking AI-generated report summaries.
Include Korean, English, and Japanese versions.
Add glossary terms and GitBook-friendly Markdown.
```

## Recommended Codex Prompts

Use these prompt patterns when asking Codex to work in this repository.

For a new lesson:

```text
Create a new lesson spec for [topic].
Use the Tech Bridge Book constitution.
Target learner: [learner].
Practical scenario: [work situation].
Exercise: [learner action].
```

For a content revision:

```text
Revise the existing lesson on [topic].
Keep Korean, English, and Japanese versions consistent.
Check terminology, exercises, AI safety notes, and GitBook Markdown formatting.
```

For translation consistency:

```text
Review the Korean, English, and Japanese versions of [lesson].
Find meaning drift, terminology mismatch, missing sections, awkward localization,
and differences in exercises or next steps.
```

For GitBook readiness:

```text
Review [path] for GitBook-friendly Markdown.
Check headings, short paragraphs, tables, callouts, links, file naming, and page
length.
```

## Repository Structure

```text
.
├── .agents/           # Codex skill definitions
├── .codex/agents/     # Project-scoped Codex agent role definitions
├── .specify/          # Spec Kit config, templates, scripts, workflows, memory
├── specs/             # Feature specs, plans, tasks, contracts, validation
├── AGENTS.md          # Codex bootstrap/context file
└── README.md
```

Future content directories may look like this:

```text
content/
├── ko/
│   └── [lesson].md
├── en/
│   └── [lesson].md
├── ja/
│   └── [lesson].md
└── glossary/
    └── [terms].md
```

The exact content path should be defined in the relevant spec and plan before
lesson files are created.

## Spec Kit Extensions

The repository includes Spec Kit extension configuration in
`.specify/extensions.yml`.

Important extensions:

- `git`: repository initialization, feature branches, and optional commits
- `docguard`: documentation consistency review
- `verify`: post-implementation validation against spec artifacts
- `verify-tasks`: checks for tasks marked complete without real backing work
- `token-analyzer`: token usage reporting for workflow stages
- `version-guard`: present from the starter workflow, mostly relevant if future
  tooling or code dependencies are introduced

Hooks may run before or after Spec Kit stages. Optional hooks can be skipped
when they are not relevant. Mandatory hooks should be treated as blockers unless
an explicit override is recorded.

## Definition Of Done

A lesson is done only when it has:

- Korean, English, and Japanese versions
- consistent terminology across all languages
- at least one hands-on exercise or practical mini-task
- at least one thinking question
- a practical work scenario
- beginner-friendly explanations
- AI safety notes when AI is involved
- reviewed GitBook Markdown formatting
- a clear next step

Do not mark a lesson complete if any required language version, exercise,
thinking question, glossary update, safety note, or Markdown review is missing.
