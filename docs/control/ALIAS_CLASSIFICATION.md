# Alias Classification and Status Policy

## CORE
- Must be READY
- CI fails otherwise
- Local execution blocked unless READY

## OPTIONAL
- LOW_CONFIDENCE allowed
- CI warning only
- Local execution allowed with FORCE

## EXPERIMENTAL
- Status is informational
- Never blocks CI
- Execution always requires FORCE

## UNKNOWN status
- Treated as FAIL for CORE
- Treated as LOW_CONFIDENCE for OPTIONAL
- Allowed for EXPERIMENTAL
