#!/usr/bin/env bash
set -euo pipefail

echo "[DOCS] Checking active documentation scope"

ALLOWED_PREFIXES=(
  "docs/overview.md"
  "docs/PROJECT_DOCS_HIERARCHY.md"
  "docs/PROJECT_DOCUMENTATION_OVERVIEW.md"

  "docs/control/"
  "docs/governance/"
  "docs/frontend/"
  "docs/product/"
  "docs/seo/"
  "docs/guides/"
  "docs/mobile/"
  "docs/metrics/"
  "docs/operations/"
  "docs/engineering/"
  "docs/release/"
)

violations=0

while IFS= read -r file; do
  allowed=0
  for prefix in "${ALLOWED_PREFIXES[@]}"; do
    if [[ "$file" == "$prefix"* ]]; then
      allowed=1
      break
    fi
  done

  if [ "$allowed" -eq 0 ]; then
    echo "[VIOLATION] Non-active document tracked: $file"
    violations=1
  fi
done < <(git ls-files docs | grep -v '^archive/')

if [ "$violations" -eq 1 ]; then
  echo "[DOCS] FAILED: non-active docs present in active scope"
  exit 1
fi

echo "[DOCS] Active documentation scope OK"
