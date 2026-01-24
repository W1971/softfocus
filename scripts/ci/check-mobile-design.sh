#!/usr/bin/env bash
set -euo pipefail

echo "== Mobile Design Audit Gate =="

AUDIT_JSON="docs/frontend/mobile/audit/MOBILE_UI_AUDIT_RESULT.json"

if [[ ! -f "$AUDIT_JSON" ]]; then
  echo "ERROR: Mobile UI audit result missing"
  exit 1
fi

STATUS=$(jq -r '.status' "$AUDIT_JSON")
OVERRIDE=$(jq -r '.human_override' "$AUDIT_JSON")

if [[ "$STATUS" != "PASS" ]]; then
  echo "ERROR: Mobile UI audit status is not PASS"
  exit 1
fi

if [[ "$OVERRIDE" != "false" ]]; then
  echo "ERROR: Human override detected — not allowed"
  exit 1
fi

echo "✔ Mobile design audit PASS"
echo "✔ Mobile design is allowed to proceed"
