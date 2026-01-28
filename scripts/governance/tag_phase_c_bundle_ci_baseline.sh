#!/usr/bin/env bash
set -euo pipefail

TAG="phase-c-bundle-ci-baseline"

# Ensure working tree is clean
if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "[FAIL] Working tree is not clean. Commit changes before tagging."
  exit 20
fi

# Create annotated tag
git tag -a "$TAG" -m "Phase C bundle CI baseline: mandatory bundle + latest.md"

echo "[OK] Tag created: $TAG"
git show "$TAG" --no-patch
