# CI Fix Script Policy

## Status
ACTIVE

## Rule

Scripts with prefix `fix-` MUST NOT be executed as part of CI,
product-gate, or alias execution.

## Rationale

Fix scripts:
- mutate content
- hide governance signals
- break auditability

They are permitted ONLY for:
- migrations
- one-time recovery
- manual operator intervention

## Enforcement

- CI pipelines MUST NOT call fix scripts
- product-gate MUST NOT reference fix scripts
- alias commands MUST remain read-only

Violation of this policy is a governance failure.
