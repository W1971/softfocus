#!/usr/bin/env bash
set -euo pipefail

DIR="artifacts/bundles"

latest="$DIR/latest.md"
prev="$(ls -1 "$DIR"/project_bundle_*.md 2>/dev/null | sort | tail -n 2 | head -n 1)"

if [ ! -f "$latest" ] || [ -z "${prev:-}" ]; then
  echo "[INFO] Not enough bundles to diff"
  exit 0
fi

echo "[INFO] Diff signal: $prev → latest.md"

if diff -u "$prev" "$latest" > "$DIR/bundle.diff"; then
  echo "[INFO] No differences detected"
else
  echo "[WARN] Differences detected between previous bundle and latest"
  echo "------- DIFF (truncated) -------"
  head -n 200 "$DIR/bundle.diff"
  echo "--------------------------------"
fi
