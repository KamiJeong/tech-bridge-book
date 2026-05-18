# Data Model: Using Claude Course Specification

## Course

- `language`: `ko`, `en`, or `ja`
- `slug`: `using-claude`
- `title`: localized course title
- `overview`: purpose, audience, outcomes, prerequisites, scope
- `curriculum_map`: ordered chapter list
- `references`: prompt patterns, safety checklist, glossary, definition of done

## Chapter

- `number`: zero-padded chapter number, `00` through `16`
- `slug`: kebab-case directory name
- `title`: localized chapter title
- `goal`: chapter-level learning goal
- `learning_outcome`: learner capability after chapter
- `key_concept`: main idea
- `work_use_case`: practical workplace scenario
- `path`: `content/<language>/courses/using-claude/<chapter>/README.md`

## Template

- `lesson_template`: required lesson structure with constitution headings plus Claude prompt and safety sections
- `exercise_template`: immediate learner action with scenario, task, prompt starter, review step, and safety note
- `thinking_question_template`: reflection prompts covering context, misunderstanding, verification, privacy, improvement, and human judgment

## Reference Material

- `prompt_pattern`: name, when to use, template, expected output, common mistake
- `safety_item`: caution statement for privacy, verification, high-risk decisions, or human review
- `glossary_term`: term, language, beginner-friendly definition
- `definition_of_done`: checklist item proving lesson completion
