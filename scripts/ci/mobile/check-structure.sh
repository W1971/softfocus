#!/usr/bin/env bash
set -euo pipefail

# --- Ensure canonical mobile tree exists ---
if [[ ! -d "mobile/screens" ]]; then
  echo "❌ MOBILE FAIL: mobile/screens directory not found"
  exit 1
fi

ALLOWED_SCREENS=(assessment result reference exit)

for dir in mobile/screens/*; do
  name="$(basename "$dir")"
  allowed=false

  for a in "${ALLOWED_SCREENS[@]}"; do
    [[ "$name" == "$a" ]] && allowed=true && break
  done

  if [[ "$allowed" == false ]]; then
    echo "❌ MOBILE FAIL: forbidden screen '$name'"
    echo "Allowed screens: ${ALLOWED_SCREENS[*]}"
    exit 1
  fi
done

echo "✅ MOBILE structure OK"
