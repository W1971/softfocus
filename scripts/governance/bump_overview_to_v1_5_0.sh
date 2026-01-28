#!/usr/bin/env bash
set -euo pipefail

TARGET="docs/overview.md"

if [ ! -f "$TARGET" ]; then
  echo "[ERROR] File not found: $TARGET"
  exit 1
fi

# Replace **Version:** v1.4 -> **Version:** v1.5.0
# (strict match to avoid accidental replacements)
sed -i.bak \
  's/^\*\*Version:\*\* v1\.4/\*\*Version:\*\* v1.5.0/' \
  "$TARGET"

rm -f "$TARGET.bak"

echo "[OK] docs/overview.md bumped to v1.5.0"
