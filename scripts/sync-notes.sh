#!/usr/bin/env bash
# Copy publishable notes from the GATE notes repo into content/.
# Usage: scripts/sync-notes.sh [path-to-notes]   (default: ../GATE)
set -euo pipefail

SRC="${1:-../GATE}"
DEST="$(cd "$(dirname "$0")/.." && pwd)/content"

rsync -a --delete \
  --exclude 'index.md' \
  --exclude '.git' --exclude '.github' --exclude '.gitignore' \
  --exclude '.obsidian' --exclude '.trash' \
  --exclude 'Source' --exclude '*.zip' --exclude '*.pdf' \
  "$SRC"/ "$DEST"/

echo "Synced $(find "$DEST" -name '*.md' | wc -l) notes from $SRC"
