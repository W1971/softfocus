#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

echo "SoftFocus — Stage System Bootstrap v1"

mkdir -p "$ROOT_DIR/scripts/stages"

# -----------------------------
# Stage 0 — Repo Integrity
# -----------------------------
cat << 'STAGE0' > "$ROOT_DIR/scripts/stages/stage-0-repo.sh"
#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"
cd "$ROOT_DIR"

echo "Running Stage 0 — Repository Integrity"

git diff --quiet || { echo "BLOCKED: Git working tree not clean"; exit 1; }
echo "OK: Git working tree clean"

npm run content:lint >/dev/null 2>&1 || { echo "BLOCKED: Content validation failed"; exit 1; }
echo "OK: Content validation passed"

npm run build >/dev/null 2>&1 || { echo "BLOCKED: Build failed"; exit 1; }
echo "OK: Build passed"

[ -f "$ROOT_DIR/next.config.cjs" ] || { echo "BLOCKED: next.config.cjs missing"; exit 1; }
echo "OK: Next.js config present"

echo "STAGE 0 PASSED"
STAGE0

chmod +x "$ROOT_DIR/scripts/stages/stage-0-repo.sh"

# -----------------------------
# Stage 1 — Phase 1 Assessment
# -----------------------------
cat << 'STAGE1' > "$ROOT_DIR/scripts/stages/stage-1-assessment.sh"
#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"
FILE="$ROOT_DIR/docs/product/PHASE1_ASSESSMENT.md"

echo "Running Stage 1 — Phase 1 Assessment"

[ -f "$FILE" ] || { echo "BLOCKED: PHASE1_ASSESSMENT.md missing"; exit 1; }
echo "OK: Phase 1 document present"

grep -q "Status: LOCKED" "$FILE" || { echo "BLOCKED: Phase 1 not LOCKED"; exit 1; }
echo "OK: Phase 1 status LOCKED"

echo "STAGE 1 PASSED"
STAGE1

chmod +x "$ROOT_DIR/scripts/stages/stage-1-assessment.sh"

# -----------------------------
# Stage A — Structured Protocol
# -----------------------------
cat << 'STAGEA' > "$ROOT_DIR/scripts/stages/stage-a-protocol.sh"
#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

REQUIRED=(
  docs/product/PHASE_A_STRUCTURED_PROTOCOL.md
  docs/product/PHASE_A_PROTOCOL_BREAKDOWN.md
  docs/product/PHASE_A_PAID_BOUNDARY_COPY.md
  docs/product/PHASE_A_PROTOCOL_UX_FLOW.md
)

echo "Running Stage A — Structured Protocol"

for f in "${REQUIRED[@]}"; do
  [ -f "$ROOT_DIR/$f" ] || { echo "BLOCKED: Missing $f"; exit 1; }
  echo "OK: Found $f"
done

echo "STAGE A PASSED"
STAGEA

chmod +x "$ROOT_DIR/scripts/stages/stage-a-protocol.sh"

# -----------------------------
# Stage Runner
# -----------------------------
cat << 'RUNNER' > "$ROOT_DIR/scripts/softfocus-stage.sh"
#!/usr/bin/env bash
set -euo pipefail

STAGE="${1:-}"

case "$STAGE" in
  stage-0)
    scripts/stages/stage-0-repo.sh
    echo "NEXT ALLOWED: stage-1"
    ;;
  stage-1)
    scripts/stages/stage-1-assessment.sh
    echo "NEXT ALLOWED: stage-a"
    ;;
  stage-a)
    scripts/stages/stage-a-protocol.sh
    echo "NEXT ALLOWED: stage-b"
    ;;
  *)
    echo "USAGE: softfocus-stage.sh stage-0 | stage-1 | stage-a"
    exit 1
    ;;
esac
RUNNER

chmod +x "$ROOT_DIR/scripts/softfocus-stage.sh"

echo "Bootstrap completed successfully"
