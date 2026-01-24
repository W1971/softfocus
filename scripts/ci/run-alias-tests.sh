#!/usr/bin/env bash
set -euo pipefail

echo "== Alias-level Tests =="

if [[ ! -d "tests/alias" ]]; then
  echo "ERROR: tests/alias directory missing"
  exit 1
fi

FOUND=$(find tests/alias -maxdepth 1 -type f -name "*.test.sh" | wc -l | tr -d ' ')
if [[ "$FOUND" == "0" ]]; then
  echo "ERROR: no alias tests found (*.test.sh)"
  exit 1
fi

for t in tests/alias/*.test.sh; do
  echo "-> $t"
  bash "$t"
done

echo "✔ alias-level tests PASS"
