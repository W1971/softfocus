#!/usr/bin/env bash
set -euo pipefail

echo "Starting SoftFocus release process"

bash scripts/release/check-git-tag.sh
bash scripts/deploy/deploy-check-preflight.sh
bash scripts/deploy/deploy-check-production.sh
bash scripts/release/env-snapshot.sh

echo "Release gates passed"
echo "Proceed with production deployment"
