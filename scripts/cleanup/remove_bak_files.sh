#!/usr/bin/env bash
set -euo pipefail

echo "[INFO] Removing .bak files from frontend"

find frontend -type f -name "*.bak" -print -delete

echo "[OK] .bak files removed"
