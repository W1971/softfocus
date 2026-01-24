#!/usr/bin/env bash
set -euo pipefail

echo "== v2 DESIGN_ONLY alias contract test =="

SCRIPT="./scripts/ci/check-v2-design-only.sh"

# --- PASS CASE ---
echo "-> PASS case (DESIGN_ONLY allowed language)"

TMP_PASS=$(mktemp -d)
mkdir -p "$TMP_PASS/docs/roadmap"
cp tests/alias/fixtures/v2/pass.md "$TMP_PASS/docs/roadmap/V2_PASS.md"

(
  cd "$TMP_PASS"
  "$OLDPWD/$SCRIPT"
)

echo "✔ PASS case accepted"

# --- FAIL CASE ---
echo "-> FAIL case (implementation language)"

TMP_FAIL=$(mktemp -d)
mkdir -p "$TMP_FAIL/docs/roadmap"
cp tests/alias/fixtures/v2/fail.md "$TMP_FAIL/docs/roadmap/V2_FAIL.md"

set +e
(
  cd "$TMP_FAIL"
  "$OLDPWD/$SCRIPT"
)
STATUS=$?
set -e

if [[ "$STATUS" -eq 0 ]]; then
  echo "✘ FAIL case was incorrectly accepted"
  exit 1
fi

echo "✔ FAIL case correctly rejected"

echo "✔ v2 DESIGN_ONLY alias contract PASSED"
