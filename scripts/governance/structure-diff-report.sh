#!/usr/bin/env bash
set -euo pipefail

# SoftFocus — EN↔RU Read-only Diff Report
# Governance-level visibility script
# DOES NOT FAIL — informational only

ROOT_DIR="$(git rev-parse --show-toplevel)"
DOCS_DIR="$ROOT_DIR/docs"

echo "[DIFF] EN↔RU content diff report"
echo "[DIFF] Root: $DOCS_DIR"
echo

FOUND=0

find "$DOCS_DIR" -type f -name '*_RU.md' | while read -r RU_FILE; do
  EN_FILE="${RU_FILE/_RU.md/.md}"

  if [[ ! -f "$EN_FILE" ]]; then
    echo "[WARN] Missing EN counterpart for: $RU_FILE"
    echo
    continue
  fi

  echo "[DIFF] Comparing:"
  echo "  EN: $EN_FILE"
  echo "  RU: $RU_FILE"
  echo

  # Unified diff, ignore trivial whitespace-only changes
  if diff -u --ignore-all-space "$EN_FILE" "$RU_FILE" > /tmp/ru_diff.$$; then
    echo "  [OK] No content differences detected"
  else
    FOUND=1
    sed 's/^/  /' /tmp/ru_diff.$$
  fi

  echo
done

if [[ "$FOUND" -eq 0 ]]; then
  echo "[DIFF] No content differences found across all documents"
else
  echo "[DIFF] Content differences detected (review recommended)"
fi

exit 0
