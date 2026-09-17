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

gh auth status >/dev/null || {
  echo "Run: gh auth login"
  exit 1
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MANIFEST="$ROOT/issues.json"

get_label_color() {
  case "$1" in
    foundation)      echo "5319E7" ;;
    devops)          echo "0E8A16" ;;
    priority:high)   echo "B60205" ;;
    design-system)   echo "7057FF" ;;
    ui)              echo "A2EEEF" ;;
    layout)          echo "D4C5F9" ;;
    responsive)      echo "1D76DB" ;;
    navigation)      echo "C5DEF5" ;;
    mobile)          echo "006B75" ;;
    hero)            echo "BFDADC" ;;
    projects)        echo "FBCA04" ;;
    content)         echo "0075CA" ;;
    interaction)     echo "D876E3" ;;
    about)            echo "C2E0C6" ;;
    skills)           echo "BFD4F2" ;;
    ai)               echo "8B5CF6" ;;
    experience)       echo "F9D0C4" ;;
    contact)          echo "FEF2C0" ;;
    terminal)         echo "0E8A16" ;;
    animation)        echo "D93F0B" ;;
    fun)              echo "FAD8C7" ;;
    polish)           echo "E99695" ;;
    accessibility)    echo "0052CC" ;;
    quality)          echo "0366D6" ;;
    performance)      echo "006B75" ;;
    seo)              echo "C5DEF5" ;;
    release)          echo "1D76DB" ;;
    github-pages)     echo "24292F" ;;
    qa)               echo "B60205" ;;
    *)                 echo "6E7781" ;;
  esac
}

echo "Creating/updating labels..."

jq -r '.[].labels[]' "$MANIFEST" | sort -u | while read -r label; do
  color="$(get_label_color "$label")"
  echo "  → $label"
  gh label create "$label" --color "$color" --force >/dev/null
done

echo "Creating milestones..."

for milestone in \
  "M1 — Foundation" \
  "M2 — Core UI" \
  "M3 — Interactions" \
  "M4 — Polish & Quality" \
  "M5 — Release"
do
  existing="$(
    gh api "repos/{owner}/{repo}/milestones?state=all&per_page=100" \
      --jq ".[] | select(.title == \"$milestone\") | .number" |
      head -n1 || true
  )"

  if [[ -z "$existing" ]]; then
    echo "  → Creating $milestone"

    gh api \
      --method POST \
      "repos/{owner}/{repo}/milestones" \
      -f title="$milestone" >/dev/null
  else
    echo "  ↷ Already exists: $milestone"
  fi
done

echo "Creating issues..."

jq -c '.[]' "$MANIFEST" | while read -r item; do
  id="$(echo "$item" | jq -r '.id')"
  title="$(echo "$item" | jq -r '.title')"
  milestone="$(echo "$item" | jq -r '.milestone')"
  bodyfile="$ROOT/$(echo "$item" | jq -r '.file')"

  full_title="$id — $title"

  existing="$(
    gh issue list \
      --state all \
      --limit 200 \
      --search "\"$full_title\" in:title" \
      --json title,number \
      --jq ".[] | select(.title == \"$full_title\") | .number" |
      head -n1 || true
  )"

  if [[ -n "$existing" ]]; then
    echo "  ↷ #$existing already exists: $full_title"
    continue
  fi

  echo "  → Creating $full_title"

  gh issue create \
    --title "$full_title" \
    --body-file "$bodyfile" \
    --milestone "$milestone" \
    $(echo "$item" | jq -r '.labels[] | "--label \"" + . + "\""' | xargs) >/dev/null

  echo "  ✓ $full_title"
done

echo ""
echo "✓ Issues are ready."