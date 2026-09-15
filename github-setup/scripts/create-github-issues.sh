#!/usr/bin/env bash
set -euo pipefail

if ! command -v gh >/dev/null 2>&1; then
  echo "Error: GitHub CLI (gh) is required: https://cli.github.com/"
  exit 1
fi
if ! command -v jq >/dev/null 2>&1; then
  echo "Error: jq is required."
  exit 1
fi

gh auth status >/dev/null || { echo "Run: gh auth login"; exit 1; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MANIFEST="$ROOT/issues.json"

# Safe to rerun for labels/milestones; issue creation itself is guarded by title.
declare -A COLORS=(
  ["foundation"]="5319E7" ["devops"]="0E8A16" ["priority:high"]="B60205"
  ["design-system"]="7057FF" ["ui"]="A2EEEF" ["layout"]="D4C5F9"
  ["responsive"]="1D76DB" ["navigation"]="C5DEF5" ["mobile"]="006B75"
  ["hero"]="BFDADC" ["projects"]="FBCA04" ["content"]="0075CA"
  ["interaction"]="D876E3" ["about"]="C2E0C6" ["skills"]="BFD4F2"
  ["ai"]="8B5CF6" ["experience"]="F9D0C4" ["contact"]="FEF2C0"
  ["terminal"]="0E8A16" ["animation"]="D93F0B" ["fun"]="FAD8C7"
  ["polish"]="E99695" ["accessibility"]="0052CC" ["quality"]="0366D6"
  ["performance"]="006B75" ["seo"]="C5DEF5" ["release"]="1D76DB"
  ["github-pages"]="24292F" ["qa"]="B60205"
)

echo "Creating/updating labels..."
jq -r '.[].labels[]' "$MANIFEST" | sort -u | while read -r label; do
  color="${COLORS[$label]:-6E7781}"
  gh label create "$label" --color "$color" --force >/dev/null
done

echo "Creating milestones..."
for milestone in "M1 — Foundation" "M2 — Core UI" "M3 — Interactions" "M4 — Polish & Quality" "M5 — Release"; do
  existing="$(gh api "repos/{owner}/{repo}/milestones?state=all&per_page=100" --jq ".[] | select(.title == \"$milestone\") | .number" | head -n1 || true)"
  if [[ -z "$existing" ]]; then
    gh api --method POST "repos/{owner}/{repo}/milestones" -f title="$milestone" >/dev/null
  fi
done

echo "Creating issues..."
jq -c '.[]' "$MANIFEST" | while read -r item; do
  id="$(jq -r '.id' <<<"$item")"
  title="$(jq -r '.title' <<<"$item")"
  milestone="$(jq -r '.milestone' <<<"$item")"
  bodyfile="$ROOT/$(jq -r '.file' <<<"$item")"
  full_title="$id — $title"

  existing="$(gh issue list --state all --limit 200 --search "\"$full_title\" in:title" --json title,number \
    --jq ".[] | select(.title == \"$full_title\") | .number" | head -n1 || true)"
  if [[ -n "$existing" ]]; then
    echo "↷ #$existing already exists: $full_title"
    continue
  fi

  args=(issue create --title "$full_title" --body-file "$bodyfile" --milestone "$milestone")
  while read -r label; do
    args+=(--label "$label")
  done < <(jq -r '.labels[]' <<<"$item")

  url="$(gh "${args[@]}")"
  echo "✓ $url"
done

cat <<'EOF'

Issues are ready.

Optional GitHub Project setup:
1. Create a Project in GitHub with: Backlog, Ready, In Progress, In Review, Done.
2. Configure an Auto-add workflow for issues from this repository.
3. Keep only 2–3 issues in Ready and 1 in In Progress.

This script intentionally does not create/configure a Project because Projects can be
user- or organization-owned and require additional project permissions/context.
EOF
