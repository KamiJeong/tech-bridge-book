<!--
Sync Impact Report
Version change: 1.0.0 -> 2.0.0
Modified principles:
- I. Spec Before Code -> I. Non-Developer-First Education
- II. Single Source of Truth -> II. 13+ Difficulty Standard
- III. Explicit Overrides Only -> III. Theory Plus Action
- IV. Version-Pinned Stack -> IV. Practical Work Connection
- V. Type Safety -> V. Multilingual Consistency
- VI. Code Quality -> VI. Consistent Lesson Structure
- VII. Testing Standards -> VII. AI Literacy and Safety
- VIII. UX Consistency -> VIII. GitBook Readability
- IX. Design System and Storybook Governance -> IX. Progressive Learning Path
- X. Accessibility -> X. Lesson Definition of Done
- XI. Performance Budgets -> removed
- XII. Security and Privacy by Default -> incorporated into VII. AI Literacy and Safety
- XIII. Clear Module Boundaries -> incorporated into VIII. GitBook Readability
- XIV. Local-First and Cost-Aware Development -> removed
- XV. AI Agent Governance -> incorporated into Governance
- XVI. Definition of Done -> X. Lesson Definition of Done
Added sections:
- Curriculum Scope
- Lesson Authoring Workflow and Quality Gates
Removed sections:
- Operational Constraints
- Spec-Driven Workflow and Quality Gates
Templates requiring updates:
- ✅ updated .specify/templates/plan-template.md
- ✅ updated .specify/templates/spec-template.md
- ✅ updated .specify/templates/tasks-template.md
- ✅ checked .specify/templates/commands/*.md (directory absent)
- ✅ updated README.md
- ✅ checked AGENTS.md
Follow-up TODOs:
- None
-->

# Tech Bridge Book Constitution

## Core Principles

### I. Non-Developer-First Education
All Tech Bridge Book content MUST assume the learner is not a software
developer. Technical terms MAY be introduced only when they are necessary for
understanding the topic, and each introduced term MUST be explained with a plain
language definition, a practical analogy or example, and a glossary entry when
the term is likely to recur.

**Rationale**: The project exists to help non-developers learn AI and practical
technology. Developer-first language creates avoidable barriers and weakens the
learning path.

**Enforcement guidance**: New lesson specs MUST define the target learner,
learning goal, practical use case, and expected prior knowledge. Reviews MUST
flag unexplained jargon, assumed programming knowledge, and examples that depend
on developer tools unless the lesson explicitly teaches those tools.

### II. 13+ Difficulty Standard
Content MUST be approachable but meaningful: not childish, not expert-only, and
respectful of adult learners. Lessons MUST be understandable by a motivated
beginner with normal computer literacy, while still naming real concepts and
showing realistic workplace use.

**Rationale**: The curriculum should build confidence without flattening the
subject into slogans or making learners feel talked down to.

**Enforcement guidance**: Authors MUST prefer short paragraphs, concrete
examples, and step-by-step explanations. When a concept is too complex for this
standard, it MUST be split into multiple lessons instead of compressed into one
dense page.

### III. Theory Plus Action
Every lesson MUST include both a clear theoretical explanation and at least one
hands-on exercise, thinking question, or practical mini-task that the learner can
try immediately.

**Rationale**: Learners retain technology concepts better when explanation is
paired with action and reflection.

**Enforcement guidance**: A lesson cannot be marked complete if it only explains
a concept. Each lesson MUST include one or more learner actions that require no
special developer setup unless the lesson explicitly prepares that setup.

### IV. Practical Work Connection
Lessons MUST connect AI and technology concepts to real work scenarios such as
documents, spreadsheets, reports, planning, customer communication, marketing,
operations, research, and automation.

**Rationale**: The audience needs transferable work capability, not abstract
technical trivia.

**Enforcement guidance**: Specs and lesson drafts MUST identify the practical
work scenario before content is written. Examples SHOULD use familiar office,
school, small-business, or personal productivity contexts.

### V. Multilingual Consistency
Korean is the canonical source language unless a spec explicitly states
otherwise. English and Japanese versions MUST preserve meaning, structure,
examples, terminology, learning outcomes, exercises, warnings, and next steps.
Translations SHOULD be localized naturally rather than word-for-word when a
literal translation would feel awkward.

**Rationale**: Learners in different languages should receive the same course
value and progression while reading natural language.

**Enforcement guidance**: Any content change MUST check all three language
versions. Shared terms MUST stay consistent across Korean, English, and
Japanese, and terminology decisions MUST be recorded in the relevant glossary or
lesson notes.

### VI. Consistent Lesson Structure
Each lesson MUST follow this repeatable structure:

- Title
- Who this lesson is for
- What you will learn
- Why this matters in real work
- Core concept explanation
- Simple example
- Hands-on exercise
- Thinking question
- Common mistakes
- Summary
- Next step

**Rationale**: A consistent structure helps beginners orient themselves and lets
multilingual versions stay aligned.

**Enforcement guidance**: Additional sections MAY be added when useful, but the
required sections MUST remain present and in a logical order. If a lesson needs
more than one major concept, it SHOULD be split.

### VII. AI Literacy and Safety
AI-related lessons MUST explain realistic limits of AI, hallucination risk,
privacy concerns, copyright awareness, data sensitivity, and the need for human
judgment. Content MUST NOT overpromise AI capabilities or present AI output as
automatically correct.

**Rationale**: Practical AI education is incomplete if learners do not understand
where AI is unreliable or risky.

**Enforcement guidance**: Prompting, automation, document, data, and research
lessons MUST include appropriate safety notes. Examples MUST avoid instructing
learners to paste confidential, personal, proprietary, or regulated data into AI
tools without clear safeguards.

### VIII. GitBook Readability
All documents MUST be clean, GitBook-friendly Markdown. Pages MUST use clear
headings, short paragraphs, readable lists, tables when useful, and callouts for
warnings or tips. File names and paths MUST be consistent and predictable.
Overly broad pages MUST be split.

**Rationale**: GitBook is the primary publishing format, so source Markdown must
remain readable, navigable, and maintainable.

**Enforcement guidance**: Authors MUST avoid oversized pages, deeply nested
headings, inconsistent title levels, broken links, and formatting that depends
on custom rendering outside GitBook. Markdown review is part of the definition
of done.

### IX. Progressive Learning Path
The curriculum MUST move from beginner concepts to practical usage in this
order unless a spec records a justified exception:

1. Basic digital and technology literacy
2. AI fundamentals
3. Prompting and AI collaboration
4. Data and document handling
5. Automation and workflow design
6. Practical mini-projects
7. Real-world application patterns

**Rationale**: Beginners need a stable path from confidence-building basics to
workplace application.

**Enforcement guidance**: New topics MUST identify their position in the
learning path, prerequisites, and next step. Curriculum structure changes MUST
preserve beginner accessibility and practical usefulness.

### X. Lesson Definition of Done
A lesson is complete only when it includes Korean, English, and Japanese
versions; consistent terminology; at least one exercise; at least one thinking
question; a practical work scenario; beginner-friendly explanations; reviewed
Markdown formatting; and a clear next step.

**Rationale**: Partial lessons create translation drift, uneven learner
outcomes, and incomplete curriculum progression.

**Enforcement guidance**: Completion evidence MUST list the three language
files, terminology checks, exercise and thinking question coverage, practical
scenario, Markdown review, and next-step link or instruction.

## Curriculum Scope

Tech Bridge Book is a GitBook-based multilingual AI and technology education
document collection for non-developers. The primary output languages are Korean,
English, and Japanese. The primary publishing format is GitBook-friendly
Markdown.

Curriculum work MUST prioritize practical learning outcomes over exhaustive
technical coverage. If a topic becomes too broad, the author MUST split it into
smaller lessons with clear prerequisites and next steps.

When adding a new topic, the spec MUST define:

- target learner
- learning goal
- practical work use case
- exercise or mini-task
- language files to create or update
- terminology or glossary impact

When revising existing content, the change MUST check all three language
versions for structure, meaning, terminology, examples, exercises, and next
steps.

## Lesson Authoring Workflow and Quality Gates

`/speckit.specify` MUST capture learner audience, learning goal, curriculum
position, practical work scenario, required language outputs, safety concerns,
lesson structure, and success criteria.

`/speckit.clarify` MUST resolve ambiguity that affects audience level,
curriculum sequence, multilingual scope, exercises, safety guidance, or GitBook
structure before planning.

`/speckit.plan` MUST translate the spec into a content plan with file paths for
Korean, English, and Japanese versions; terminology handling; Markdown/GitBook
formatting checks; translation consistency checks; and lesson completion
evidence.

`/speckit.tasks` MUST generate dependency-ordered tasks for canonical Korean
drafting, English and Japanese localization, glossary or terminology updates,
exercise and thinking-question creation, AI safety review when applicable,
GitBook Markdown review, and final multilingual consistency verification.

`/speckit.implement` MUST make only the content changes covered by the active
spec and tasks, preserve learner accessibility, update all affected language
versions, and report any incomplete translation or review work honestly.

`/speckit.analyze` and extension quality gates SHOULD verify consistency across
the spec, plan, tasks, content files, terminology, lesson structure, safety
notes, and completion evidence. Mandatory hooks MUST be treated as blockers
unless an explicit override is recorded.

## Governance

This constitution supersedes conflicting process instructions, generated
templates, agent memory, feature artifacts, and lesson drafts. Feature specs may
add stricter requirements but MUST NOT weaken these principles without an
amendment.

Any new document MUST follow this constitution. Any change to curriculum
structure MUST preserve beginner accessibility and practical usefulness. When
adding a new topic, the target learner, learning goal, practical use case, and
exercise MUST be defined before drafting. When revising existing content, all
three language versions MUST be checked for consistency.

Amendments MUST include proposed text, rationale, migration impact, affected
templates or workflow gates, and a version bump. Amendments require review by
the project owner or delegated maintainer before they are ratified.

Versioning follows semantic governance:

- MAJOR for backward-incompatible principle removals, weaker obligations, or
  redefinitions that change compliance expectations.
- MINOR for new principles, new required sections, or materially expanded
  enforcement guidance.
- PATCH for clarifications, examples, typo fixes, or non-semantic refinements.

Compliance review MUST occur during `/speckit.plan`, before implementation
begins, before tasks are marked complete, and during extension quality gates.
Unresolved constitutional violations MUST be tracked as explicit overrides or
block completion.

**Version**: 2.0.0 | **Ratified**: 2026-05-13 | **Last Amended**: 2026-05-18
