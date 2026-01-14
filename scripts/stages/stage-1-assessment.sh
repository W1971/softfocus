#!/usr/bin/env bash
set -euo pipefail

FILE="$(git rev-parse --show-toplevel)/docs/product/PHASE1_ASSESSMENT.md"

echo "Running Stage 1 — Phase 1 Assessment"

[ -f "$FILE" ] || { echo "BLOCKED: PHASE1_ASSESSMENT.md missing"; exit 1; }
echo "OK: Phase 1 document present"

grep -q "Status: LOCKED" "$FILE" || { echo "BLOCKED: Phase 1 not LOCKED"; exit 1; }
echo "OK: Phase 1 status LOCKED"

echo "STAGE 1 PASSED"
