#!/usr/bin/env bash
set -euo pipefail

# SoftFocus — EN↔RU Structure Parity Check
# Governance-level script
# FAILs if section headers differ between EN and RU documents

ROOT_DIR="$(git rev-parse --show-toplevel)"
DOCS_DIR="$ROOT_DIR/docs"

FAIL=0

echo "[PARITY] EN↔RU structure check started"

# Find all EN documents that have RU counterparts
find "$DOCS_DIR" -type f -name '*_RU.md' | while read -r RU_FILE; do
  EN_FILE="${RU_FILE/_RU.md/.md}"

  if [[ ! -f "$EN_FILE" ]]; then
    echo "[FAIL] Missing EN counterpart for: $RU_FILE"
    FAIL=1
    continue
  fi

  # Extract headers only (#, ##, ### etc), strip trailing spaces
  EN_HEADERS="$(grep -E '^#{1,6} ' "$EN_FILE" | sed 's/[[:space:]]*$//')"
  RU_HEADERS="$(grep -E '^#{1,6} ' "$RU_FILE" | sed 's/[[:space:]]*$//')"

  if [[ "$EN_HEADERS" != "$RU_HEADERS" ]]; then
    echo "[FAIL] Structure mismatch:"
    echo "  EN: $EN_FILE"
    echo "  RU: $RU_FILE"
    echo "  --- EN headers ---"
    echo "$EN_HEADERS"
    echo "  --- RU headers ---"
    echo "$RU_HEADERS"
    FAIL=1
  else
    echo "[OK] Structure match: $(basename "$EN_FILE")"
  fi
done

if [[ "$FAIL" -ne 0 ]]; then
  echo "[BLOCKED] EN↔RU structure parity check FAILED"
  exit 1
fi

echo "[PASS] EN↔RU structure parity check PASSED"
