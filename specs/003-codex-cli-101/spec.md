# Feature Specification: Codex CLI 101 Course

**Feature Branch**: `issue-19-codex-cli-101-spec`  
**Created**: 2026-05-19  
**Issue**: [#19](https://github.com/KamiJeong/tech-bridge-book/issues/19)  
**Status**: Draft  
**Input**: GitHub issue request to create a Codex CLI 101 introductory Markdown course.

## User Scenarios & Testing

### Primary User Story

As a beginner developer or technically curious learner, I want a friendly Korean
Markdown course about Codex CLI so that I can understand terminal-based AI coding
agents and practice installation, codebase reading, bug fixing, test execution,
and change review.

### Acceptance Scenarios

1. **Given** a learner opens the course README, **when** they review the
   curriculum, **then** they can see the target learner, learning goals, chapter
   sequence, and how to use the course.
2. **Given** a learner opens each chapter under `docs/`, **when** they read the
   page, **then** the page follows the required eight-section lesson structure.
3. **Given** a learner wants practice, **when** they open `exercises/`, **then**
   they can find chapter-linked problems that are specific enough to try.
4. **Given** an instructor prepares a workshop, **when** they open
   `instructor-guide.md`, **then** they can see a practical session flow,
   facilitation notes, and review checkpoints.
5. **Given** reviewers inspect the GitBook navigation, **when** they open
   `SUMMARY.md`, **then** the new course pages are linked with valid relative
   paths.

## Requirements

### Functional Requirements

- **FR-001**: The course MUST live under
  `content/ko/courses/codex-cli-101/`.
- **FR-002**: The course MUST include a course `README.md`.
- **FR-003**: The course MUST include eight chapter pages under `docs/`:
  overview, installation, basic usage, read codebase, fix bug, run tests,
  review changes, and Spec Kit workflow.
- **FR-004**: Every chapter page MUST include these sections in order:
  `오늘 배울 것`, `왜 중요한가`, `쉬운 설명`, `따라 해보기`, `흥미로운 문제`,
  `Codex에게 물어볼 예제 프롬프트`, `자주 하는 실수`, `체크리스트`.
- **FR-005**: The course MUST include `exercises/README.md` and chapter-linked
  exercise pages.
- **FR-006**: The course MUST include `prompts/codex-cli-prompts.md`.
- **FR-007**: The course MUST include `instructor-guide.md`.
- **FR-008**: Content MUST be GitBook-friendly Markdown with stable relative
  links and short beginner-readable sections.
- **FR-009**: The course MUST explain AI safety boundaries, including not
  pasting secrets, reviewing AI output, and verifying risky claims.
- **FR-010**: The first release is Korean canonical content. English and
  Japanese translation work MUST use the same file map and section structure in
  a follow-up issue before the course is considered fully multilingual.

### Non-Functional Requirements

- **NFR-001**: Tone MUST feel like a practical senior developer explaining
  calmly, not a formal API manual.
- **NFR-002**: Examples MUST avoid requiring private repositories, paid plans, or
  sensitive data.
- **NFR-003**: The course MUST be useful when read directly in GitBook or as raw
  Markdown.

## Scope

### In Scope

- Korean Codex CLI 101 course content.
- Course-specific exercises, prompts, and instructor guidance.
- GitBook navigation updates.
- Spec Kit artifacts and token reporting for the workflow.

### Out of Scope

- English and Japanese full translations for this issue.
- Live screenshots or video assets.
- Tooling automation beyond Markdown validation and path review.
- Current product pricing or plan-specific claims.

## Success Criteria

- All required Markdown files exist.
- Each chapter follows the required lesson structure.
- `SUMMARY.md` links to the course entry and chapter pages.
- Markdown links for the new course are valid relative links.
- Token report is generated for the workflow.

## Assumptions

- The target learner can use a terminal at a beginner level or is willing to
  follow terminal examples slowly.
- The course can describe installation conceptually without promising a specific
  current installer command, because Codex CLI distribution details may change.
- Exercises use toy repositories or sample situations rather than learner-owned
  confidential code.
