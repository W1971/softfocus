#!/usr/bin/env bash
set -euo pipefail

EXPORT_DIR="audit_export"
BUNDLE="artifacts/bundles/latest.md"
TAG="phase-c-audit-handoff"
DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
COMMIT="$(git rev-parse HEAD)"

echo "[INFO] Preparing Phase C audit export"

rm -rf "$EXPORT_DIR"
mkdir -p "$EXPORT_DIR"

# Copy canonical docs
cp AUDIT_HANDOFF.md "$EXPORT_DIR/"
cp AUDIT_README.md "$EXPORT_DIR/"
cp CHANGELOG_PHASE_C.md "$EXPORT_DIR/"

# Copy bundle
cp "$BUNDLE" "$EXPORT_DIR/project_bundle_latest.md"

# Metadata
cat > "$EXPORT_DIR/METADATA.txt" <<META
SoftFocus Phase C Audit Export
Baseline Tag: $TAG
Commit: $COMMIT
Generated: $DATE
META

# Checksums
(
  cd "$EXPORT_DIR"
  sha256sum *.md > SHA256SUMS.txt
)

echo "[OK] Audit export created in $EXPORT_DIR/"
