#!/usr/bin/env bash
set -euo pipefail

ALIAS="v2_governance"

./tests/alias/alias_contract.test.sh "$ALIAS" "DESIGN_ONLY"

echo "✔ v2 governance correctly locked as DESIGN_ONLY"
