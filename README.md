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
The homepage is a placeholder. Design tokens, portfolio sections, and GitHub
Pages deployment will be implemented in their respective user stories.
