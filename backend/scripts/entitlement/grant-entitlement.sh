#!/usr/bin/env bash
set -euo pipefail

RUN_ID="${1:-}"
PRODUCT_ID="anti-burnout-system-30d"

if [[ -z "$RUN_ID" ]]; then
  echo "Usage: grant-entitlement.sh <RUN_ID>"
  exit 1
fi

export RUN_ID
export SCENARIO_ID="TS-ENTITLEMENT-GRANT-001"
export TARGET="product/${PRODUCT_ID}"
export CONTENT_TYPE="product"
export RULE="product_entitlement"
export RESULT="granted"
export SEVERITY="PASS"
export DETAILS='{"delivery":"static","mode":"pdf+notion"}'

node backend/scripts/content-validator/emit-run-jsonl.js

echo "PASSED: entitlement granted for ${PRODUCT_ID}"
