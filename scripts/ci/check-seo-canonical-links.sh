#!/usr/bin/env bash

set -e

SEO_INDEX="docs/seo/SEO_ENTRY_INDEX.md"
CANONICAL_INDEX="docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md"

echo "[LINT] Checking SEO ↔ Canonical linkage"

if ! grep -q "CANONICAL_EXPLANATIONS_INDEX_RU.md" "$SEO_INDEX"; then
  echo "FAIL: SEO entry index does not reference canonical explanations"
  exit 1
fi

if grep -q "SEO_ENTRY_INDEX.md" "$CANONICAL_INDEX"; then
  echo "FAIL: Canonical explanations must not depend on SEO index"
  exit 1
fi

echo "PASS: SEO ↔ Canonical separation enforced"
