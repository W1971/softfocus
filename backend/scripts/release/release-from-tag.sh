#!/usr/bin/env bash
set -euo pipefail

TAG="$(git describe --tags --exact-match 2>/dev/null || true)"

[ -n "$TAG" ] || { echo "BLOCKED: Release must be run from a git tag"; exit 1; }

echo "Release authorized from tag: $TAG"

echo "RELEASE OK"
