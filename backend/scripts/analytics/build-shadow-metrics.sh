#!/usr/bin/env bash
set -euo pipefail

LOG="backend/audit/SHADOW_MONETIZATION.audit.jsonl"
OUT="backend/analytics/shadow_metrics.json"

[[ -f "$LOG" ]] || { echo "No shadow monetization logs"; exit 0; }

TOTAL=$(jq -s 'length' "$LOG")
BY_PRODUCT=$(jq -s 'group_by(.product) | map({product: .[0].product, count: length})' "$LOG")
BY_PRICE=$(jq -s 'group_by(.price_hint) | map({price: .[0].price_hint, count: length})' "$LOG")

cat << EOL > "$OUT"
{
  "total_intents": $TOTAL,
  "by_product": $BY_PRODUCT,
  "by_price": $BY_PRICE,
  "generated_at": "$(date -Is)"
}
EOL

echo "Shadow metrics built → $OUT"
