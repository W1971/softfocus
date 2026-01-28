#!/usr/bin/env bash
set -euo pipefail

METRICS="backend/analytics/shadow_metrics.json"

[[ -f "$METRICS" ]] || { echo "No shadow metrics found"; exit 1; }

INTENTS=$(jq '.total_intents' "$METRICS")
PRICE=$(jq -r '.by_price | max_by(.count) | .price' "$METRICS")

K=0.14
FORECAST=$(echo "$INTENTS * $K * $PRICE" | bc)

cat << EOL
Shadow Revenue Forecast
-----------------------
Intents: $INTENTS
Price: $PRICE
Effective conversion: 14%
Projected revenue: $FORECAST / period
EOL
