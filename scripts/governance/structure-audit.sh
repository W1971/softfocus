#!/usr/bin/env bash
set -e

RESULT="PASS"

FORBIDDEN_DIRS=(".wip" ".tmp" ".backup" "scratch" "logs")

for dir in "${FORBIDDEN_DIRS[@]}"; do
  if [ -d "$dir" ]; then
    RESULT="FAIL"
  fi
done

echo "audit_result=${RESULT}"
