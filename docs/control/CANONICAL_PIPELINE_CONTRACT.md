# Canonical Pipeline Contract

Status: ACTIVE  
Scope: CI / Alias execution  
Mutability: Restricted (v1.x locked)

This document defines the ONLY valid execution order
for the SoftFocus system.

Any deviation MUST fail CI.

---

## Canonical CORE Pipeline

Execution order is strictly linear:

1. project-clean  
2. content-validate  
3. pipeline-check  
4. backend-check  
5. frontend-build  
6. generate-status  
7. docs  

---

## Rules

- CORE steps MUST run in order
- Skipping a CORE step is forbidden
- OPTIONAL steps MAY run only after CORE completion
- EXPERIMENTAL steps MUST NOT run in CI
- Direct execution of downstream steps is prohibited

---

## Enforcement

CI MUST fail if:

- CORE steps are missing
- CORE steps are executed out of order
- frontend-build runs without pipeline-check
- legacy stage frameworks are used

---

## Rationale

SoftFocus requires linearity to preserve:
- interpretability
- design integrity
- non-clinical boundaries
- auditability

The pipeline is a law, not a convention.
