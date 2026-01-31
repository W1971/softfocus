#!/usr/bin/env bash
set -e

STAGE="$1"
AUDIT_FILE="$2"

[ -f "$AUDIT_FILE" ] || {
  echo "AUDIT FILE MISSING for $STAGE"
  exit 1
}

RESULT=$(grep '^result:' "$AUDIT_FILE" | awk '{print $2}')
COMMIT=$(grep '^commit:' "$AUDIT_FILE" | awk '{print $2}')
CHECKLIST=$(grep '^ *path:' "$AUDIT_FILE" | awk '{print $2}')
EXPECTED=$(grep '^ *checksum:' "$AUDIT_FILE" | awk '{print $2}')
ACTUAL=$(sha256sum "$CHECKLIST" | awk '{print $1}')
HEAD=$(git rev-parse HEAD)

[ "$RESULT" = "PASS" ] || { echo "$STAGE RESULT != PASS"; exit 1; }
[ "$COMMIT" = "$HEAD" ] || { echo "$STAGE COMMIT MISMATCH"; exit 1; }
[ "$EXPECTED" = "$ACTUAL" ] || { echo "$STAGE CHECKLIST CHANGED"; exit 1; }

echo "$STAGE GATE: PASS"
