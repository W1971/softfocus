#!/usr/bin/env bash
set -euo pipefail

# --- Safety guard: ensure mobile/screens exists ---
if [[ ! -d "mobile/screens" ]]; then
  echo "❌ CI FAIL: mobile/screens directory not found"
  echo "This repository must contain the canonical mobile tree."
  exit 1
fi

# --- Allowed mobile screens ---
ALLOWED_SCREENS=(
  "assessment"
  "result"
  "reference"
  "exit"
)

MOBILE_SCREENS_DIR="mobile/screens"

for dir in "$MOBILE_SCREENS_DIR"/*; do
  name="$(basename "$dir")"
  allowed=false

  for a in "${ALLOWED_SCREENS[@]}"; do
    if [[ "$name" == "$a" ]]; then
      allowed=true
      break
    fi
  done

  if [[ "$allowed" == false ]]; then
    echo "❌ CI FAIL: Forbidden mobile screen detected: $name"
    echo "Allowed screens are: ${ALLOWED_SCREENS[*]}"
    exit 1
  fi
done

echo "✅ Mobile screens check passed"
