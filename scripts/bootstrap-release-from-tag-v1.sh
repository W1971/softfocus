#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

mkdir -p "$ROOT_DIR/scripts/release"

cat << 'RELEASE' > "$ROOT_DIR/scripts/release/release-from-tag.sh"
#!/usr/bin/env bash
set -euo pipefail

TAG="$(git describe --tags --exact-match 2>/dev/null || true)"

[ -n "$TAG" ] || { echo "BLOCKED: Release must be run from a git tag"; exit 1; }

echo "Release authorized from tag: $TAG"

echo "RELEASE OK"
RELEASE

chmod +x "$ROOT_DIR/scripts/release/release-from-tag.sh"

echo "Bootstrap release-from-tag completed"
