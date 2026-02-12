#!/usr/bin/env bash
set -euo pipefail

# --------------------------------------
# Bundle Freshness Guard (VCS-authoritative, lifecycle-aware)
#
# Rules:
# - Bundle committed → use bundle commit timestamp
# - Bundle NOT committed → use HEAD timestamp
# - Canonical doc committed → use doc commit timestamp
# - Canonical doc NOT committed → use HEAD timestamp
# --------------------------------------

BUNDLE_DIR="artifacts/bundles"

CANONICAL_DOCS=(
  "docs/overview.md"
  "docs/control/CONTROL_AUTHORITY_INDEX.md"
  "docs/control/CHECKLIST_EXECUTION_MODEL.md"
  "docs/control/DESIGN_TO_DEPLOY_FLOW.md"
)

fail() { echo "[FAIL] $1" >&2; exit 1; }
info() { echo "[INFO] $1" >&2; }

# --------------------------------------
# Resolve latest bundle
# --------------------------------------
BUNDLE="$(ls -1t "$BUNDLE_DIR"/project_bundle_*.md 2>/dev/null | head -n 1 || true)"
[ -n "${BUNDLE:-}" ] || fail "No project bundle found in $BUNDLE_DIR"

# --------------------------------------
# Resolve reference timestamp (bundle)
# --------------------------------------
if git ls-files --error-unmatch "$BUNDLE" >/dev/null 2>&1; then
  REF_TS="$(git log -1 --format=%ct -- "$BUNDLE")"
  info "Using bundle commit timestamp"
else
  REF_TS="$(git log -1 --format=%ct HEAD)"
  info "Bundle not committed — using HEAD commit timestamp"
fi

[ -n "${REF_TS:-}" ] || fail "Unable to resolve reference timestamp"

# --------------------------------------
# Compare canonical docs
# --------------------------------------
for doc in "${CANONICAL_DOCS[@]}"; do
  [ -f "$doc" ] || fail "Missing canonical doc: $doc"

  if git ls-files --error-unmatch "$doc" >/dev/null 2>&1; then
    DOC_TS="$(git log -1 --format=%ct -- "$doc")"
    info "Using commit timestamp for $doc"
  else
    DOC_TS="$(git log -1 --format=%ct HEAD)"
    info "Canonical doc not committed ($doc) — using HEAD timestamp"
  fi

  if [ "$DOC_TS" -gt "$REF_TS" ]; then
    fail "Bundle is stale: $doc is newer than bundle"
  fi
done

info "Bundle freshness PASS"
exit 0
