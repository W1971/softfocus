#!/usr/bin/env bash
set -euo pipefail

VERSION_FILE="release/VERSION.md"
BUNDLE_DIR="artifacts/bundles"
DATE="$(date -u +%Y-%m-%d)"
VERSION="unknown"

if [ -f "$VERSION_FILE" ]; then
  VERSION="$(grep -E '^version:' "$VERSION_FILE" | awk '{print $2}')"
fi

OUT="$BUNDLE_DIR/project_bundle_v${VERSION}_${DATE}.md"

DOCS=(
  "docs/PROJECT_DOCS_HIERARCHY.md"
  "docs/PROJECT_DOCUMENTATION_OVERVIEW.md"
  "docs/seo/SEO_ENTRY_INDEX.md"
  "docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md"
  "docs/overview.md"
)

mkdir -p "$BUNDLE_DIR"
: > "$OUT"

echo "# SoftFocus — Project Bundle" >> "$OUT"
echo "" >> "$OUT"
echo "- Version: $VERSION" >> "$OUT"
echo "- Generated: $DATE (UTC)" >> "$OUT"
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
