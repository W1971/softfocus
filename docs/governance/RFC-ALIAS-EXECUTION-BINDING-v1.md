# RFC-ALIAS-EXECUTION-BINDING-v1

Title: Alias Execution Binding Layer  
Author: SoftFocus Control Plane  
Status: ACCEPTED  
Version: v1.0  
Date: 2026-01-25  

---

## 1. Abstract

This RFC introduces a mandatory execution-binding layer between alias-softfocus
and executable scripts.

Aliases SHALL NOT execute hardcoded or implicit paths.
All execution MUST be resolved through the canonical alias registry.

---

## 2. Motivation

Previously, alias-softfocus relied on legacy hardcoded paths (e.g. scripts/*),
which caused divergence between documentation and execution behavior.

This RFC formalizes execution binding as a first-class control-plane concern.

---

## 3. Design Goals

- Single source of truth (`ALIASES.yaml`)
- Explicit execution permissions
- Deterministic alias resolution
- Auditable execution evidence
- No silent fallback to legacy behavior

---

## 4. Execution Model

For any alias execution:

1. Resolve alias definition from `ALIASES.yaml`
2. Enforce execution permissions (`ALLOWED | RESTRICTED | FORBIDDEN`)
3. Execute declared scripts and/or CI gates
4. Capture execution result
5. Write execution evidence
6. Allow `generate-status` to derive readiness

---

## 5. Forbidden Behavior

- Hardcoded execution paths
- Implicit script discovery
- Execution of DESIGN_ONLY aliases
- Status elevation without execution evidence

---

## 6. Consequences

After adoption:

- Alias readiness reflects real execution
- READY status becomes provable
- FORCE bypasses gating, not registry rules
- Control-plane integrity is preserved

---

## 7. Status

This RFC is ACCEPTED and REQUIRED for SoftFocus v1 operation.
