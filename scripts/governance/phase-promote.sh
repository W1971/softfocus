#!/usr/bin/env bash
set -euo pipefail

FROM_PHASE="A"
TO_PHASE="B"
POLICY_FILE="docs/governance/lifecycle-policy.yaml"
AUDIT_LOG="audit/phase-transitions.log"

# 1. Ensure clean governance state
bash scripts/governance/policy-eval.sh "$POLICY_FILE" >/dev/null

CURRENT_PHASE="$(awk '
  BEGIN { in_lc=0 }
  /^[[:space:]]*lifecycle:[[:space:]]*$/ { in_lc=1; next }
  in_lc && /^[[:space:]]*current_phase:[[:space:]]*/ {
    sub(/^[[:space:]]*current_phase:[[:space:]]*/, "", $0)
    print $0
    exit
  }
  in_lc && /^[^[:space:]]/ { in_lc=0 }
' "$POLICY_FILE")"

if [ "$CURRENT_PHASE" != "$FROM_PHASE" ]; then
  echo "❌ Cannot promote: current phase is '$CURRENT_PHASE', expected '$FROM_PHASE'"
  exit 1
fi

# 2. Promote phase in policy (in-place, deterministic)
sed -i.bak -E \
  's/(current_phase:[[:space:]]*)A/\1B/' \
  "$POLICY_FILE"
rm -f "${POLICY_FILE}.bak"

# 3. Append audit entry
mkdir -p audit
TS="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
USER="$(git config user.email || echo unknown)"

echo "${TS} ${USER} ${FROM_PHASE}->${TO_PHASE}" >> "$AUDIT_LOG"

echo "✔ Phase promoted: ${FROM_PHASE} → ${TO_PHASE}"
