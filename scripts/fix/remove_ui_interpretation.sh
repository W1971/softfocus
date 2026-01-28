#!/usr/bin/env bash
set -euo pipefail

TARGET="frontend/adapters/recovery/recoveryResultAdapters.ts"

if [ ! -f "$TARGET" ]; then
  echo "[ERROR] File not found: $TARGET"
  exit 1
fi

# Remove interpretive / advisory string completely
sed -i.bak \
  '/Полезен системный контур восстановления/d' \
  "$TARGET"

echo "[OK] Interpretive UI language removed from $TARGET"
