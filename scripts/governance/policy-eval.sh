#!/usr/bin/env bash
set -euo pipefail

POLICY_FILE="${1:-}"

if [ -z "$POLICY_FILE" ]; then
  echo "Usage: policy-eval.sh <policy.yaml>"
  exit 1
fi

if [ ! -f "$POLICY_FILE" ]; then
  echo "❌ Policy file not found: $POLICY_FILE"
  exit 1
fi

# --- 1. Collect facts -------------------------------------------------------

AUDIT_OUTPUT="$(bash scripts/governance/structure-audit.sh)"
eval "$AUDIT_OUTPUT"

if [ "${audit_result:-FAIL}" != "PASS" ]; then
  echo "❌ Governance violation: structure audit failed"
  exit 1
fi

# --- 2. Read lifecycle.current_phase ---------------------------------------

CURRENT_PHASE=""

# Preferred path: python3 + PyYAML
if command -v python3 >/dev/null 2>&1; then
  CURRENT_PHASE="$(python3 - <<'PY' "$POLICY_FILE" 2>/dev/null || true
import sys

path = sys.argv[1]

try:
    import yaml
except Exception:
    sys.exit(2)

with open(path, "r", encoding="utf-8") as f:
    data = yaml.safe_load(f) or {}

phase = None
if isinstance(data, dict):
    lc = data.get("lifecycle")
    if isinstance(lc, dict):
        phase = lc.get("current_phase")

if not phase:
    sys.exit(3)

print(phase)
PY
)"
fi

# Fallback: strict awk parse (no quotes, no yq)
if [ -z "$CURRENT_PHASE" ]; then
  CURRENT_PHASE="$(awk '
    BEGIN { in_lifecycle=0 }
    /^[[:space:]]*lifecycle:[[:space:]]*$/ { in_lifecycle=1; next }
    in_lifecycle && /^[[:space:]]*current_phase:[[:space:]]*/ {
      sub(/^[[:space:]]*current_phase:[[:space:]]*/, "", $0)
      print $0
      exit
    }
    in_lifecycle && /^[^[:space:]]/ { in_lifecycle=0 }
  ' "$POLICY_FILE")"
fi

if [ -z "$CURRENT_PHASE" ]; then
  echo "❌ Could not determine lifecycle.current_phase from policy"
  exit 1
fi

# --- 3. Final verdict -------------------------------------------------------

echo "✔ Governance OK"
echo "✔ Current phase: ${CURRENT_PHASE}"

exit 0
