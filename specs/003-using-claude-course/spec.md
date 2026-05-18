# Feature Specification: Using Claude — Multilingual Course Specification

**Feature Branch**: `codex/issue-14-using-claude-course`

**Spec Number**: `003`

**Created**: 2026-05-18

**Status**: Ready for review

**Input**: GitHub Issue #14 — Create a GitBook-based multilingual course specification for "Using Claude"

---

## User Scenarios & Testing *(mandatory)*

### User Story 1 — Navigate the Course Structure (Priority: P1)

A learner or course author can open the Tech Bridge Book GitBook and find the "Using Claude" course in all three languages, understand the curriculum from the overview page, and confirm that every chapter placeholder is present and consistently structured.

**Why this priority**: The course IA must exist before any lesson drafting can begin.

**Independent Test**: Open `SUMMARY.md` and confirm the "Using Claude" course appears under Korean, English, and Japanese sections with aligned chapter links.

**Acceptance Scenarios**:

1. **Given** a new contributor opens the GitBook, **When** they navigate to the Korean course landing page, **Then** they see the course title, target audience, learning outcomes, and links to all 17 chapter directories.
2. **Given** an author starts drafting Chapter 3, **When** they open the chapter directory, **Then** they find a README with the lesson structure placeholder and a naming-convention note.

---

### User Story 2 — Use the Course Specification as an Authoring Guide (Priority: P1)

A course author can read `spec.md`, the curriculum map, and the lesson definition of done to understand exactly what each chapter must contain before it is considered complete.

**Why this priority**: The spec is the source of truth for all future lesson writing. Without it, authoring decisions will diverge across chapters and languages.

**Independent Test**: Read `specs/003-using-claude-course/spec.md` and confirm it contains: course overview, target audience, learning outcomes, prerequisite knowledge, course scope, out-of-scope topics, curriculum map (17 chapters), lesson definition of done, and multilingual content strategy.

**Acceptance Scenarios**:

1. **Given** an author picks up Chapter 7, **When** they read the spec curriculum map, **Then** they know the exact lesson title, learning goal, and practical use case for that chapter.
2. **Given** an author completes a lesson draft, **When** they check the definition of done, **Then** they can verify each required section is present in all three language files.

---

### User Story 3 — Apply Reusable Templates and Reference Materials (Priority: P2)

A course author can copy the lesson template, exercise template, and thinking-question template directly into any chapter directory and fill in the blanks without needing to recall the required structure from memory.

**Why this priority**: Reusable templates prevent structural drift across 17 chapters and 3 languages.

**Independent Test**: Open each template file and confirm all 14 required lesson sections are present, exercises cover at least 5 exercise types, and thinking questions address all 8 reflection dimensions.

**Acceptance Scenarios**:

1. **Given** an author creates a new lesson file, **When** they copy the lesson template, **Then** every required section (Title through Next step) is scaffolded.
2. **Given** an author writes an exercise, **When** they reference the exercise template, **Then** they find a workplace-scenario framing, instruction block, and safety note.

---

### User Story 4 — Find Prompt Patterns and Safety Guidance (Priority: P2)

A learner or author can open the Claude prompt pattern library and the AI safety checklist to find reusable prompting patterns and know what information must never be shared with Claude.

**Why this priority**: Prompt patterns are the core skill the course teaches. The safety checklist is constitutionally required.

**Independent Test**: Open the prompt pattern library and confirm 13 or more named patterns are defined. Open the safety checklist and confirm all 10 privacy and trust caution areas from the issue are covered.

**Acceptance Scenarios**:

1. **Given** a learner wants to summarize a document, **When** they open the prompt pattern library, **Then** they find a named pattern with a template, expected output, and common mistake warning.
2. **Given** a learner is unsure whether to paste a file into Claude, **When** they read the safety checklist, **Then** they are warned against sharing credentials, PII, confidential company data, and regulated records.

---

### Edge Cases

- If a chapter scope becomes too broad for one lesson, the chapter README must direct authors to split it into sub-lessons using a defined naming convention.
- If a term has no natural translation, the glossary entry must preserve the English term with a localized explanation rather than force a literal translation.
- If a Claude feature is plan-dependent, the lesson must state that availability varies and learners should check their current Claude interface.
- If a prompt example could contain personal or confidential data, the safety checklist must substitute a fictional placeholder in every language version.

