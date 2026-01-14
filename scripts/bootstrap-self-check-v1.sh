#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

cat << 'CHECK' > "$ROOT_DIR/scripts/self-check.sh"
#!/usr/bin/env bash
set -euo pipefail

fail() {
  echo "SELF-CHECK FAILED: $1"
  exit 1
}

[ -d "docs/architecture/active" ] || fail "architecture/active missing"
[ -f "docs/architecture/active/01_ARCHITECTURE_CONSTRAINTS_v1.0.md" ] || fail "Architecture constraints missing"

[ -f "docs/docs-manifest.json" ] || fail "docs-manifest.json missing"
[ -f "docs/release/RELEASE_MANIFEST.json" ] || fail "RELEASE_MANIFEST.json missing"
[ -f "docs/audit/AUDIT_LOG.md" ] || fail "AUDIT_LOG.md missing"

[ -x "scripts/stage-runner-auto.sh" ] || fail "CI runner missing"
[ -x "scripts/stage-runner-linear.sh" ] || fail "Interactive runner missing"

echo "SELF-CHECK PASSED"
CHECK

chmod +x "$ROOT_DIR/scripts/self-check.sh"

echo "SELF_CHECK script created"
