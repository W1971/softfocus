#!/usr/bin/env bash
set -euo pipefail

APPROVAL="docs/control/phase-c/MONETIZATION_APPROVAL_RECORD.md"
REVOKE="docs/control/phase-c/MONETIZATION_REVOKE_RECORD.md"

[[ -f "$APPROVAL" ]] || { echo "FAIL: Approval record not found"; exit 1; }

cat << 'EOR' > "$REVOKE"
---
type: revoke-record
phase: C
scope: monetization
status: REVOKED
---

# Monetization Revocation Record

This document records an explicit decision
to revoke monetization approval.

Reason: Governance decision
Effective immediately.

Approved by: Project Owner
Date: $(date -I)
EOR

echo "Monetization REVOKED"
exit 0