---

## Course Overview

**Course Title**: Using Claude

**Tagline**: Think, ask, verify, refine — practical AI collaboration for real work.

**Difficulty Level**: 13+ (approachable for motivated beginners, practical for real work, respectful of adult learners)

**Canonical Language**: Korean

**Published Languages**: Korean, English, Japanese

**Publishing Format**: GitBook-friendly Markdown

**Course Philosophy**: This is not a Claude feature manual. It teaches learners how to think and collaborate with an AI assistant — forming good habits, asking better questions, verifying outputs, and knowing when not to use Claude at all.

---

## Target Audience

**Primary learner types** (12 personas):

| Persona | Background |
|---|---|
| Non-developer founder | Runs a business, minimal technical background |
| Product manager | Bridges business and technical teams |
| Planner | Creates schedules, workflows, project plans |
| Marketer | Writes copy, analyzes campaigns, creates content |
| Operator | Manages day-to-day business processes |
| Designer | Creates visual assets, user flows, presentations |
| Researcher | Collects and synthesizes information |
| Beginner developer | Writes some code, not yet fluent in AI tooling |
| Student or career changer | Learning for professional transition |
| Customer support staff | Handles tickets, drafts replies, escalates issues |
| QA staff | Tests products, writes test cases, reviews output |
| Internal automation learner | Explores workflow automation without coding |

**What all learners share**:
- Motivated to improve their work with AI
- Not required to know how AI models are built
- May have tried Claude but not yet built consistent habits
- Need practical, immediately applicable guidance

---

## Learning Outcomes

After completing this course, learners will be able to:

1. Explain what Claude is and distinguish it from other AI tools and chatbots.
2. Identify at least 10 practical use cases where Claude can accelerate their real work.
3. Recognize when Claude is the wrong tool for a task and why.
4. Write clear, context-rich prompts that produce useful outputs.
5. Apply at least 5 named prompt patterns to recurring work scenarios.
6. Execute at least 3 end-to-end workflows using Claude (e.g., document to summary, idea to proposal).
7. Verify Claude outputs for accuracy, bias, and completeness before using them.
8. Identify information that must never be shared with Claude.
9. Use Claude's core features (chats, projects, artifacts, document analysis) confidently.
10. Choose between Claude general usage and Claude Code for their specific role.

---

## Prerequisite Knowledge

- Can type and use a web browser
- Has a Claude account or access to a Claude interface
- No programming knowledge required
- No prior AI knowledge required

---

## Course Scope

**In scope**:
- Practical use of Claude through chat interface
- Prompting patterns and mental models
- Workflow integration for non-developer roles
- AI safety and privacy habits
- Claude features: chats, projects, artifacts, file analysis, multilingual writing
- Claude Code introduction as an optional advanced path

**Out of scope**:
- Building AI models or fine-tuning
- API integration or developer SDK usage (except brief Claude Code introduction)
- Other AI tools (Gemini, GPT, Copilot, etc.)
- Proprietary company AI deployments
- Detailed legal or compliance analysis of AI usage

---

## Curriculum Map

### Chapter 0: Before You Start
**Goal**: Set expectations and prepare the learner's mindset.
**Learning outcome**: Learner can describe what Claude is, what it is not, and what they will be able to do after this course.
**Key concept**: AI assistant vs. search engine vs. automation tool.
**Practical use case**: Evaluating whether Claude is the right tool for an upcoming task.

### Chapter 1: What Claude Is and What It Is Not
**Goal**: Understand Claude's nature, capabilities, and limits.
**Learning outcome**: Learner can distinguish Claude from other tools and explain its core capability areas.
**Key concept**: Writing partner, thinking partner, research assistant, document assistant, coding helper.
**Practical use case**: Introducing Claude to a colleague who has never used it.

