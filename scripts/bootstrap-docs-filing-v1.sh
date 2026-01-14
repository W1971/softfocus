#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

DOMAINS="product roadmap seo architecture"

echo "SoftFocus — Docs Filing Bootstrap v1"

for domain in $DOMAINS; do
  BASE="$ROOT_DIR/docs/$domain"
  ACTIVE="$BASE/active"
  ARCHIVE="$BASE/archive"

  mkdir -p "$ACTIVE"
  mkdir -p "$ARCHIVE"

  if [ -d "$BASE" ]; then
    for file in "$BASE"/*.md; do
      [ -f "$file" ] || continue
      echo "Moving legacy doc to archive: $file"
      mv "$file" "$ARCHIVE/"
    done
  fi
done

echo "Docs filing system initialized"
