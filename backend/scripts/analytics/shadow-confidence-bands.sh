#!/usr/bin/env bash
set -euo pipefail

METRICS="backend/analytics/shadow_metrics.json"
[[ -f "$METRICS" ]] || { echo "No shadow metrics found"; exit 1; }

INTENTS=$(jq '.total_intents' "$METRICS")
PRICE=$(jq -r '.by_price | max_by(.count) | .price' "$METRICS")

LOW=$(echo "$INTENTS * 0.08 * $PRICE" | bc)
BASE=$(echo "$INTENTS * 0.14 * $PRICE" | bc)
HIGH=$(echo "$INTENTS * 0.22 * $PRICE" | bc)

cat << EOL
Confidence Bands Forecast
-------------------------
Intents: $INTENTS
Price reference: $PRICE

LOW   (8%)  : $LOW
BASE (14%)  : $BASE
HIGH (22%)  : $HIGH
EOL
