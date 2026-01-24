#!/usr/bin/env bash
set -euo pipefail

echo "== Alias Contract Test =="

ALIASES_FILE="docs/control/ALIASES.yaml"

if [[ ! -f "$ALIASES_FILE" ]]; then
  echo "ERROR: ALIASES.yaml missing"
  exit 1
fi

# Required statuses
REQUIRED_STATUSES=("READY" "LOW_CONFIDENCE" "DESIGN_ONLY")

for status in "${REQUIRED_STATUSES[@]}"; do
  if ! grep -q "status: $status" "$ALIASES_FILE"; then
    echo "ERROR: status '$status' not found in ALIASES.yaml"
    exit 1
  fi
done

# DESIGN_ONLY must imply execution FORBIDDEN
DESIGN_ONLY_VIOLATIONS=$(awk '
  $1=="status:" && $2=="DESIGN_ONLY"{flag=1}
  flag && $1=="execution:" && $2!="FORBIDDEN"{print "violation"; exit 1}
  $1==""{flag=0}
' "$ALIASES_FILE" || true)

if [[ -n "$DESIGN_ONLY_VIOLATIONS" ]]; then
  echo "ERROR: DESIGN_ONLY alias without execution FORBIDDEN"
  exit 1
fi

echo "✔ alias contract valid"
