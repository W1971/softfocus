#!/usr/bin/env bash
set -e

STAGE="$1"
AUDIT_FILE="$2"

fail() {
  echo ""
  echo "❌ $STAGE GATE FAILED"
  echo "$1"
  echo ""
  exit 1
}

[ -f "$AUDIT_FILE" ] || fail "AUDIT FILE MISSING
→ Expected audit file:
  $AUDIT_FILE

Create or restore the audit to proceed."

RESULT=$(grep '^result:' "$AUDIT_FILE" | awk '{print $2}')
COMMIT=$(grep '^commit:' "$AUDIT_FILE" | awk '{print $2}')
CHECKLIST=$(grep '^ *path:' "$AUDIT_FILE" | awk '{print $2}')
EXPECTED=$(grep '^ *checksum:' "$AUDIT_FILE" | awk '{print $2}')
ACTUAL=$(sha256sum "$CHECKLIST" | awk '{print $1}')
HEAD=$(git rev-parse HEAD)

[ "$RESULT" = "PASS" ] || fail "RESULT != PASS
→ This stage is not open yet.
→ Set result: PASS only after completing the audit."

[ "$COMMIT" = "$HEAD" ] || fail "COMMIT MISMATCH
→ Audit is bound to a different commit.

To fix:
1. git rev-parse HEAD
2. sha256sum $CHECKLIST
3. Reissue the audit file:
   $AUDIT_FILE
4. ./scripts/alias/alias-softfocus $STAGE"

[ "$EXPECTED" = "$ACTUAL" ] || fail "CHECKLIST CHANGED
→ Checklist content does not match recorded checksum.

To fix:
1. sha256sum $CHECKLIST
2. Update checksum in:
   $AUDIT_FILE
3. ./scripts/alias/alias-softfocus $STAGE"

echo "✅ $STAGE GATE: PASS"
