#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

DOMAINS="product roadmap seo architecture"

echo "SoftFocus — Docs Index Bootstrap v1"

for domain in $DOMAINS; do
  BASE="$ROOT_DIR/docs/$domain"
  ACTIVE="$BASE/active"
  ARCHIVE="$BASE/archive"

  mkdir -p "$ACTIVE"
  mkdir -p "$ARCHIVE"

  cat << INDEX > "$BASE/README.md"
# $domain documentation

## Active documents
$(ls "$ACTIVE" 2>/dev/null || true)

## Archived documents
$(ls "$ARCHIVE" 2>/dev/null || true)
INDEX

done

echo "Docs index generated"
