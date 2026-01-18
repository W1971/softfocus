#!/usr/bin/env bash
set -euo pipefail

# SoftFocus — User Content Guard
# Blocks advisory / imperative language in user-facing content

ROOT_DIR="$(git rev-parse --show-toplevel)"
USER_DIR="$ROOT_DIR/docs/user"

FORBIDDEN_PATTERNS=(
  "вы должны"
  "рекомендуется"
  "следует"
  "вам нужно"
  "необходимо сделать"
)

FAIL=0

echo "[GUARD] Checking user content for forbidden language"

for file in $(find "$USER_DIR" -type f -name '*_RU.md'); do
  for pattern in "${FORBIDDEN_PATTERNS[@]}"; do
    if grep -qi "$pattern" "$file"; then
      echo "[FAIL] Forbidden phrase '$pattern' found in $file"
      FAIL=1
    fi
  done
done

if [[ "$FAIL" -ne 0 ]]; then
  echo "[BLOCKED] User content guard FAILED"
  exit 1
fi

echo "[PASS] User content guard PASSED"

