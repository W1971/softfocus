#!/usr/bin/env bash
set -euo pipefail

DOMAIN="${1:-}"

[ -n "$DOMAIN" ] || { echo "USAGE: version-bump.sh <domain>"; exit 1; }

ACTIVE="$(git rev-parse --show-toplevel)/docs/$DOMAIN/active"
ARCHIVE="$(git rev-parse --show-toplevel)/docs/$DOMAIN/archive"

[ -d "$ACTIVE" ] || exit 0
[ -d "$ARCHIVE" ] || mkdir -p "$ARCHIVE"

COUNT=0
LAST=""

for f in "$ACTIVE"/*.md; do
  [ -f "$f" ] || continue
  COUNT=$((COUNT+1))
  LAST="$f"
done

[ "$COUNT" -le 1 ] && echo "No version bump needed" && exit 0

for f in "$ACTIVE"/*.md; do
  [ "$f" = "$LAST" ] && continue
  mv "$f" "$ARCHIVE/"
done

echo "Version bump completed for $DOMAIN"
