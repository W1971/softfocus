#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

mkdir -p "$ROOT_DIR/.github/workflows"

echo "SoftFocus — Bootstrap CI v1"

cat << 'CI' > "$ROOT_DIR/.github/workflows/softfocus-gate.yml"
name: SoftFocus Gates

on:
  push:
    branches: [ main ]
  pull_request:

jobs:
  validate:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: 20

      - run: npm ci

      - run: npm run content:lint

      - run: npm run build

      - run: ./scripts/stages/stage-0-repo.sh
      - run: ./scripts/stages/stage-1-assessment.sh
      - run: ./scripts/stages/stage-a-protocol.sh
      - run: ./scripts/stages/stage-b-localization.sh
      - run: ./scripts/stages/stage-c-conversion.sh
CI

echo "CI bootstrap completed"