### Chapter 2: The Basic Mental Model of AI Assistants
**Goal**: Build an accurate mental model of how Claude works (without deep technical detail).
**Learning outcome**: Learner can explain why Claude sometimes makes mistakes and what to do about it.
**Key concept**: Context window, session memory, hallucination, verification habit.
**Practical use case**: Understanding why Claude gave a wrong answer and how to correct it.

### Chapter 3: How to Ask Better Questions
**Goal**: Learn the components of a good Claude prompt.
**Learning outcome**: Learner can identify what makes a prompt weak and rewrite it to be stronger.
**Key concept**: Role, context, instruction, format, constraint.
**Practical use case**: Turning a vague request into a specific, useful prompt.

### Chapter 4: Turning Messy Thoughts into Clear Prompts
**Goal**: Practice the habit of organizing thoughts before prompting.
**Learning outcome**: Learner can convert a brain dump into a structured Claude request.
**Key concept**: Brain dump → structured prompt → refined output cycle.
**Practical use case**: Preparing a meeting agenda from scattered notes.

### Chapter 5: Writing and Rewriting with Claude
**Goal**: Use Claude as a writing partner for professional documents.
**Learning outcome**: Learner can use Claude to draft, improve tone, and restructure written content.
**Key concept**: First draft, tone adjustment, structural editing, human final review.
**Practical use case**: Improving an email, report, or proposal draft.

### Chapter 6: Summarizing and Analyzing Documents
**Goal**: Use Claude to extract key information from long documents.
**Learning outcome**: Learner can upload or paste a document and prompt Claude for summaries, action items, and key decisions.
**Key concept**: Document analysis, extraction, summarization, action item identification.
**Practical use case**: Reviewing a long contract, report, or research paper.

### Chapter 7: Research Support and Fact-Checking Habits
**Goal**: Use Claude to support research while maintaining verification habits.
**Learning outcome**: Learner can use Claude for research scaffolding and knows how to verify Claude outputs against authoritative sources.
**Key concept**: Claude as a research starting point, not a final source. Hallucination risk.
**Practical use case**: Preparing a background briefing or market overview.

### Chapter 8: Planning Work with Claude
**Goal**: Use Claude to create and refine work plans.
**Learning outcome**: Learner can use Claude to generate project plans, timelines, and checklists from a high-level description.
**Key concept**: Work breakdown, milestone planning, checklist generation.
**Practical use case**: Creating a product launch plan or event preparation checklist.

### Chapter 9: Creating Tables, Checklists, and Structured Outputs
**Goal**: Use Claude to produce structured data formats from unstructured input.
**Learning outcome**: Learner can prompt Claude to convert messy notes into tables, checklists, and structured reports.
**Key concept**: Structured output prompt patterns, table formatting, checklist design.
**Practical use case**: Converting a meeting transcript into a decision log and action item table.

### Chapter 10: Using Claude for Multilingual Work
**Goal**: Use Claude to translate, localize, and write in multiple languages.
**Learning outcome**: Learner can use Claude to translate content while preserving meaning and tone, and knows the limits of AI translation.
**Key concept**: Translation vs. localization, tone preservation, human review for official documents.
**Practical use case**: Localizing a marketing email or internal communication for a global team.

### Chapter 11: Using Claude for Technical Understanding
**Goal**: Use Claude to understand technical concepts and communicate with technical teams.
**Learning outcome**: Learner can ask Claude to explain technical topics in plain language and prepare clearer requirements for developers.
**Key concept**: Plain-language explanation, technical analogy, requirements preparation.
**Practical use case**: Understanding an error message or preparing a feature request for a development team.

### Chapter 12: Claude for Non-Developer Collaboration with Developers
**Goal**: Use Claude to bridge the communication gap between business and technical roles.
**Learning outcome**: Learner can use Claude to translate business needs into structured developer-ready specifications.
**Key concept**: User story format, acceptance criteria, requirements clarity.
**Practical use case**: Writing a feature brief that a developer can act on without three rounds of clarification.

### Chapter 13: Artifacts and Interactive Outputs
**Goal**: Understand and use Claude's artifact feature to generate interactive content.
**Learning outcome**: Learner can create simple artifacts (documents, tables, visualizations) using Claude and understand their appropriate use cases.
**Key concept**: Claude artifacts, reusable outputs, shareable content.
**Practical use case**: Creating a shareable comparison table or formatted document artifact.

