#!/usr/bin/env bash
set -euo pipefail

echo "[MAINTENANCE MODE] Running governance diff check..."

# -------------------------
# Configuration
# -------------------------

# Forbidden paths in Maintenance Mode
FORBIDDEN_PATHS=(
  "frontend/"
  "scripts/core/"
  "docs/product/"
)

# Allowed paths (whitelist)
WHITELIST_PATHS=(
  "pages/"
  "docs/seo/"
  "docs/guides/"
  "docs/phase-d/"
  "docs/phase-e/"
  "docs/operations/"
  "docs/control/"
)

# Base ref for diff (last tag)
BASE_REF="$(git describe --tags --abbrev=0)"

echo "[MAINTENANCE MODE] Base reference: $BASE_REF"

CHANGED_FILES="$(git diff --name-only "$BASE_REF"...HEAD)"

if [ -z "$CHANGED_FILES" ]; then
  echo "[MAINTENANCE MODE] No changes detected."
  exit 0
fi

echo "[MAINTENANCE MODE] Changed files:"
echo "$CHANGED_FILES"
echo "----"

# -------------------------
# Helper functions
# -------------------------

is_whitelisted() {
  local file="$1"
  for path in "${WHITELIST_PATHS[@]}"; do
    if [[ "$file" == $path* ]]; then
      return 0
    fi
  done
  return 1
}

is_forbidden() {
  local file="$1"
  for path in "${FORBIDDEN_PATHS[@]}"; do
    if [[ "$file" == $path* ]]; then
      return 0
    fi
  done
  return 1
}

# -------------------------
# Enforcement
# -------------------------

VIOLATION=0

for file in $CHANGED_FILES; do
  if is_whitelisted "$file"; then
    echo "[ALLOW] $file (whitelisted)"
    continue
  fi

  if is_forbidden "$file"; then
    echo "[BLOCK] $file violates Maintenance Mode"
    VIOLATION=1
    continue
  fi

  echo "[ALLOW] $file (neutral)"
done

if [ "$VIOLATION" -eq 1 ]; then
  echo ""
  echo "❌ Maintenance Mode violation detected."
  echo "Feature or analytical changes are forbidden after Phase D."
  exit 1
fi

echo ""
echo "✅ Maintenance Mode check passed."
