#!/usr/bin/env bash
set -euo pipefail

ROOT_PAGE="app/page.tsx"

if [ ! -f "$ROOT_PAGE" ]; then
  echo "[FAIL] app/page.tsx not found"
  exit 20
fi

if grep -E "kalkulyator-|sleepCalculator|recoveryCalculator" "$ROOT_PAGE"; then
  echo "[FAIL] Calculator imports or references detected in app/page.tsx"
  exit 20
fi

echo "[OK] Root page is calculator-free"
exit 0
