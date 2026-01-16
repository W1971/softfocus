#!/usr/bin/env bash
set -euo pipefail

# SoftFocus — Phase D-3 Indexing Guard
# Enforces explicit indexing opt-in for releases
# Governance-level script (no publishing, no SEO)

ROOT_DIR="$(git rev-parse --show-toplevel)"
DOCS_DIR="$ROOT_DIR/docs"
INDEX_DECLARATION="$DOCS_DIR/seo/INDEXING_DECLARATION.md"

FAIL=0

echo "[INDEXING-GUARD] Phase D-3 check started"

# --- Rule 1: Must be on a tagged commit ---
if ! git describe --tags --exact-match >/dev/null 2>&1; then
  echo "[FAIL] Current commit is not a tagged release"
  FAIL=1
else
  TAG="$(git describe --tags --exact-match)"
  echo "[OK] Tagged release detected: $TAG"
fi

# --- Rule 2: Indexing declaration must exist ---
if [[ ! -f "$INDEX_DECLARATION" ]]; then
  echo "[FAIL] Missing indexing declaration: docs/seo/INDEXING_DECLARATION.md"
  FAIL=1
else
  echo "[OK] Indexing declaration file exists"
fi

# --- Rule 3: Declaration must explicitly allow indexing ---
if [[ -f "$INDEX_DECLARATION" ]]; then
  if ! grep -q "^Indexing:\s*ENABLED" "$INDEX_DECLARATION"; then
    echo "[FAIL] Indexing is not explicitly ENABLED in declaration"
    FAIL=1
  else
    echo "[OK] Indexing explicitly enabled"
  fi
fi

# --- Rule 4: Declaration must reference current tag ---
if [[ -f "$INDEX_DECLARATION" ]]; then
  if ! grep -q "^Release-Tag:\s*$TAG" "$INDEX_DECLARATION"; then
    echo "[FAIL] Indexing declaration does not reference current release tag"
    FAIL=1
  else
    echo "[OK] Indexing declaration references release tag"
  fi
fi

# --- Final result ---
if [[ "$FAIL" -eq 1 ]]; then
  echo "[INDEXING-GUARD] RESULT: FAIL"
  exit 1
fi

echo "[INDEXING-GUARD] RESULT: PASS"
exit 0
