#!/usr/bin/env bash
set -euo pipefail

FORBIDDEN_WORDS=(
  "next step"
  "get started"
  "improve"
  "optimize"
  "do this"
  "you should"
  "рекомендуем"
  "следующий шаг"
  "начните"
  "улучшить"
)

FILES=$(grep -RIl "mobile" mobile || true)

for word in "${FORBIDDEN_WORDS[@]}"; do
  if echo "$FILES" | xargs grep -i "$word" >/dev/null 2>&1; then
    echo "❌ MOBILE FAIL: forbidden copy detected ('$word')"
    exit 1
  fi
done

echo "✅ MOBILE copy OK"
