#!/usr/bin/env bash
set -euo pipefail

# --------------------------------------
# Bundle Diff Guard (STRUCTURE-ONLY)
#
# PASS if:
# - FILE section list and order are identical
#
# FAIL if:
# - any FILE section is added, removed, or reordered
#
# NOTE:
# - Content changes INSIDE files are allowed
# - Semantic changes are validated elsewhere
# --------------------------------------

BUNDLE_DIR="artifacts/bundles"

fail() { echo "[FAIL] $1" >&2; exit 1; }
info() { echo "[INFO] $1" >&2; }

# --------------------------------------
# Resolve last two bundles
# --------------------------------------
NEW="$(ls -1t "$BUNDLE_DIR"/project_bundle_*.md 2>/dev/null | sed -n '1p')"
OLD="$(ls -1t "$BUNDLE_DIR"/project_bundle_*.md 2>/dev/null | sed -n '2p')"

if [ -z "${NEW:-}" ] || [ -z "${OLD:-}" ]; then
  info "Only one bundle present — diff guard skipped"
  exit 0
fi

TMP_OLD="$(mktemp)"
TMP_NEW="$(mktemp)"

cleanup() {
  rm -f "$TMP_OLD" "$TMP_NEW"
}
trap cleanup EXIT

# --------------------------------------
# Structural comparison ONLY
# --------------------------------------
grep '^FILE: ' "$OLD" | sed 's/^FILE: //' > "$TMP_OLD"
grep '^FILE: ' "$NEW" | sed 's/^FILE: //' > "$TMP_NEW"

if ! diff -u "$TMP_OLD" "$TMP_NEW" >/dev/null; then
  fail "Bundle structure changed (FILE sections differ)"
fi

info "Bundle structure PASS"
exit 0
