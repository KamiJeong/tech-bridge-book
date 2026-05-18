# Feature Specification: [FEATURE NAME]

**Feature Branch**: `[###-feature-name]`

**Created**: [DATE]

**Status**: Draft

**Input**: User description: "$ARGUMENTS"

## User Scenarios & Testing *(mandatory)*

<!--
  IMPORTANT: User stories should be PRIORITIZED as user journeys ordered by importance.
  Each user story/journey must be INDEPENDENTLY TESTABLE - meaning if you implement just ONE of them,
  you should still have a viable MVP (Minimum Viable Product) that delivers value.

  Assign priorities (P1, P2, P3, etc.) to each story, where P1 is the most critical.
  Think of each story as a standalone learner-facing slice that can be:
  - Drafted independently
  - Reviewed independently
  - Published independently
  - Demonstrated to learners independently
-->

### User Story 1 - [Brief Title] (Priority: P1)

[Describe this user journey in plain language]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Test**: [Describe how this can be tested independently - e.g., "Can be fully tested by [specific action] and delivers [specific value]"]

**Acceptance Scenarios**:

1. **Given** [initial state], **When** [action], **Then** [expected outcome]
2. **Given** [initial state], **When** [action], **Then** [expected outcome]

---

### User Story 2 - [Brief Title] (Priority: P2)

[Describe this user journey in plain language]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Test**: [Describe how this can be tested independently]

**Acceptance Scenarios**:

1. **Given** [initial state], **When** [action], **Then** [expected outcome]

---

### User Story 3 - [Brief Title] (Priority: P3)

[Describe this user journey in plain language]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Test**: [Describe how this can be tested independently]

**Acceptance Scenarios**:

1. **Given** [initial state], **When** [action], **Then** [expected outcome]

---

[Add more user stories as needed, each with an assigned priority]

### Edge Cases

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right edge cases.
-->

- What happens when [the topic is too broad for one GitBook page]?
- How does the lesson handle [sensitive data, privacy, or AI uncertainty]?

### Learner, Curriculum & Publishing Expectations *(mandatory)*

- **Target Learner**: [non-developer audience, prior knowledge, and why this lesson fits them]
- **Difficulty Standard**: [how the lesson meets the 13+ approachable adult beginner standard]
- **Curriculum Position**: [where this topic sits in the progressive learning path]
- **Practical Work Scenario**: [real work context such as documents, spreadsheets, reports, planning, customer communication, marketing, operations, research, or automation]
- **Output Languages**: [Korean canonical source plus English and Japanese versions]
- **GitBook Format**: [expected Markdown paths, headings, callouts, tables, links, and page-splitting expectations]
- **AI Safety Scope**: [AI limits, hallucination, privacy, copyright, data sensitivity, human judgment, or N/A with rationale]

## Requirements *(mandatory)*

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right functional requirements.
-->

### Functional Requirements

- **FR-001**: Lesson MUST define who it is for and what the learner will learn
- **FR-002**: Lesson MUST include why the topic matters in real work
- **FR-003**: Lesson MUST include a beginner-friendly core concept explanation
- **FR-004**: Lesson MUST include a simple example connected to the work scenario
- **FR-005**: Lesson MUST include at least one hands-on exercise or practical mini-task
- **FR-006**: Lesson MUST include at least one thinking question
- **FR-007**: Lesson MUST include common mistakes, summary, and next step
- **FR-008**: Lesson MUST include Korean, English, and Japanese versions with aligned meaning, structure, terminology, examples, exercises, and learning outcomes
- **FR-009**: AI-related lessons MUST include realistic AI limits, hallucination risk, privacy, copyright, data sensitivity, and human judgment guidance

*Example of marking unclear requirements:*

- **FR-010**: Lesson MUST use [NEEDS CLARIFICATION: canonical Korean term for key concept not specified]
- **FR-011**: Lesson MUST fit after [NEEDS CLARIFICATION: prerequisite lesson not specified]

### Terminology, Safety & Data *(mandatory)*

- **Terminology**: [new or reused terms in Korean, English, and Japanese]
- **Glossary Impact**: [glossary entries to create or update, or N/A]
- **AI/Data Safety**: [privacy, personal data, sensitive workplace data, copyright, or N/A]
- **Human Judgment**: [where the learner must verify, review, or decide instead of trusting automation]

### Key Content Artifacts *(include if feature involves structured content)*

- **[Artifact 1]**: [Lesson, glossary, exercise, table, diagram, or checklist and what it represents]
- **[Artifact 2]**: [Relationship to other lessons, language versions, or glossary terms]

## Success Criteria *(mandatory)*

<!--
  ACTION REQUIRED: Define measurable success criteria.
  These must be technology-agnostic and measurable.
-->

### Measurable Outcomes

- **SC-001**: [Learner outcome, e.g., "A beginner can explain the concept in their own words"]
- **SC-002**: [Practical outcome, e.g., "A learner can complete the mini-task using a workplace example"]
- **SC-003**: [Consistency outcome, e.g., "Korean, English, and Japanese versions preserve the same structure and learning outcome"]
- **SC-004**: [Publishing outcome, e.g., "Markdown renders cleanly in GitBook with no broken internal links"]

## Assumptions

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right assumptions based on reasonable defaults
  chosen when the feature description did not specify certain details.
-->

- [Assumption about target learners, e.g., "Learners can use a browser, documents, and spreadsheets"]
- [Assumption about scope boundaries, e.g., "Advanced programming details are out of scope for this lesson"]
- [Assumption about content environment, e.g., "GitBook Markdown is the publishing source"]
- [Dependency on existing curriculum asset, e.g., "Requires a previous lesson on basic prompts"]

## Constitution Alignment *(mandatory)*

- **Non-Developer-First Education**: [learner assumptions, jargon controls, analogy/example approach]
- **13+ Difficulty Standard**: [how content avoids both childish and expert-only tone]
- **Theory Plus Action**: [planned explanation and learner action]
- **Practical Work Connection**: [specific work scenario]
- **Multilingual Consistency**: [ko/en/ja scope and consistency review]
- **Consistent Lesson Structure**: [required sections covered]
- **AI Literacy and Safety**: [AI safety coverage or N/A with rationale]
- **GitBook Readability**: [Markdown/GitBook expectations]
- **Progressive Learning Path**: [prerequisite and next-step placement]
- **Lesson Definition of Done**: [completion evidence]