### Chapter 14: Claude Code Introduction — An Advanced Path
**Goal**: Understand what Claude Code is and when it is relevant for non-developer or beginner-developer learners.
**Learning outcome**: Learner can explain the difference between Claude (chat) and Claude Code (development assistant) and decide whether Claude Code is relevant to their role.
**Key concept**: Claude Code as a development workflow tool, not a general chat interface.
**Practical use case**: Exploring whether Claude Code could help a beginner developer or non-developer automation learner.

### Chapter 15: Practical Mini Projects
**Goal**: Apply course learning through end-to-end mini projects that simulate real work.
**Learning outcome**: Learner can complete at least one end-to-end project using Claude — from problem statement to verified output.
**Key concept**: End-to-end Claude workflow, multi-step prompting, output verification.
**Practical use case**: One project per learner persona (12 mini projects total, each aligned to a learner type).

### Chapter 16: Final Safety Checklist and Next Steps
**Goal**: Consolidate AI safety habits and define a personal next-steps plan.
**Learning outcome**: Learner can apply the full safety checklist to any Claude task and identify at least three areas to practice further.
**Key concept**: AI safety checklist, privacy-first habits, human judgment requirements.
**Practical use case**: Reviewing a completed Claude workflow against the full safety checklist before submitting work.

---

## Lesson Structure (Required for Every Lesson)

Every lesson file MUST contain all of the following sections in order:

1. **Title** — Specific, action-oriented lesson title.
2. **Who this lesson is for** — Which personas this lesson serves and what prior knowledge is assumed.
3. **What you will learn** — 3–5 bullet outcomes in plain language.
4. **Why this matters in real work** — One paragraph connecting the lesson to a practical work scenario.
5. **Core concept explanation** — The central idea explained without jargon.
6. **Simple example** — A fictional but realistic workplace scenario or analogy.
7. **Claude prompt example** — At least one complete, ready-to-use Claude prompt.
8. **Hands-on exercise** — One thing the learner can do immediately.
9. **Thinking question** — A reflective question with no single right answer.
10. **Common mistakes** — 2–4 mistakes learners commonly make on this topic.
11. **Safety checklist** — What to verify or avoid before using the output.
12. **Summary** — 3–5 bullet recap of key takeaways.
13. **Next step** — Link or instruction pointing to the next lesson or action.

---

## Multilingual Content Strategy

| Aspect | Rule |
|---|---|
| Canonical language | Korean. All lessons are authored in Korean first. |
| Translation sequence | Korean → English → Japanese. |
| Structural alignment | All three language files must use identical section headings and chapter structure. |
| Meaning preservation | English and Japanese versions must preserve the same meaning, examples, and learning goals. Natural localization is preferred over literal translation. |
| Terminology | Recurring technical terms must have glossary entries in all three languages. Where a natural translation does not exist, use the English term with a localized explanation. |
| Plan-dependent features | If a Claude feature varies by plan, state "Availability may vary by Claude plan. Check your current Claude interface." in all three languages. |
| Review requirement | Every translated lesson requires a human review pass before it is marked complete. |

---

## Glossary Structure

The glossary is organized as a three-column table per language file:

| Term | Language | Definition |
|---|---|---|
| [Korean term] | Korean | [Plain-language definition in Korean] |

Cross-reference: the Korean glossary is the canonical source. English and Japanese files map to the same term list with localized definitions.

Initial glossary terms to be defined (minimum):
- AI assistant, Claude, prompt, context, hallucination, verification, artifact, project (Claude feature), session, token, output, input, workflow, safety checklist, localization.

---

## Claude Prompt Pattern Library

The pattern library defines reusable, named prompting patterns. Each pattern entry must include:

- **Pattern name** — Short, memorable label.
- **When to use** — The situation where this pattern applies.
- **Prompt template** — A fill-in-the-blank template the learner can copy.
- **Expected output** — What a good response looks like.
- **Common mistake** — One mistake learners make with this pattern.

**Required patterns** (minimum 13):

