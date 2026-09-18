# Anuar Jimenez — Portfolio

Minimal static Astro foundation with strict TypeScript and Tailwind CSS 4.

## Setup

Use Node.js 24.19.0 (pinned in `.nvmrc`) and npm 9.6.5 or newer.
Astro requires Node.js 22.12.0 or newer on a supported even-numbered release.
If you use nvm:

```sh
nvm install
nvm use
```

Install the locked dependencies and start the development server:

```sh
npm ci
npm run dev
```

Open the local URL printed by Astro.

## Commands

| Command | Purpose |
| --- | --- |
| `npm run dev` | Start the development server |
| `npm run check` | Check Astro and TypeScript files |
| `npm run build` | Build the static site into `dist/` |
| `npm run preview` | Serve the production build locally |

Run both `npm run check` and `npm run build` before submitting changes.
The build command does not perform type checking. There is no automated test
suite yet; the foundation is verified with type checks, a build, and browser
smoke checks.

## Source structure

- `src/components/` — reusable components (initially empty)
- `src/data/` — portfolio content (initially empty)
- `src/layouts/` — shared document layouts
- `src/pages/` — Astro routes
- `src/styles/` — global CSS and Tailwind entry point

Project requirements and user stories live in `AGENTS.md` and `github-setup/`.
The homepage is a placeholder. Portfolio sections and GitHub Pages deployment
will be implemented in their respective user stories.

## Design tokens

`src/styles/global.css` is the single source for portfolio tokens. Tailwind's
`@theme` exposes semantic utilities such as `bg-page`, `bg-surface`,
`bg-surface-elevated`, `border-border-subtle`, `text-primary`, `text-secondary`,
`text-accent`, and `text-terminal`. Use `text-on-accent` on filled purple
backgrounds. Teal is reserved for terminal details; subtle borders are decorative
and are not sufficient by themselves to identify interactive controls.

Typography uses `text-small`, `text-body`, `text-lead`, `text-section`, and
`text-display`, with matching line heights. Use the inherited system `font-sans`
and `font-mono` stacks, normal/semibold weights, and `tracking-label` for editorial
labels. Rounded groups can use `rounded-small` (6px) or `rounded-medium` (12px).
No web fonts, animations, or client-side theme scripts are required.

Local spacing uses Tailwind's existing 4px unit: prefer 8, 12, 16, 24, 32, and
48px steps (`gap-2`, `gap-3`, `gap-4`, `gap-6`, `gap-8`, `gap-12`). Breakpoints
reuse Tailwind's `sm` 40rem, `md` 48rem, `lg` 64rem, and `xl` 80rem defaults;
CSS media queries reference those tokens rather than repeat their values.

| Layout token | Mobile | From md | From lg |
| --- | --- | --- | --- |
| `--page-gutter` | 1.5rem / 24px | 2rem / 32px | 2.5rem / 40px |
| `--section-gap` | 5rem / 80px | 7rem / 112px | 8rem / 128px |

These section gaps are **initial tuning values**, not final visual decisions.
Use `.section-stack` on a parent of major sections to apply the gap once between
children; children should not add outer block margins or duplicate this spacing.
Internal component spacing remains separate. The layout uses the rhythm
token as outer page padding; it does not yet contain portfolio sections.

`--content-max-width: 72rem` is also an **initial tuning value**. The shared
`.content-container` consumes it directly; adjust this token when validating the
wide desktop design with a two-column Hero, project grid, and roughly 40/60
About + Skills layout. Its width is the smaller of the maximum width and the
available width minus two gutters, centered with automatic inline margins.

## Application shell and container

`Layout.astro` owns the single `<main>` landmark, outer vertical padding, and
one `.content-container.section-stack` wrapper around its slot. Pages supply
content groups; they must not add another `<main>`, repeat the container, or
apply page gutters. The existing heading and paragraph are grouped in one div
so the section gap does not separate them.

Future major sections will be sibling groups inside this shared wrapper. Each
group inherits the same available width and owns only its internal layout.
Do not add independent page margins, duplicate gutters, or outer block margins
to these groups. The shared stack applies the section gap once between them.
The reusable `.content-container` class contains only horizontal sizing rules;
it does not impose columns, typography, or vertical spacing.

At a 16px root font size, expected geometry is:

| Viewport | Content width | Outer space per side |
| --- | --- | --- |
| 375px | 327px | 24px |
| 393px | 345px | 24px |
| 768px | 704px | 32px |
| 1024px | 944px | 40px |
| 1440px | 1152px | 144px |

Gutters are minimum outer space, not extra padding inside the container. Once
the maximum content width is reached, centering increases the outer space.
The width, gutters, and section rhythm remain defined only in the design tokens.

Base styles set the dark page theme and a purple `:focus-visible` outline (2px
wide, 4px offset). Preserve this indicator when introducing interactive elements,
and validate it against their actual surfaces. Future motion must respect
`prefers-reduced-motion`; this foundation introduces none.

## Navigation

`Navigation.astro` renders a normal-flow horizontal top toolbar from the single
ordered list in `src/data/navigation.ts`. Below the inherited `lg` breakpoint,
JavaScript enhances the wrapping link list into a compact Menu button and native
modal dialog. Without JavaScript, the ordinary links remain visible. Both the
header and dialog content reuse `.content-container`; the main shell is unchanged.

Anchor contracts are `#home`, `#projects`, `#about`, `#skills`, `#experience`, and
`#contact`. Only Home currently exists. All entries remain normal links; missing
section targets intentionally have no scrolling destination until their stories
are implemented. No placeholder targets or availability flags are used.

The mobile dialog supports Close and Escape, confines modal focus, locks page
scrolling, and restores it on dismissal. Selecting an existing destination moves
focus there; otherwise focus returns to Menu. Resizing to desktop closes the
modal and returns focus to the visible name link. Current-link styling follows
valid URL fragments, not scrolling. Smooth scrolling is disabled for reduced
motion. There are no sticky headers, scroll spies, or menu animations.

## Hero

`Hero.astro` is the first content group inside the shared application container.
It uses one column through tablet widths and a locally tunable two-column grid
from `lg`: introduction on the left and a static terminal frame on the right.
The primary Projects CTA is shown at every width; the secondary Contact CTA is
desktop-only. Both retain their stable fragment targets before those sections
are implemented.

The terminal frame is decorative and noninteractive. Its shell establishes the
Hero composition without adding terminal identity, introduction output, typing
animation, commands, timers, observers, or client-side code. Those concerns
remain reserved for US-013, US-014, and US-015.

## Projects

`Projects.astro` follows the Hero as the `#projects` navigation target and uses
the application shell's existing container and section rhythm. Project records
live in `src/data/projects.ts`, and `ProjectCard.astro` renders the repeated card
structure. The initial four records are explicitly marked mock content and do
not include demo or repository URLs; replace them with verified project data.

Below `md`, the project list becomes a native horizontal carousel with CSS Scroll
Snap, one complete card plus a preview of the next, non-looping controls, and a
position indicator. Swipe and native scrolling work without JavaScript. A small
vanilla TypeScript enhancement synchronizes the controls and indicator, supports
Left/Right keys while the track is focused, and switches programmatic scrolling
to immediate movement when reduced motion is requested.

From `md`, the same list and `ProjectCard` instances return to the two-column
grid. No cards or project data are duplicated, and no carousel dependency or
framework hydration is used.
