#!/usr/bin/env bash
set -euo pipefail

# Sync skills from pbakaus/impeccable into .claude/skills/ and .cursor/skills/
# Only touches skills that came from impeccable — never overwrites local originals.

REPO="pbakaus/impeccable"
SOURCE_PATH="source/skills"
TARGETS=(.claude/skills .cursor/skills)

# Skills that came from impeccable. Add new ones here if the upstream repo adds them.
UPSTREAM_SKILLS=(
  adapt
  animate
  arrange
  audit
  bolder
  clarify
  colorize
  critique
  delight
  distill
  extract
  frontend-design
  harden
  normalize
  onboard
  optimize
  overdrive
  polish
  quieter
  teach-impeccable
  typeset
)

cd "$(git rev-parse --show-toplevel)"

echo "Syncing ${#UPSTREAM_SKILLS[@]} skills from $REPO..."

for skill in "${UPSTREAM_SKILLS[@]}"; do
  echo "  $skill"

  # Get list of files in this skill directory (recursive)
  files=$(gh api "repos/$REPO/contents/$SOURCE_PATH/$skill" --jq '.[].name' 2>/dev/null || true)

  if [[ -z "$files" ]]; then
    echo "    ⚠ not found upstream, skipping"
    continue
  fi

  for target in "${TARGETS[@]}"; do
    mkdir -p "$target/$skill"
  done

  for file in $files; do
    if [[ "$file" == "reference" ]]; then
      # Handle reference subdirectory
      ref_files=$(gh api "repos/$REPO/contents/$SOURCE_PATH/$skill/reference" --jq '.[].name' 2>/dev/null || true)
      for target in "${TARGETS[@]}"; do
        mkdir -p "$target/$skill/reference"
      done
      for ref_file in $ref_files; do
        content=$(gh api "repos/$REPO/contents/$SOURCE_PATH/$skill/reference/$ref_file" --jq '.content' | base64 -d)
        for target in "${TARGETS[@]}"; do
          echo "$content" > "$target/$skill/reference/$ref_file"
        done
      done
    else
      content=$(gh api "repos/$REPO/contents/$SOURCE_PATH/$skill/$file" --jq '.content' | base64 -d)
      for target in "${TARGETS[@]}"; do
        echo "$content" > "$target/$skill/$file"
      done
    fi
  done
done

echo ""
echo "Done. Check changes with: git diff --stat"
