#!/usr/bin/env bash
set -euo pipefail

# Install git hooks for the design-skills repo.
# Run once after cloning.

cd "$(git rev-parse --show-toplevel)"

cat > .git/hooks/pre-commit << 'HOOK'
#!/usr/bin/env bash
set -euo pipefail

# Auto-sync source/skills/ to .claude/skills/ and .cursor/skills/ before every commit.
bash scripts/build.sh

# Stage the synced files so they're included in the commit.
git add .claude/skills/ .cursor/skills/
HOOK

chmod +x .git/hooks/pre-commit
echo "Installed pre-commit hook. source/skills/ will auto-sync on every commit."
