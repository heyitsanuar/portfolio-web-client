---
name: portfolio-ui
description: >
  Design and UI implementation guidelines for the Anuar Jimenez portfolio.
  Use when creating, modifying, or reviewing visual components, layouts,
  responsive behavior, spacing, typography, cards, sections, navigation,
  projects, skills, experience, terminal UI, or other frontend presentation.
---

# Portfolio UI

Use this skill whenever implementing or reviewing UI for this portfolio.

The goal is to preserve the approved visual language across the entire site
without overengineering the implementation.

## Visual Direction

The portfolio should feel:

- Modern
- Minimal
- Developer-oriented
- Technical without looking gimmicky
- Spacious
- Polished
- Intentional

Avoid making the site feel like a résumé, dashboard, admin panel, or generic
developer template.

## Color Direction

Primary theme:

- Dark navy / near-black background
- Slightly elevated dark surfaces
- Purple primary accent
- Blue may complement purple
- Green / teal should be used sparingly, especially for terminal details
- Primary text should have strong contrast
- Secondary text should remain clearly readable

Prefer subtle borders and restrained highlights.

Avoid:

- Excessive gradients
- Excessive glow
- Large neon effects
- Heavy shadows
- Too many competing accent colors

## Global Layout

All major sections must use the same global content container.

The following must align horizontally:

- Hero
- Projects
- About / Skills
- Experience
- Contact

Do not create independent horizontal margins for individual sections.

Preserve generous horizontal padding at smaller viewport widths.

## Vertical Rhythm

Generous vertical whitespace is a core part of the design.

Major sections should have enough separation to feel like distinct chapters.

Avoid compressing sections simply to reduce page height.

Prefer:

content
↓
breathing room
↓
next section

over:

content
next section
content
next section

The portfolio should never feel like a dense résumé.

## Information Architecture

The approved page order is:

1. Hero
2. Projects
3. About + Skills
4. Experience
5. Contact

Do not reorder these sections without an explicit requirement.

## Section Headings

Use numbered editorial-style headings:

- `01. PROJECTS`
- `02. ABOUT ME`
- `03. SKILLS`
- `04. EXPERIENCE`
- `05. LET'S TALK`

Section headings may use subtle decorative horizontal lines.

Decorative elements should support hierarchy rather than compete with content.

## Hero

Desktop layout:

- Two columns
- Introduction on the left
- Terminal on the right

Content hierarchy:

SOFTWARE ENGINEER

Anuar Jimenez

Building modern web experiences.

Description

Primary / secondary actions

Location / availability metadata

The name is the primary H1.

`Building modern web experiences.` is a subtitle, not the main heading.

The Hero must align with the same global container used by the rest of the page.

Avoid making the Hero visually wider or offset compared with other sections.

## Projects

Projects appear immediately after Hero.

Projects are intentionally prominent because showing work should happen before
résumé-style information.

Desktop:

- Grid-based presentation
- Large visual previews
- Clear project title
- Concise description
- Technology tags
- Demo/repository actions where available

Mobile:

- Horizontal carousel
- Native swipe
- Prefer CSS Scroll Snap
- Show one complete card and a small preview of the next
- Provide discrete previous/next controls
- Provide current position such as `01 / 04`

Avoid introducing a large carousel library when native browser functionality is
sufficient.

## About + Skills

On desktop, About and Skills share the same horizontal section.

Approximate visual balance:

- About: 40%
- Skills: 60%

This ratio is guidance rather than a rigid mathematical requirement.

On mobile:

- About appears first
- Skills appears below it
- Both use the full available width

## About

Primary headline:

`Engineer by profession. Builder by curiosity.`

Working traits should not be represented as generic pill tags.

Use four lightweight feature items/cards:

### Continuous Learning

Always exploring new technologies and better ways to build.

### Team Collaboration

I enjoy working with others to turn ideas into real impact.

### Problem Solving

I like tackling complex challenges and finding practical solutions.

### Product Mindset

Focused on building useful, user-centered experiences.

These items should remain visually lightweight.

Avoid turning them into large dashboard cards.

## Skills

Technology skills should be easy to scan.

Prefer:

icon + technology name

Categories:

- All
- Frontend
- Backend
- Cloud & DevOps
- AI & Agents
- Testing
- Others

Never represent skill proficiency using:

- Percentages
- Progress bars
- Stars
- Beginner / Intermediate / Advanced
- Expert labels
- Numeric ratings

The portfolio communicates experience through actual work and professional
history rather than arbitrary proficiency scores.

## AI & Agents

AI-assisted engineering should be visually visible rather than hidden inside
an `Others` category.

Relevant tools may include:

