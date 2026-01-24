#!/usr/bin/env bash
set -euo pipefail

RUN_ID="${1:-}"

if [[ -z "$RUN_ID" ]]; then
  echo "Usage: pre-product-tests.sh <RUN_ID>"
  exit 1
fi

echo "=== PRE-PRODUCT TESTS ==="

echo "-> content validation"
npm run content:lint

echo "-> alias status generation"
alias_softfocus/bin/generate-status "$RUN_ID"

echo "PASSED: pre-product tests (${RUN_ID})"

./scripts/ci/run-alias-tests.sh
