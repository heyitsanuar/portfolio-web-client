# AGENTS.md

## Project

Personal portfolio for Anuar Jimenez.

The goal is to build a polished, performant, accessible personal
portfolio based on the approved desktop and mobile designs.

## Stack

- Astro
- TypeScript (strict)
- Tailwind CSS
- Motion only when useful
- GitHub Pages
- GitHub Actions

Prefer Astro and vanilla TypeScript.

Do not introduce React or another UI framework unless an interaction
clearly benefits from it and the reason is documented.

## Engineering Principles

- Prefer the simplest correct solution.
- Avoid unnecessary dependencies.
- Avoid premature abstractions.
- Reuse existing components and patterns.
- Keep components focused and reasonably small.
- Keep content/data separate from presentation when practical.
- Use client-side JavaScript only when interaction requires it.
- Do not modify unrelated functionality while implementing an issue.
- Do not invent personal, employment, project, or contact information.

## Design Principles

- Dark mode is the primary visual theme.
- Use a dark navy background.
- Purple is the primary accent.
- Green/teal may be used for terminal-related details.
- Prefer subtle borders over heavy shadows.
- Avoid excessive gradients, glow, and visual effects.
- Maintain generous vertical whitespace between major sections.
- All major sections must align to the same global content container.
- Do not use skill percentages, progress bars, stars, or proficiency ratings.
- Technology skills should use icon + label presentation.

## Page Structure

The intended information hierarchy is:

1. Hero
2. Projects
3. About + Skills
4. Experience
5. Contact

On desktop, About and Skills share horizontal space.

On mobile, they stack vertically.

## Responsive Design

Mobile must feel intentionally designed rather than like compressed desktop.

Primary mobile reference:

- 393px width

Also verify:

- 375px
- 768px
- 1024px
- 1440px

Requirements:

- No horizontal page overflow.
- Touch targets should be at least 44x44px where applicable.
- Preserve generous spacing on mobile.

## Accessibility

- Prefer semantic HTML.
- Maintain logical heading hierarchy.
- All interactive elements must be keyboard accessible.
- Provide visible focus states.
- Decorative icons should not be announced.
- Respect `prefers-reduced-motion`.

## Performance

Prefer Astro static rendering.

Avoid hydrating components that do not require client-side behavior.

Target Lighthouse scores:

- Performance >= 95
- Accessibility >= 95
- Best Practices >= 95
- SEO >= 95

## Workflow

Before implementing an issue:

1. Read this file.
2. Read the complete issue.
3. Inspect the relevant existing code.
4. Propose an implementation plan.
5. Do not implement until the plan has been reviewed.

During implementation:

1. Stay within the issue scope.
2. Follow existing architecture and patterns.
3. Avoid unnecessary dependencies.
4. Keep changes focused.

Before considering an issue complete:

1. Review the implementation against the acceptance criteria.
2. Run TypeScript/type checking.
3. Run relevant tests.
4. Run the production build.
5. Check for console errors.
6. Consider desktop and mobile regressions.
7. Consider accessibility.
8. Report changed files.
9. Report tests/checks performed.
10. Report assumptions or remaining limitations.