- Claude Code
- ChatGPT
- GitHub Copilot
- Cursor
- MCP

Relevant capabilities may include:

- Prompt Engineering
- Agentic Workflows
- AI-assisted Development

Use a slightly stronger purple treatment for this area while keeping it
consistent with the overall design.

Avoid making AI appear to be Anuar's primary professional identity.

The positioning remains:

Software Engineer first.

Frontend as a major strength.

AI-assisted and agentic engineering as a modern capability.

## Experience

Use an open vertical timeline.

Do not wrap every employment entry inside a large bordered card.

Each entry should contain:

Role — Company

Date

Key points

Technology tags

Technology tags appear below the key points.

Maintain generous vertical spacing between employment entries.

The timeline should feel easy to scan despite containing substantial
information.

Oracle technology tags include:

- JavaScript
- TypeScript
- Knockout.js
- Java
- Selenium
- Jenkins
- Gradle

Do not invent employment dates, achievements, technologies, or other personal
information.

Use verified project/resume data.

## Contact

Contact is the final major section.

Headline:

`Have an idea in mind or a problem worth solving?`

The section should feel like a natural conclusion rather than another résumé
block.

Keep the CTA prominent but consistent with the restrained design language.

Footer phrase:

`> Build. Learn. Share. Repeat.`

## Terminal

The terminal is the strongest developer-specific visual element.

It should feel intentional rather than decorative gimmickry.

Use terminal-style typography and restrained green / teal accents.

Typing animations should:

- Feel natural
- Use short pauses
- Avoid excessive duration
- Start when the terminal becomes visible
- Respect `prefers-reduced-motion`

Interactive terminal behavior should remain keyboard accessible.

## Components

Prefer reusable components when repetition actually exists.

Do not create abstractions solely because they might theoretically be useful
later.

Good candidates for reusable UI include:

- Section heading
- Technology tag
- Technology icon
- Project card
- Experience entry
- Button / link variants

Do not create a generic design-system component for every HTML element.

## Borders and Cards

Prefer:

- Thin subtle borders
- Small changes in surface elevation
- Moderate border radius
- Restrained hover effects

Avoid:

- Heavy shadows
- Excessively rounded components
- Glassmorphism everywhere
- Every piece of content becoming a card

Cards should communicate grouping, not merely decorate content.

## Motion

Motion should be quiet, responsive, and deliberate.

Recommended behavior:

- Small vertical reveals around 10–15px
- Section reveal animations
- Timeline drawing
- Subtle project hover elevation
- Border/accent transitions
- Project image scale around 1.02

Typical duration:

200–600ms

Avoid:

- Large translations
- Bouncing
- Constant animation
- Rotating UI elements
- Excessive parallax

Always respect `prefers-reduced-motion`.

## Responsive Design

Mobile must be purpose-designed.

Do not simply shrink the desktop layout.

Primary reference viewport:

393 × 852 CSS px

Also review:

- 375px
- 768px
- 1024px
- 1440px

Mobile priorities:

- Clear hierarchy
- Comfortable horizontal padding
- Generous vertical spacing
- Minimum 44 × 44px touch targets where applicable
- No horizontal body overflow
- Readable technology tags
- Usable terminal
- Swipeable Projects
- About and Skills stacked vertically

## Accessibility

Visual implementation must preserve:

- Semantic HTML
- Logical heading hierarchy
- Keyboard navigation
- Visible focus indicators
- Appropriate contrast
- Accessible interactive controls
- Reduced motion support

Never remove focus outlines without providing an accessible replacement.

## Review Checklist

When asked to review UI, inspect:

### Layout
- Are all sections aligned to the global container?
- Is horizontal padding consistent?
- Is vertical spacing generous enough?
- Does the page feel too dense?

### Hierarchy
- Is the H1 clearly dominant?
- Are section headings consistent?
- Are Projects appropriately prominent?
- Does Experience remain scannable?

### Components
- Are cards used only where grouping is useful?
- Are borders and effects restrained?
- Are repeated patterns consistent?

### Responsive
- Does 393px feel intentionally designed?
- Is there horizontal overflow?
- Are touch targets appropriate?
- Does content stack naturally?

### Accessibility
- Is keyboard interaction preserved?
- Are focus states visible?
- Is contrast sufficient?
- Is reduced motion supported?

### Design Integrity
- Does the implementation still resemble the approved visual direction?
- Has unnecessary visual complexity been introduced?
- Does it look like a portfolio rather than a résumé or dashboard?

## Implementation Principle

When multiple implementations satisfy the visual requirement, prefer the
simplest maintainable solution.

Do not add dependencies merely to reproduce a small visual effect.