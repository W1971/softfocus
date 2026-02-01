#!/usr/bin/env bash
set -euo pipefail

VERSION_FILE="release/VERSION.md"
BUNDLE_DIR="artifacts/bundles"
DATE_UTC="$(date -u +%Y-%m-%d)"
TIME_UTC="$(date -u +%H:%M:%S)"
VERSION="unknown"

fail() { echo "[FAIL] $1" >&2; exit 20; }
info() { echo "[INFO] $1" >&2; }

if [ -f "$VERSION_FILE" ]; then
  v="$(grep -E '^version:' "$VERSION_FILE" | awk '{print $2}' || true)"
  [ -n "${v:-}" ] && VERSION="$v"
fi

OUT="$BUNDLE_DIR/project_bundle_${VERSION}_${DATE_UTC}.md"

DOCS_REQUIRED=(
  "docs/overview.md"
  "docs/PROJECT_DOCS_HIERARCHY.md"
  "docs/PROJECT_DOCUMENTATION_OVERVIEW.md"

  "docs/product/PRODUCT_END_STATE.md"
  "docs/product/runtime/RUNTIME_SPLIT.md"

  "docs/mobile/MOBILE_PRODUCT_SCOPE.md"
  "docs/web/WEB_PRODUCT_SCOPE.md"

  "docs/seo/SEO_ENTRY_INDEX.md"
  "docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md"
)

mkdir -p "$BUNDLE_DIR"
: > "$OUT"

for f in "${DOCS_REQUIRED[@]}"; do
  [ -f "$f" ] || fail "Missing required doc: $f"
done

{
  echo "# SoftFocus — Project Bundle"
  echo ""
  echo "- Version: $VERSION"
  echo "- Generated: ${DATE_UTC} ${TIME_UTC} (UTC)"
  echo ""
  echo "---"
  echo ""
} >> "$OUT"

emit() {
  echo "==================================================" >> "$OUT"
  echo "FILE: $1" >> "$OUT"
  echo "==================================================" >> "$OUT"
  echo "" >> "$OUT"
  cat "$1" >> "$OUT"
  echo "" >> "$OUT"
}

for f in "${DOCS_REQUIRED[@]}"; do
  emit "$f"
done

cat >> "$OUT" <<'MD'
==================================================
REFERENCE: NEXT PRODUCT STAGE
==================================================

Parallel finalization toward Product End State.

Web:
- Primary burnout understanding surface
- Role-based analytical clarity
- No tool dependency

Mobile:
- Quiet embodiment of understanding
- Optional confirmation and depth
- Visual discipline over engagement

No new analytical axes are introduced.
MD

echo "---" >> "$OUT"
echo "_This bundle is generated automatically. Do not edit manually._" >> "$OUT"

info "Generated $OUT"
