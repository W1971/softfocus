#!/usr/bin/env bash
set -euo pipefail

RUN_ID="${1:-}"
if [[ -z "$RUN_ID" ]]; then
  echo "Usage: TS-ENTITLEMENT-GRANT-001.sh <RUN_ID>"
  exit 1
fi

./backend/scripts/entitlement/grant-entitlement.sh "$RUN_ID"
