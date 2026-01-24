#!/usr/bin/env bash
set -euo pipefail

echo "== v2 Design-Only Gate =="

TARGET_DIR="docs/roadmap"
FORBIDDEN_REGEX="\\b(recommend|should|do this|next step|improve|optimize|action plan)\\b"

MATCHES=$(grep -R -i -E "$FORBIDDEN_REGEX" "$TARGET_DIR" || true)

if [[ -n "$MATCHES" ]]; then
  echo "ERROR: v2 design drift detected (action-oriented language)"
  echo "$MATCHES"
  exit 1
fi

echo "✔ v2 remains design-only and non-directive"
