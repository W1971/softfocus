#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

cat << 'RUNNER' > "$ROOT_DIR/scripts/stage-runner-auto.sh"
#!/usr/bin/env bash
set -euo pipefail

scripts/stages/stage-0-repo.sh
scripts/stages/stage-1-assessment.sh
scripts/stages/stage-a-protocol.sh
scripts/stages/stage-b-localization.sh
scripts/stages/stage-c-conversion.sh

echo "AUTO RUN COMPLETED SUCCESSFULLY"
RUNNER

chmod +x "$ROOT_DIR/scripts/stage-runner-auto.sh"

echo "CI runner created"
