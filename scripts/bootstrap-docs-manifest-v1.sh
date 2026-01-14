#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

mkdir -p "$ROOT_DIR/docs"

cat << 'MANIFEST' > "$ROOT_DIR/docs/docs-manifest.json"
{
  "domains": [
    "product",
    "roadmap",
    "seo",
    "architecture"
  ],
  "structure": {
    "active": "authoritative",
    "archive": "historical"
  },
  "rules": {
    "single_active_version": true,
    "no_inplace_editing": true,
    "versioned_filenames": true
  }
}
MANIFEST

echo "Docs manifest created"
