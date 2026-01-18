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

echo "SoftFocus — Linear Stage Runner"

scripts/stages/stage-0-repo.sh
ask

scripts/stages/stage-1-assessment.sh
ask

scripts/stages/stage-a-protocol.sh

echo
echo "All configured stages completed successfully"
