#!/usr/bin/env bash
set -euo pipefail

LOG="backend/audit/SHADOW_PRICE_HINT.audit.jsonl"
VARIANT=$1

[[ -z "$VARIANT" ]] && { echo "Usage: shadow-price-hint <19|29|39>"; exit 1; }

cat << EOL >> "$LOG"
{
  "event": "SHADOW_PRICE_HINT",
  "variant": "$VARIANT",
  "timestamp": "$(date -Is)",
  "payment_executed": false
}
EOL

echo "Price hint $VARIANT logged"
