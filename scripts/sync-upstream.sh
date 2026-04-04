#!/usr/bin/env bash
set -euo pipefail

# Sync skills from pbakaus/impeccable into source/skills/
# Only touches skills that came from impeccable — never overwrites local originals.
# After syncing, runs build.sh to copy to .claude/skills/ and .cursor/skills/.

REPO="pbakaus/impeccable"
REMOTE_PATH="source/skills"
LOCAL_PATH="source/skills"

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
  files=$(gh api "repos/$REPO/contents/$REMOTE_PATH/$skill" --jq '.[].name' 2>/dev/null || true)

  if [[ -z "$files" ]]; then
    echo "    ⚠ not found upstream, skipping"
    continue
  fi

  mkdir -p "$LOCAL_PATH/$skill"

  for file in $files; do
    if [[ "$file" == "reference" ]]; then
      # Handle reference subdirectory
      ref_files=$(gh api "repos/$REPO/contents/$REMOTE_PATH/$skill/reference" --jq '.[].name' 2>/dev/null || true)
      mkdir -p "$LOCAL_PATH/$skill/reference"
      for ref_file in $ref_files; do
        content=$(gh api "repos/$REPO/contents/$REMOTE_PATH/$skill/reference/$ref_file" --jq '.content' | base64 -d)
        echo "$content" > "$LOCAL_PATH/$skill/reference/$ref_file"
      done
    else
      content=$(gh api "repos/$REPO/contents/$REMOTE_PATH/$skill/$file" --jq '.content' | base64 -d)
      echo "$content" > "$LOCAL_PATH/$skill/$file"
    fi
  done
done

echo ""
echo "Synced to source/skills/. Running build..."
bash scripts/build.sh
echo "Done. Check changes with: git diff --stat"
