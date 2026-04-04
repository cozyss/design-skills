#!/usr/bin/env bash
set -euo pipefail

# Copy skills from source/ to .claude/skills/ and .cursor/skills/
# Source is the single source of truth. Run this after editing any skill.

cd "$(git rev-parse --show-toplevel)"

TARGETS=(.claude/skills .cursor/skills)

for target in "${TARGETS[@]}"; do
  rm -rf "$target"/*
  cp -r source/skills/* "$target"/
done

echo "Synced $(ls source/skills | wc -l | tr -d ' ') skills to .claude/skills/ and .cursor/skills/"
