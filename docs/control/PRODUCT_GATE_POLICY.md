# Product Gate Policy

## Status
ACTIVE

## Rule

product-gate is a thin wrapper.

It MUST:
- call alias commands
- fail on alias FAIL
- pass on READY or LOW_CONFIDENCE (unless strict mode)

It MUST NOT:
- parse validator output
- interpret content semantics
- run fix scripts
- contain business logic

## Rationale

All meaning and severity decisions belong to:
- content validators (signal production)
- alias interpreters (status derivation)

CI is execution-only.

Violation of this policy is a governance failure.
