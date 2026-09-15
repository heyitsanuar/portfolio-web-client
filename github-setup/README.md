# Portfolio GitHub Setup

Importable GitHub backlog for the Anuar Jimenez portfolio.

## What is included

- 22 GitHub-ready User Stories in `user-stories/`
- `issues.json` manifest containing titles, milestones, labels, and source files
- `scripts/create-github-issues.sh` to create labels, milestones, and Issues
- `issue-template.md` with the shared Definition of Done and Agent Notes

## Prerequisites

Install:
- GitHub CLI (`gh`)
- `jq`

Authenticate:

```bash
gh auth login
gh auth status
```

Run the script **from a clone of the target GitHub repository** so `gh` can detect the repository:

```bash
unzip github-setup.zip
cp -R github-setup/* .
chmod +x scripts/create-github-issues.sh
./scripts/create-github-issues.sh
```

If you want to keep the specifications under `docs/`, move `user-stories/` there and update the `file` paths in `issues.json` before running the script.

## Milestones

- M1 — Foundation: US-001–003
- M2 — Core UI: US-004–012
- M3 — Interactions: US-013–015
- M4 — Polish & Quality: US-016–019
- M5 — Release: US-020–022

## Suggested GitHub Project columns

`Backlog → Ready → In Progress → In Review → Done`

Suggested WIP:
- Ready: 2–3
- In Progress: 1

Configure GitHub Projects Auto-add to automatically include Issues from the portfolio repository.

## Important content note

Employment months were intentionally **not invented**. US-011 requires verified dates before adding month-level dates to the portfolio.

## Recommended first Codex workflow

1. Put US-001 in Ready.
2. Create a feature branch.
3. Ask Codex to read `AGENTS.md` and US-001 and propose a plan **without implementing**.
4. Review the plan.
5. Ask Codex to implement the approved plan.
6. Run validation.
7. Ask for a separate code review.
8. Fix findings.
9. Review the result yourself.
10. Open a PR and merge.
