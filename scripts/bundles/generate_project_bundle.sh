#!/usr/bin/env bash
set -euo pipefail

# =========================================
# SoftFocus — Project Bundle Generator
# - Deterministic assembly of main docs
# - Canonical-first ordering (overview.md first)
# - Validates required docs exist
# - Captures git commit metadata
# - Optional strict version alignment checks
#
# Exit codes:
#   0  OK
#   20 FAIL (missing required docs / invalid state)
# =========================================

VERSION_FILE="release/VERSION.md"
BUNDLE_DIR="artifacts/bundles"
DATE_UTC="$(date -u +%Y-%m-%d)"
TIME_UTC="$(date -u +%H:%M:%S)"
VERSION="unknown"
GIT_COMMIT="unknown"
GIT_BRANCH="unknown"

# --------- helpers ---------
fail() { echo "[FAIL] $1" >&2; exit 20; }
warn() { echo "[WARN] $1" >&2; }
info() { echo "[INFO] $1" >&2; }

# --------- version resolution ---------
if [ -f "$VERSION_FILE" ]; then
  # expected: version: v1.5.0 (or similar)
  v="$(grep -E '^version:' "$VERSION_FILE" | awk '{print $2}' || true)"
  if [ -n "${v:-}" ]; then
    VERSION="$v"
  fi
fi

# fallback: try to read from docs/overview.md ("Version:" line)
if [ "$VERSION" = "unknown" ] && [ -f "docs/overview.md" ]; then
  v2="$(grep -E '^\*\*Version:\*\*' docs/overview.md | sed -E 's/.*\*\*Version:\*\*\s*([^ ]+).*/\1/' || true)"
  if [ -n "${v2:-}" ]; then
    VERSION="$v2"
  fi
fi

# --------- git metadata (best-effort) ---------
if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  GIT_COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"
  GIT_BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo unknown)"
fi

OUT="$BUNDLE_DIR/project_bundle_${VERSION}_${DATE_UTC}.md"

# --------- document list (canonical-first) ---------
# Level 0 must come first for audit readability.
DOCS_REQUIRED=(
  "docs/overview.md"
  "docs/PROJECT_DOCS_HIERARCHY.md"
  "docs/PROJECT_DOCUMENTATION_OVERVIEW.md"
  "docs/seo/SEO_ENTRY_INDEX.md"
  "docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md"
)

# Optional (non-fatal). Add more if you want.
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

# --------- strict alignment check (optional) ---------
# If you want to block builds when hierarchy/overview versions diverge,
# set STRICT_VERSION_ALIGNMENT=1 in env.
STRICT_VERSION_ALIGNMENT="${STRICT_VERSION_ALIGNMENT:-0}"

overview_ver="$(grep -E '^\*\*Version:\*\*' docs/overview.md | sed -E 's/.*\*\*Version:\*\*\s*([^ ]+).*/\1/' || true)"
hierarchy_ver="$(grep -E '^This hierarchy is stable as of' docs/PROJECT_DOCS_HIERARCHY.md | sed -E 's/.*v([0-9]+\.[0-9]+\.[0-9]+).*/v\1/' || true)"

if [ -n "${overview_ver:-}" ] && [ -n "${hierarchy_ver:-}" ] && [ "$overview_ver" != "$hierarchy_ver" ]; then
  msg="Version skew detected: overview=$overview_ver vs hierarchy=$hierarchy_ver"
  if [ "$STRICT_VERSION_ALIGNMENT" = "1" ]; then
    fail "$msg (STRICT_VERSION_ALIGNMENT=1)"
  else
    warn "$msg"
  fi
fi

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

# --------- emit function ---------
emit_file() {
  local f="$1"
  echo "==================================================" >> "$OUT"
  echo "FILE: $f" >> "$OUT"
  echo "==================================================" >> "$OUT"
  echo "" >> "$OUT"
  cat "$f" >> "$OUT"
  echo "" >> "$OUT"
  echo "" >> "$OUT"
}

# --------- required docs ---------
for f in "${DOCS_REQUIRED[@]}"; do
  emit_file "$f"
done

# --------- optional docs (best effort) ---------
for f in "${DOCS_OPTIONAL[@]}"; do
  if [ -f "$f" ]; then
    emit_file "$f"
  else
    warn "Optional doc missing: $f"
  fi
done

# --------- footer ---------
{
  echo "---"
  echo "_This bundle is generated automatically. Do not edit manually._"
} >> "$OUT"

echo "[BUNDLE] Generated $OUT"

# --------- update latest.md (symlink or copy) ---------
LATEST="$BUNDLE_DIR/latest.md"
NOW_UTC="$(date -u +%Y-%m-%d\ %H:%M:%S)"

{
  echo "<!--"
  echo "Latest bundle pointer"
  echo "Updated: $NOW_UTC UTC"
  echo "Source: $(basename "$OUT")"
  echo "-->"
  echo ""
} > "$BUNDLE_DIR/.latest_header.tmp"

if ln -sf "$(basename "$OUT")" "$LATEST" 2>/dev/null; then
  # prepend header for auditors (symlink-safe readers)
  cat "$BUNDLE_DIR/.latest_header.tmp" > "$BUNDLE_DIR/.latest.tmp"
  cat "$OUT" >> "$BUNDLE_DIR/.latest.tmp"
  mv "$BUNDLE_DIR/.latest.tmp" "$OUT"
  info "latest.md updated as symlink → $(basename "$OUT")"
else
  # fallback: hard copy
  cat "$BUNDLE_DIR/.latest_header.tmp" "$OUT" > "$LATEST"
  info "latest.md updated as copy"
fi

rm -f "$BUNDLE_DIR/.latest_header.tmp"


# --------- checksum (sha256) ---------
if command -v sha256sum >/dev/null 2>&1; then
  CHECKSUM="$(sha256sum "$OUT" | awk '{print $1}')"
elif command -v shasum >/dev/null 2>&1; then
  CHECKSUM="$(shasum -a 256 "$OUT" | awk '{print $1}')"
else
  CHECKSUM="unavailable"
fi

# Insert checksum into header (after first '---')
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


# --------- normalize version (enforce 'v' prefix) ---------
if [[ "$VERSION" != v* ]]; then
  VERSION="v$VERSION"
fi
