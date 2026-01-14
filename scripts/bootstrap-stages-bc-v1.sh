#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

mkdir -p "$ROOT_DIR/scripts/stages"

echo "SoftFocus — Bootstrap Stages B & C v1"

# -------------------------------------------------
# Stage B — Localization
# -------------------------------------------------
cat << 'STAGEB' > "$ROOT_DIR/scripts/stages/stage-b-localization.sh"
#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

echo "Running Stage B — Localization"

[ -d "$ROOT_DIR/docs/product/active" ] || { echo "BLOCKED: product active/ missing"; exit 1; }
[ -d "$ROOT_DIR/docs/product/archive" ] || { echo "BLOCKED: product archive/ missing"; exit 1; }

echo "OK: Filing system present"
echo "STAGE B PASSED"
STAGEB

chmod +x "$ROOT_DIR/scripts/stages/stage-b-localization.sh"

# -------------------------------------------------
# Stage C — Conversion Layer
# -------------------------------------------------
cat << 'STAGEC' > "$ROOT_DIR/scripts/stages/stage-c-conversion.sh"
#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

echo "Running Stage C — Conversion Layer"

[ -d "$ROOT_DIR/docs/seo/active" ] || { echo "BLOCKED: seo active/ missing"; exit 1; }
[ -d "$ROOT_DIR/docs/seo/archive" ] || { echo "BLOCKED: seo archive/ missing"; exit 1; }

echo "OK: SEO filing present"
echo "STAGE C PASSED"
STAGEC

chmod +x "$ROOT_DIR/scripts/stages/stage-c-conversion.sh"

# -------------------------------------------------
# Linear Runner v3
# -------------------------------------------------
cat << 'RUNNER' > "$ROOT_DIR/scripts/stage-runner-linear-v3.sh"
#!/usr/bin/env bash
set -euo pipefail

ask() {
  echo
  read -r -p "Proceed to next stage? (yes/no): " answer
  case "$answer" in
    yes|YES|y|Y) return 0 ;;
    *) echo "Execution stopped by user"; exit 0 ;;
  esac
}

echo "SoftFocus — Linear Stage Runner v3"

scripts/stages/stage-0-repo.sh
ask

scripts/stages/stage-1-assessment.sh
ask

scripts/stages/stage-a-protocol.sh
ask

scripts/stages/stage-b-localization.sh
ask

scripts/stages/stage-c-conversion.sh

echo
echo "ALL STAGES COMPLETED"
RUNNER

chmod +x "$ROOT_DIR/scripts/stage-runner-linear-v3.sh"

echo "Bootstrap Stages B & C completed"
