# Alias Security Contract — SoftFocus

## Purpose

This document defines mandatory security and governance requirements
for all `alias-softfocus` executable aliases.

Aliases are not convenience shortcuts.
They are **operational contracts**.

---

## Mandatory Requirements

Every executable alias MUST:

### 1. Safe shell mode
```bash
set -euo pipefail
2. Deterministic path resolution
Must resolve its own base directory using BASH_SOURCE.
3. Status gating
Must respect derived_state produced by generate-status.
FAIL → execution forbidden
No silent overrides
4. Explicit scope declaration
Alias must print its scope on execution, e.g.:
[ALIAS] project-clean (maintenance, destructive)
5. DRY_RUN support
Alias must support DRY_RUN=1.
6. Audit trail (if destructive)
Aliases that modify state MUST emit an audit log entry.
Forbidden Patterns
Double execution of the same script
Relative paths without base resolution
Silent destructive behavior
Implicit execution without logs
Enforcement
Violations result in:
alias rejection
CI failure (Phase C+)
governance review
