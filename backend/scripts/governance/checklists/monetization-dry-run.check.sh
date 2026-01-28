#!/usr/bin/env bash
set -euo pipefail

REPORT="docs/control/phase-c/MONETIZATION_DRY_RUN_REPORT.md"

fail() {
  echo "FAIL: $1"
  exit 1
}

pass() {
  echo "PASS: $1"
}

# 1. File exists
[[ -f "$REPORT" ]] || fail "Dry run report not found"

# 2. Status must not be NOT_RUN
grep -q "status: PASS" "$REPORT" \
  || fail "Dry run status is not PASS"

pass "Dry run report status is PASS"

# 3. Checklist sections must exist
for section in \
  "Payment Simulation" \
  "Entitlement Delivery" \
  "Result Access Verification" \
  "Refund Simulation" \
  "Audit Logging"
do
  grep -q "$section" "$REPORT" \
    || fail "Missing section: $section"
done

pass "All required checklist sections present"

echo "Monetization dry run checklist PASSED"
