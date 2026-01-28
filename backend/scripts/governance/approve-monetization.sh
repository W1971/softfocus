#!/usr/bin/env bash
set -euo pipefail

REPORT="docs/control/phase-c/MONETIZATION_DRY_RUN_REPORT.md"
APPROVAL="docs/control/phase-c/MONETIZATION_APPROVAL_RECORD.md"

grep -q "status: PASS" "$REPORT" \
  || { echo "FAIL: Dry run not PASS"; exit 1; }

[[ -f "$APPROVAL" ]] \
  || { echo "FAIL: Approval record missing"; exit 1; }

grep -q "status: APPROVED" "$APPROVAL" \
  || { echo "FAIL: Approval not confirmed"; exit 1; }

echo "Monetization APPROVED"
