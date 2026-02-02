#!/usr/bin/env bash
set -euo pipefail

# ==================================================
# SoftFocus — Canonical Project Bundle Generator
#
# This script is the SINGLE authority for:
# - bundle structure
# - document inclusion
# - ordering
#
# Any meaningful change to the bundle MUST be done
# by amending THIS SCRIPT.
#
# Manual edits of generated bundles are forbidden.
# ==================================================

VERSION_FILE="release/VERSION.md"
BUNDLE_DIR="artifacts/bundles"
DATE_UTC="$(date -u +%Y-%m-%d)"
TIME_UTC="$(date -u +%H:%M:%S)"
VERSION="unknown"

fail() { echo "[FAIL] $1" >&2; exit 20; }
info() { echo "[INFO] $1" >&2; }

# --------------------------------------------------
# Resolve version (best-effort)
# --------------------------------------------------
if [ -f "$VERSION_FILE" ]; then
  v="$(grep -E '^version:' "$VERSION_FILE" | awk '{print $2}' || true)"
  [ -n "${v:-}" ] && VERSION="$v"
fi

OUT="$BUNDLE_DIR/project_bundle_${VERSION}_${DATE_UTC}.md"

# --------------------------------------------------
# Canonical document set (ORDER MATTERS)
# --------------------------------------------------
DOCS_REQUIRED=(
  # ---- Entry point ----
  "docs/overview.md"

  # ---- Documentation hierarchy ----
  "docs/PROJECT_DOCS_HIERARCHY.md"
  "docs/PROJECT_DOCUMENTATION_OVERVIEW.md"

  # ---- Product definition ----
  "docs/product/PRODUCT_END_STATE.md"
  "docs/product/runtime/RUNTIME_SPLIT.md"

  # ---- Platform scopes ----
  "docs/mobile/MOBILE_PRODUCT_SCOPE.md"
  "docs/web/WEB_PRODUCT_SCOPE.md"

  # ---- SEO / PSEO canon ----
  "docs/seo/SEO_ENTRY_INDEX.md"
  "docs/seo/PSEO_CANON.md"
  "docs/seo/ROLE_PAGES_STATUS.md"

  # ---- Canonical explanations ----
  "docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md"

  # ---- Governance & lifecycle ----
  "docs/control/PHASE_C_FREEZE.md"

  # ---- Release rules ----
  "docs/release/RELEASE_TAGGING_POLICY.md"
)

# --------------------------------------------------
# Preconditions
# --------------------------------------------------
mkdir -p "$BUNDLE_DIR"
: > "$OUT"

for f in "${DOCS_REQUIRED[@]}"; do
  [ -f "$f" ] || fail "Missing required doc: $f"
done

# --------------------------------------------------
# Bundle header
# --------------------------------------------------
{
  echo "# SoftFocus — Project Bundle"
  echo ""
  echo "- Version: $VERSION"
  echo "- Generated: ${DATE_UTC} ${TIME_UTC} (UTC)"
  echo ""
  echo "> This bundle is generated exclusively by the script:"
  echo "> \`scripts/bundles/generate_project_bundle.sh\`"
  echo ">"
  echo "> Important:"
  echo "> - This bundle is a derived, read-only artifact."
  echo "> - Manual edits are forbidden and ignored."
  echo "> - Any meaningful change to structure, ordering,"
  echo ">   or included meaning MUST be implemented by"
  echo ">   amending the generating script itself."
  echo ""
  echo "---"
  echo ""
} >> "$OUT"

# --------------------------------------------------
# Emit documents
# --------------------------------------------------
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

# --------------------------------------------------
# Reference block (intentional, non-canonical)
# --------------------------------------------------
cat >> "$OUT" <<'MD'
==================================================
REFERENCE: EXECUTION CONTEXT (NON-CANONICAL)
==================================================

- Phase C: ARCHITECTURE FROZEN
- Phase D: EXECUTION & DISTRIBUTION

pSEO role-based pages:
- discovery-only
- non-clinical
- no recommendations
- single canonical assessment entry

Monetization:
- occurs ONLY after result interpretation
- via optional analytical depth
- no pressure, no behavior shaping

MD

echo "---" >> "$OUT"
echo "_This bundle is generated automatically by a canonical script._" >> "$OUT"
echo "_If this bundle appears incorrect or outdated, the generating script must be amended._" >> "$OUT"

# --------------------------------------------------
# Canonical pointers
# --------------------------------------------------
cp "$OUT" "$BUNDLE_DIR/project_bundle.CURRENT.md"
cp "$OUT" "$BUNDLE_DIR/latest.md"

info "Updated $BUNDLE_DIR/project_bundle.CURRENT.md"
info "Updated $BUNDLE_DIR/latest.md"

info "Generated $OUT"
