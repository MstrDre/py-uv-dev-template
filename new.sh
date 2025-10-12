#!/usr/bin/env bash
set -euo pipefail

# Usage: ./new.sh <project-name> [public|private]
# Default visibility: private

NAME="${1:-}"
VISIBILITY="${2:-private}"

if [[ -z "$NAME" ]]; then
  echo "Usage: ./new.sh <project-name> [public|private]"
  exit 1
fi

if [[ "$VISIBILITY" != "public" && "$VISIBILITY" != "private" ]]; then
  echo "Visibility must be 'public' or 'private' (default 'private')."
  exit 1
fi

# --- Checks ---
command -v gh >/dev/null || { echo "❌ GitHub CLI (gh) is not installed."; exit 1; }
gh auth status >/dev/null || { echo "❌ You are not logged in to GitHub CLI. Run: gh auth login"; exit 1; }

# Ensure this template repo is connected to GitHub (so gh can read its metadata)
if ! gh repo view >/dev/null 2>&1; then
  echo "❌ This directory is not linked to a GitHub repo yet."
  echo "   Run: gh repo create <your-template-name> --source=. --remote=origin --push -y"
  exit 1
fi

TEMPLATE_NWO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
OWNER_LOGIN="$(gh repo view --json owner -q .owner.login)"

echo "🔧 Using template: $TEMPLATE_NWO"
echo "👤 Creating repo under owner: $OWNER_LOGIN"
echo "📦 New project: $NAME ($VISIBILITY)"

# Create the new repo from this template
gh repo create "$NAME" --template "$TEMPLATE_NWO" --"$VISIBILITY" -y

# Clone it locally (under the same owner)
NEW_NWO="$OWNER_LOGIN/$NAME"
gh repo clone "$NEW_NWO"

echo "✅ Created and cloned: $NEW_NWO"
echo "➡️  Opening in VS Code…"
command -v code >/dev/null && code "$NAME" || echo "ℹ️ VS Code 'code' command not found. Open the folder manually."
