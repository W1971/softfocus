#!/usr/bin/env bash

echo "SoftFocus Mobile App Readiness Check"
echo "----------------------------------"

FAIL=0

check() {
  if [ ! -f "$1" ]; then
    echo "[FAIL] Missing: $1"
    FAIL=1
  else
    echo "[OK]   $1"
  fi
}

# Core mobile governance
check docs/frontend/mobile/MOBILE_OVERVIEW.md
check docs/control/MOBILE_V1_GOVERNANCE_FREEZE.md
check docs/frontend/mobile/ANTI_REQUIREMENTS_MOBILE_UI.md
check docs/frontend/mobile/SoftFocus_Mobile_Policy.md

# Mobile schema & lint
check docs/frontend/mobile/SoftFocus_Mobile_Result_Schema.json
check scripts/ui-lint/audit-mobile-jsx.cjs
check scripts/ui-lint/validate-mobile-result.cjs

# Observation layer
check scripts/reports/generate-mobile-resonance.cjs
check scripts/reports/check-mobile-regression.cjs

# Reports existence (non-blocking)
if [ -d reports/mobile ]; then
  echo "[OK]   reports/mobile exists"
else
  echo "[WARN] reports/mobile missing (no data yet)"
fi

echo "----------------------------------"

if [ "$FAIL" -eq 1 ]; then
  echo "RESULT: NOT READY for mobile app"
  exit 1
else
  echo "RESULT: READY for mobile app consideration"
  exit 0
fi
