#!/usr/bin/env bash
set -euo pipefail

echo "== v2 Design-Only Governance Gate =="

BASE_DIR="docs/roadmap"

# Только v2-документы
FILES=$(find "$BASE_DIR" -type f -name "V2_*.md")

if [[ -z "$FILES" ]]; then
  echo "ERROR: no V2 documents found"
  exit 1
fi

# ❌ Запрещённые action-паттерны
FORBIDDEN_REGEX="\\b(implement|implementing|implementation plan|execution plan|runtime code|build artifacts)\\b"

# ❌ Запрещённые runtime пути
FORBIDDEN_PATHS="\\b(/frontend/|/backend/)\\b"

# ✅ Разрешённые governance-формулировки
ALLOWED_REGEX="\\b(implementation[: ]+запрещена|implementation is forbidden|execution excluded|does not authorize execution|DESIGN_ONLY)\\b"

for file in $FILES; do
  MATCHES=$(grep -i -E "$FORBIDDEN_REGEX|$FORBIDDEN_PATHS" "$file" || true)

  if [[ -n "$MATCHES" ]]; then
    BAD=$(echo "$MATCHES" | grep -vi -E "$ALLOWED_REGEX" || true)
    if [[ -n "$BAD" ]]; then
      echo "ERROR: forbidden v2 implementation language detected in $file:"
      echo "$BAD"
      exit 1
    fi
  fi

  if ! grep -i -E "\\bDESIGN_ONLY\\b" "$file" >/dev/null; then
    echo "ERROR: missing DESIGN_ONLY declaration in $file"
    exit 1
  fi
done

echo "✔ v2 governance constraints satisfied (DESIGN_ONLY, no implementation)"

if [[ -f docs/control/V2_IMPLEMENTATION_APPROVAL.md ]]; then
  echo "ERROR: V2_IMPLEMENTATION_APPROVAL.md must not exist"
  exit 1
fi
