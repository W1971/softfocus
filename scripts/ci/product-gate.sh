#!/usr/bin/env bash
set -euo pipefail

echo "=== CHECK: SoftFocus Product Gate ==="

# 1. Content validation (WARN allowed)
OUT="$(npm run content:lint 2>&1 || true)"

if echo "${OUT}" | grep -q "Validation FAILED"; then
  echo "FAILED: content validation (FAIL)"
  echo "${OUT}"
  exit 1
fi

echo "PASSED: content validation (WARN allowed)"

# 2. File placement
if ./scripts/ci/check-file-placement.sh >/dev/null 2>&1; then
  echo "PASSED: file placement"
else
  echo "FAILED: file placement"
  exit 1
fi

# 3. Build
if npm run build >/dev/null 2>&1; then
  echo "PASSED: build"
else
  echo "FAILED: build"
  exit 1
fi

echo "PASSED: SoftFocus Product Gate"

