# CI Alias Policy

CI must fail if any CORE alias has status != READY.

OPTIONAL aliases do not block CI but may emit warnings.

EXPERIMENTAL aliases are ignored by CI.

Status source:
alias_softfocus/status/*.status
