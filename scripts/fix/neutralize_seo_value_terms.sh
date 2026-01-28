#!/usr/bin/env bash
set -euo pipefail

TARGET="docs/frontend/content/ru/low-recovery-efficiency.md"

if [ ! -f "$TARGET" ]; then
  echo "[ERROR] File not found: $TARGET"
  exit 1
fi

sed -i.bak \
  -e 's/Низкая восстановляемость/Снижение эффективности восстановления/g' \
  "$TARGET"

rm -f "$TARGET.bak"

echo "[OK] SEO value judgement neutralized in $TARGET"
