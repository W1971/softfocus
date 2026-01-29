#!/usr/bin/env bash
set -euo pipefail

VERSION_FILE="release/VERSION.md"
BUNDLE_DIR="artifacts/bundles"
DATE_UTC="$(date -u +%Y-%m-%d)"
TIME_UTC="$(date -u +%H:%M:%S)"
VERSION="unknown"
GIT_COMMIT="unknown"
GIT_BRANCH="unknown"

fail() { echo "[FAIL] $1" >&2; exit 20; }
warn() { echo "[WARN] $1" >&2; }
info() { echo "[INFO] $1" >&2; }

# --------- version resolution ---------
if [ -f "$VERSION_FILE" ]; then
  v="$(grep -E '^version:' "$VERSION_FILE" | awk '{print $2}' || true)"
  [ -n "$v" ] && VERSION="$v"
fi

if [ "$VERSION" = "unknown" ] && [ -f "docs/overview.md" ]; then
  v2="$(grep -E '^\*\*Version:\*\*' docs/overview.md \
        | sed -E 's/.*\*\*Version:\*\*\s*([^ ]+).*/\1/' || true)"
  [ -n "$v2" ] && VERSION="$v2"
fi

# --------- git metadata ---------
if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  GIT_COMMIT="$(git rev-parse --short HEAD || echo unknown)"
  GIT_BRANCH="$(git rev-parse --abbrev-ref HEAD || echo unknown)"
fi

OUT="$BUNDLE_DIR/project_bundle_${VERSION}_${DATE_UTC}.md"

# --------- document list ---------
DOCS_REQUIRED=(
  "docs/overview.md"
  "app/page.tsx"
  "app/en/page.tsx"
  "docs/PROJECT_DOCS_HIERARCHY.md"
  "docs/PROJECT_DOCUMENTATION_OVERVIEW.md"
  "docs/seo/SEO_ENTRY_INDEX.md"
  "docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md"
)

DOCS_OPTIONAL=(
  "docs/product/CANONICAL_THEORY_OF_OPERATION.md"
  "docs/product/assessment-model.md"
  "docs/product/assessment-results.md"
  "docs/product/WHAT_SOFTFOCUS_GIVES.md"
)

mkdir -p "$BUNDLE_DIR"
: > "$OUT"

# --------- required files check ---------
for f in "${DOCS_REQUIRED[@]}"; do
  [ -f "$f" ] || fail "Missing required doc: $f"
done

# --------- header ---------
{
  echo "# SoftFocus — Project Bundle"
  echo ""
  echo "- Version: $VERSION"
  echo "- Generated: ${DATE_UTC} ${TIME_UTC} (UTC)"
  echo "- Git: ${GIT_COMMIT} (${GIT_BRANCH})"
  echo ""
  echo "---"
  echo ""
} >> "$OUT"

emit_file() {
  local f="$1"
  echo "==================================================" >> "$OUT"
  echo "FILE: $f" >> "$OUT"
  echo "==================================================" >> "$OUT"
  echo "" >> "$OUT"
  cat "$f" >> "$OUT"
  echo "" >> "$OUT"
}

for f in "${DOCS_REQUIRED[@]}"; do
  emit_file "$f"
done

for f in "${DOCS_OPTIONAL[@]}"; do
  [ -f "$f" ] && emit_file "$f"
done

echo "---" >> "$OUT"
echo "_This bundle is generated automatically. Do not edit manually._" >> "$OUT"

info "Generated $OUT"
# --------- update latest.md ---------
LATEST="$BUNDLE_DIR/latest.md"
NOW_UTC="$(date -u +%Y-%m-%d %H:%M:%S)"

{
  echo "<!--"
  echo "Latest bundle pointer"
  echo "Updated: $NOW_UTC UTC"
  echo "Source: $(basename "$OUT")"
  echo "-->"
  echo ""
} > "$BUNDLE_DIR/.latest_header.tmp"

# --------- checksum (sha256) ---------
if command -v sha256sum >/dev/null 2>&1; then
  CHECKSUM="$(sha256sum "$OUT" | awk '{print $1}')"
elif command -v shasum >/dev/null 2>&1; then
  CHECKSUM="$(shasum -a 256 "$OUT" | awk '{print $1}')"
else
  CHECKSUM="unavailable"
fi

tmp_checksum="$OUT.tmp.checksum"
awk -v cs="$CHECKSUM" '
  NR==1 {print; next}
  /^---$/ && !done {
    print "- SHA256: " cs
    done=1
  }
  {print}
' "$OUT" > "$tmp_checksum"

mv "$tmp_checksum" "$OUT"


if ln -sf "$(basename "$OUT")" "$LATEST" 2>/dev/null; then
  cat "$BUNDLE_DIR/.latest_header.tmp" "$OUT" > "$BUNDLE_DIR/.latest.tmp"
  mv "$BUNDLE_DIR/.latest.tmp" "$OUT"
  info "latest.md updated as symlink → $(basename "$OUT")"
else
  cat "$BUNDLE_DIR/.latest_header.tmp" "$OUT" > "$LATEST"
  info "latest.md updated as copy"
fi

rm -f "$BUNDLE_DIR/.latest_header.tmp"
