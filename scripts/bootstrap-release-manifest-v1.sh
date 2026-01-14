#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

mkdir -p "$ROOT_DIR/docs/release"

cat << 'MANIFEST' > "$ROOT_DIR/docs/release/RELEASE_MANIFEST.json"
{
  "release_policy": {
    "source": "git_tag_only",
    "allowed_branches": [],
    "forbidden_sources": ["main", "head", "latest"]
  },
  "requirements": {
    "all_stages_passed": true,
    "no_dirty_tree": true,
    "architecture_constraints_locked": true
  },
  "notes": "This file is declarative. It is not generated or modified by scripts."
}
MANIFEST

echo "RELEASE_MANIFEST.json created"
