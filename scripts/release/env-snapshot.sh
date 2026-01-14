#!/usr/bin/env bash
set -euo pipefail

STAMP=$(date +"%Y-%m-%d_%H-%M-%S")
OUT="scripts/release/snapshots/env-$STAMP.txt"

echo "SoftFocus Environment Snapshot" > "$OUT"
echo "Timestamp: $STAMP" >> "$OUT"
echo "Git commit: $(git rev-parse HEAD)" >> "$OUT"
echo "Git tag: $(git describe --tags --exact-match 2>/dev/null || echo none)" >> "$OUT"
echo "" >> "$OUT"

SAFE_ENVS=(
  NODE_ENV
  APP_URL
  PROTOCOL_DB
)

for v in "${SAFE_ENVS[@]}"; do
  echo "$v=${!v:-<unset>}" >> "$OUT"
done

echo "Snapshot written to $OUT"
