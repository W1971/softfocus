#!/usr/bin/env bash

echo "→ Checking forbidden imports in mobile components"

FORBIDDEN_PATTERNS=(
  "kalkulyator"
  "SleepCalculator"
  "contracts.ts"
  "data.ts"
)

FAIL=0

FILES=$(grep -R "from .*app/" frontend mobile app 2>/dev/null || true)

for pattern in "${FORBIDDEN_PATTERNS[@]}"; do
  if echo "$FILES" | grep -q "$pattern"; then
    echo "[FAIL] Forbidden mobile import detected: $pattern"
    FAIL=1
  fi
done

if [ "$FAIL" -eq 1 ]; then
  echo "RESULT: Mobile import violation"
  exit 1
else
  echo "RESULT: Mobile imports clean"
  exit 0
fi
