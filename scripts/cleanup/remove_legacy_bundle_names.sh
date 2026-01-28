#!/usr/bin/env bash
set -euo pipefail

echo "[INFO] Removing legacy bundle files without 'v' prefix"

find artifacts/bundles \
  -type f \
  -name 'project_bundle_[0-9]*_[0-9][0-9][0-9][0-9]-*.md' \
  ! -name 'project_bundle_v*.md' \
  -print -delete

echo "[OK] Legacy bundle files removed"
