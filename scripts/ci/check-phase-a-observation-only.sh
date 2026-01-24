#!/usr/bin/env bash
set -euo pipefail

echo "== Phase A Observation-Only Gate =="

TARGET_DIR="docs/frontend"

# Forbidden action-oriented language (Phase A)
FORBIDDEN_REGEX="\\b(fix now|fix this|what to do|next step|do this|improve yourself)\\b"

# Explicitly allowed structural language
ALLOWED_REGEX="\\b(fixed framework|fixed methodology|structure is fixed|categories are fixed)\\b"

MATCHES=$(grep -R -i -E "$FORBIDDEN_REGEX" "$TARGET_DIR" || true)

if [[ -n "$MATCHES" ]]; then
  echo "ERROR: Forbidden Phase A language detected"
  echo "$MATCHES"
  exit 1
fi

echo "✔ Phase A observation-only constraints satisfied"
