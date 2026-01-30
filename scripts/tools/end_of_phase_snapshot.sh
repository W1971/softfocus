#!/usr/bin/env bash
# Purpose:
# Generate an immutable project snapshot at the end of a lifecycle phase.
# Used for archival, audit, and governance verification.

set -euo pipefail

VERSION_FILE="release/VERSION.md"
BUNDLE_DIR="artifacts/bundles"
DATE="$(date -u +%Y-%m-%d)"
TIMESTAMP="$(date -u '+%Y-%m-%d %H:%M')"
VERSION="unknown"

if [ -f "$VERSION_FILE" ]; then
  VERSION="$(grep -E '^version:' "$VERSION_FILE" | awk '{print $2}')"
fi

OUT="$BUNDLE_DIR/project_bundle_v${VERSION}_${DATE}.md"

DOCS=(
  "README.md"
  "docs/overview.md"
  "docs/PROJECT_DOCS_HIERARCHY.md"
  "docs/PROJECT_DOCUMENTATION_OVERVIEW.md"
  "docs/control/OPERATIONAL_READINESS.md"
  "docs/seo/SEO_ENTRY_INDEX.md"
  "docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md"
  "docs/phase-d/PHASE_D_ARCHIVE.md"
  "docs/operations/MAINTENANCE_MODE.md"
)


mkdir -p "$BUNDLE_DIR"
: > "$OUT"

echo "# SoftFocus — Project Bundle" >> "$OUT"
echo "" >> "$OUT"
echo "- Generated (UTC): $TIMESTAMP" >> "$OUT"
echo "- Snapshot date: $DATE" >> "$OUT"
echo "" >> "$OUT"
echo "---" >> "$OUT"

for f in "${DOCS[@]}"; do
  if [ -f "$f" ]; then
    echo "" >> "$OUT"
    echo "## Source: \`$f\`" >> "$OUT"
    echo "" >> "$OUT"
    cat "$f" >> "$OUT"
  else
    echo "> ⚠️ Missing: $f" >> "$OUT"
  fi
done

echo "" >> "$OUT"
echo "---" >> "$OUT"
echo "_This bundle is generated automatically. Do not edit manually._" >> "$OUT"

echo "[BUNDLE] Generated $OUT"