1. Plain-language explainer
2. Document summarizer
3. Option comparator
4. Work plan generator
5. Draft improver
6. Clarifying-question requester
7. Multi-alternative generator
8. Answer critic
9. Risk identifier
10. Checklist creator
11. Messy-notes-to-structure converter
12. Technical concept translator (for non-developers)
13. Developer requirements preparer

---

## Safety Checklist

The AI safety checklist must appear in every chapter's lesson file and as a standalone reference document. Required caution areas:

1. Do not blindly trust Claude's answers — verify before using.
2. Do not paste secrets, passwords, API keys, or credentials.
3. Do not paste private customer data or personal information.
4. Do not share confidential company information unless the organization's policy permits it.
5. Do not use Claude as the only source for legal, medical, financial, or high-risk decisions.
6. Do not assume Claude knows the latest facts — check the knowledge cutoff and verify recent information.
7. Do not submit Claude output as final work without human review.
8. Do not use Claude to avoid thinking — use it to think better.
9. Do not use Claude for tasks you cannot reasonably verify.
10. Do not share confidential files unless explicitly permitted by organization policy.

---

## GitBook Folder Structure

```
content/
  ko/
    courses/
      using-claude/
        README.md                    (course landing page)
        course-overview.md           (audience, outcomes, prerequisites, scope)
        curriculum-map.md            (17 chapters overview)
        prompt-pattern-library.md    (13+ named patterns)
        safety-checklist.md          (10 caution areas)
        glossary.md                  (course-specific terms)
        definition-of-done.md        (lesson completion criteria)
        ch00-before-you-start/
          README.md
        ch01-what-claude-is/
          README.md
        ch02-mental-model/
          README.md
        ch03-better-questions/
          README.md
        ch04-messy-thoughts/
          README.md
        ch05-writing-rewriting/
          README.md
        ch06-summarizing-documents/
          README.md
        ch07-research-support/
          README.md
        ch08-planning-work/
          README.md
        ch09-tables-checklists/
          README.md
        ch10-multilingual-work/
          README.md
        ch11-technical-understanding/
          README.md
        ch12-developer-collaboration/
          README.md
        ch13-artifacts/
          README.md
        ch14-claude-code-intro/
          README.md
        ch15-mini-projects/
          README.md
        ch16-safety-next-steps/
          README.md
  en/
    courses/
      using-claude/
        [mirror of ko/ structure]
  ja/
    courses/
      using-claude/
        [mirror of ko/ structure]
```

---

## File Naming Convention

| File type | Convention | Example |
|---|---|---|
| Course landing page | `README.md` | `content/ko/courses/using-claude/README.md` |
| Course reference documents | `kebab-case.md` | `course-overview.md`, `prompt-pattern-library.md` |
| Chapter directory | `ch[NN]-[short-slug]/` | `ch03-better-questions/` |
| Chapter lesson file | `README.md` inside chapter directory | `ch03-better-questions/README.md` |
| Language path | `ko/`, `en/`, `ja/` | `content/ko/courses/using-claude/` |

Rules:
- All file and directory names use lowercase kebab-case.
- Chapter numbers are always two digits (ch00, ch01, ... ch16).
- No spaces, underscores, or uppercase letters in file or directory names.
- Korean is always authored first; English and Japanese files mirror the same path.

---

## Definition of Done (Per Lesson)

A lesson is complete when all of the following are true:

- [ ] Korean source file exists at the correct path with all required sections.
- [ ] English translation exists at the mirrored path and all sections match the Korean structure.
- [ ] Japanese translation exists at the mirrored path and all sections match the Korean structure.
- [ ] All required sections are non-empty (no placeholder text remains).
- [ ] The Claude prompt example is tested and produces a reasonable output.
- [ ] The hands-on exercise is specific and completable in under 15 minutes.
- [ ] The safety checklist section is present and lists at least 2 relevant caution items.
- [ ] Any Claude features mentioned are noted as plan-dependent where applicable.
- [ ] All recurring terms are defined in the course glossary.
- [ ] A human reviewer has read and approved the Korean source.
- [ ] Translated versions have been reviewed for meaning preservation (not just literal translation).
- [ ] SUMMARY.md links to the lesson file.
