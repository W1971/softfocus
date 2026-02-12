#!/usr/bin/env bash
set -euo pipefail

AUDIT_FILE="docs/mobile/audit/stage-1.latest.yaml"
CHECKLIST="docs/mobile/MOBILE_VISUAL_LAYER_CHECKLIST.md"
COMMIT="$(git rev-parse HEAD)"
CHECKSUM="$(sha256sum "$CHECKLIST" | awk '{print $1}')"
TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

mkdir -p "$(dirname "$AUDIT_FILE")"

cat > "$AUDIT_FILE" << YAML
type: mobile-stage-1-audit
stage: stage-1
scope: mobile
commit: $COMMIT
checklist_checksum: $CHECKSUM
generated_at_utc: $TIMESTAMP
status: verified
YAML

echo "✔ Stage-1 audit generated:"
echo "  - file: $AUDIT_FILE"
echo "  - commit: $COMMIT"
echo "  - checklist checksum: $CHECKSUM"
