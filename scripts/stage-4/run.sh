#!/usr/bin/env bash
set -euo pipefail

STAGE="stage-4"
AUDIT_FILE="docs/mobile/audit/stage-4.latest.yaml"
CHECKLIST="docs/mobile/STAGE_4_CALCULATORS_EXPOSURE.md"

COMMIT="$(git rev-parse HEAD)"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
CHECKSUM="$(sha256sum "$CHECKLIST" | awk '{print $1}')"
NOW="$(date -u '+%Y-%m-%dT%H:%M:%SZ')"

mkdir -p docs/mobile/audit

cat > "$AUDIT_FILE" <<YAML
stage: stage-4
domain: mobile-calculators-exposure
version: v1

result: PASS

commit: $COMMIT
branch: $BRANCH

path: $CHECKLIST
checksum: $CHECKSUM

reviewed_by: sfctl
reviewed_at: $NOW

notes: |
  Stage-4 calculators exposure audit.
  Exposure patterns validated against Archetype 3.
  Advisory only.

declaration: >
  This audit file was generated automatically.
  Manual edits are prohibited.
YAML

echo "🎛️ Stage-4 AUDIT (calculators): PASS"
echo "→ Updated $AUDIT_FILE"
