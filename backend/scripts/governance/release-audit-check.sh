#!/usr/bin/env bash
set -euo pipefail

# SoftFocus — Phase D-4 Release Audit Check
# Verifies mandatory audit artifacts for a tagged release
# Governance-level script (no build, no publish)

ROOT_DIR="$(git rev-parse --show-toplevel)"
DOCS_DIR="$ROOT_DIR/docs"
RELEASE_DIR="$DOCS_DIR/releases"
SEO_DIR="$DOCS_DIR/seo"

FAIL=0

echo "[AUDIT] Phase D-4 release audit check started"

# --- Rule 1: Must be on a tagged commit ---
if ! git describe --tags --exact-match >/dev/null 2>&1; then
  echo "[FAIL] Current commit is not a tagged release"
  FAIL=1
else
  TAG="$(git describe --tags --exact-match)"
  echo "[OK] Tagged release detected: $TAG"
fi

# --- Rule 2: Mandatory artifact files ---
declare -a REQUIRED_FILES=(
  "$RELEASE_DIR/RELEASE_MANIFEST.md"
  "$RELEASE_DIR/GOVERNANCE_COMPLIANCE.md"
  "$RELEASE_DIR/DOCUMENTATION_SNAPSHOT.md"
  "$RELEASE_DIR/AUDIT_LOG_POINTERS.md"
  "$SEO_DIR/INDEXING_DECLARATION.md"
)

for f in "${REQUIRED_FILES[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "[FAIL] Missing audit artifact: ${f#$ROOT_DIR/}"
    FAIL=1
  else
    echo "[OK] Found artifact: ${f#$ROOT_DIR/}"
  fi
done

# --- Rule 3: All artifacts must reference the same release tag ---
for f in "${REQUIRED_FILES[@]}"; do
  if [[ -f "$f" ]]; then
    if ! grep -q "$TAG" "$f"; then
      echo "[FAIL] Artifact does not reference release tag $TAG: ${f#$ROOT_DIR/}"
      FAIL=1
    else
      echo "[OK] Artifact references release tag: ${f#$ROOT_DIR/}"
    fi
  fi
done

# --- Rule 4: Phase C must be LOCKED ---
PHASE_C_LOCK="$DOCS_DIR/architecture/phase-c/PHASE_C6_LOCK_AND_COMPLIANCE.md"
if [[ ! -f "$PHASE_C_LOCK" ]]; then
  echo "[FAIL] Phase C lock document missing"
  FAIL=1
else
  if ! grep -q "Status: LOCKED" "$PHASE_C_LOCK"; then
    echo "[FAIL] Phase C is not LOCKED"
    FAIL=1
  else
    echo "[OK] Phase C is LOCKED"
  fi
fi

# --- Rule 5: Indexing declaration must be explicit ---
INDEX_DECL="$SEO_DIR/INDEXING_DECLARATION.md"
if [[ -f "$INDEX_DECL" ]]; then
  if ! grep -q "^Indexing:\s*ENABLED\|^Indexing:\s*DISABLED" "$INDEX_DECL"; then
    echo "[FAIL] Indexing declaration missing explicit state (ENABLED/DISABLED)"
    FAIL=1
  else
    echo "[OK] Indexing state explicitly declared"
  fi
fi

# --- Final result ---
if [[ "$FAIL" -eq 1 ]]; then
  echo "[AUDIT] RESULT: FAIL"
  exit 1
fi

echo "[AUDIT] RESULT: PASS"
exit 0
