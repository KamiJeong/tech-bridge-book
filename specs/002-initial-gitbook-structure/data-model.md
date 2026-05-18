# Data Model: Initial GitBook Documentation Structure

## Entity: Language Section

- **Fields**: language code, display name, landing page, guide pages, template pages, chapter index
- **Validation rules**: Must exist for `ko`, `en`, and `ja`; matching page purposes must use matching file names.
- **Relationships**: Owns guide pages, templates, glossary, and chapter index.

## Entity: Guide Page

- **Fields**: title, purpose, learner/editor audience, body sections, next link
- **Validation rules**: Must be GitBook-friendly Markdown and avoid full lesson content for this feature.
- **Relationships**: Belongs to one language section and appears in `SUMMARY.md`.

## Entity: Template Page

- **Fields**: template type, required sections, placeholder guidance, completion evidence
- **Validation rules**: Lesson template must include all constitution-required lesson sections.
- **Relationships**: Belongs to one language section and supports future lesson pages.

## Entity: Glossary Entry Format

- **Fields**: term, plain-language meaning, practical example, related terms, translation note
- **Validation rules**: Must support Korean, English, and Japanese terminology consistency.
- **Relationships**: Used by glossary pages in every language.

## Entity: Chapter Stage

- **Fields**: stage number, stage name, learner outcome, example topics
- **Validation rules**: Must follow the progressive learning path from digital literacy to real-world application patterns.
- **Relationships**: Listed in each language chapter index.
