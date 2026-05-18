# Claude Prompt Pattern Library

Each pattern includes when to use it, a reusable template, expected output, and a common mistake. Replace bracketed text before using a prompt.

## 1. Plain-language explainer

- **When to use**: Use when a concept is unfamiliar.
- **Prompt template**: `Explain [concept] in plain language for [learner type]. Use one everyday analogy and list 3 practical examples.`
- **Expected output**: A short explanation, analogy, and examples.
- **Common mistake**: Asking for an expert explanation without audience context.

## 2. Document summarizer

- **When to use**: Use for long documents or meeting notes.
- **Prompt template**: `Summarize this document for [purpose]. Include key points, decisions, action items, risks, and open questions.`
- **Expected output**: A structured summary with actions and risks.
- **Common mistake**: Requesting only a short summary when decisions are needed.

## 3. Option comparator

- **When to use**: Use when choosing between alternatives.
- **Prompt template**: `Compare [option A], [option B], and [option C] for [situation]. Use criteria: cost, effort, risk, speed, and fit.`
- **Expected output**: A comparison table plus recommendation caveats.
- **Common mistake**: Leaving out the decision criteria.

## 4. Work plan generator

- **When to use**: Use when turning a goal into steps.
- **Prompt template**: `Create a work plan for [goal]. Include milestones, tasks, owners, dependencies, risks, and a first-week checklist.`
- **Expected output**: A practical plan with sequence and risk notes.
- **Common mistake**: Accepting a generic plan without owners or constraints.

## 5. Draft improver

- **When to use**: Use to improve tone and clarity.
- **Prompt template**: `Improve this draft for [audience] and [tone]. Keep the meaning, make it clearer, and explain the main changes.`
- **Expected output**: A revised draft and change notes.
- **Common mistake**: Letting Claude change facts or commitments accidentally.

## 6. Clarifying-question requester

- **When to use**: Use before complex work.
- **Prompt template**: `Before answering, ask up to 5 clarifying questions that would materially improve the result.`
- **Expected output**: Focused questions that reduce ambiguity.
- **Common mistake**: Letting Claude proceed with missing context.

## 7. Multi-alternative generator

- **When to use**: Use for brainstorming.
- **Prompt template**: `Give me 5 different approaches to [problem]. For each, list when it works, risks, and the first step.`
- **Expected output**: Multiple usable options, not one answer.
- **Common mistake**: Asking for many ideas without evaluation.

## 8. Answer critic

- **When to use**: Use to review an output.
- **Prompt template**: `Critique this answer. Find unclear claims, unsupported assumptions, missing context, and possible improvements.`
- **Expected output**: A review list and revision suggestions.
- **Common mistake**: Treating critique as proof of correctness.

## 9. Risk identifier

- **When to use**: Use before sharing or deciding.
- **Prompt template**: `Identify risks in this plan/output. Cover accuracy, privacy, stakeholder impact, timing, and verification needs.`
- **Expected output**: Risk categories with mitigation ideas.
- **Common mistake**: Only asking whether something is good.

## 10. Checklist creator

- **When to use**: Use for repeatable work.
- **Prompt template**: `Create a checklist for [task]. Separate preparation, execution, review, and follow-up.`
- **Expected output**: A staged checklist.
- **Common mistake**: Making a checklist too broad to use.

## 11. Messy-notes-to-structure converter

- **When to use**: Use for rough notes.
- **Prompt template**: `Turn these messy notes into a structured brief with summary, categories, decisions, actions, and questions.`
- **Expected output**: Organized output from unstructured input.
- **Common mistake**: Pasting sensitive raw notes without redaction.

## 12. Technical concept translator

- **When to use**: Use for non-developer understanding.
- **Prompt template**: `Explain this technical topic to a non-developer. Include what it means, why it matters, and what to ask a developer.`
- **Expected output**: Plain-language technical guidance.
- **Common mistake**: Oversimplifying so much that tradeoffs disappear.

## 13. Developer requirements preparer

- **When to use**: Use before asking developers for work.
- **Prompt template**: `Turn this business need into developer-ready requirements with user story, acceptance criteria, edge cases, and open questions.`
- **Expected output**: A clearer feature brief.
- **Common mistake**: Letting Claude invent constraints without confirming them.
