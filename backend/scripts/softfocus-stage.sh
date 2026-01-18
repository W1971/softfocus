#!/usr/bin/env bash
set -euo pipefail

STAGE="${1:-}"

fail() {
  echo "USAGE: softfocus-stage.sh <stage>"
  echo "Available stages:"
  echo "  stage-0"
  echo "  stage-1"
  echo "  stage-a"
  exit 1
}

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
    echo "NEXT ALLOWED: stage-b (localization)"
    ;;
  *)
    fail
    ;;
esac

