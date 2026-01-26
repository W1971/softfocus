# RFC-PHASE-B-CONTRACT-TIGHTENING-v1

Title: Phase B Contract Tightening  
Author: SoftFocus Control Plane  
Status: ACCEPTED  
Version: v1.0  
Date: 2026-01-26  

---

## 1. Abstract

This RFC defines the transition from Phase A (observation) to Phase B (strict execution)
by tightening invocation contracts for core aliases.

---

## 2. Motivation

During Phase A, the system intentionally allowed:

- missing arguments
- missing environment variables
- partial execution success

Phase B requires deterministic, contract-complete execution.

---

## 3. Scope

This RFC applies to the following aliases:

- pipeline-check
- backend-check
- generate-status
- frontend-build

---

## 4. Contract Changes

### 4.1 pipeline-check

Current behavior (Phase A):
softfocus-stage.sh

Phase B requirement:
softfocus-stage.sh stage-a

Missing stage SHALL result in FAIL.

---

### 4.2 backend-check

Current behavior (Phase A):
full-governance-run.sh

Phase B requirement:
full-governance-run.sh base

Missing mode SHALL result in FAIL.

---

### 4.3 generate-status

Current behavior (Phase A):
generate-status

Phase B requirement:
generate-status <RUN_ID>

RUN_ID becomes mandatory.

---

### 4.4 frontend-build

Frontend build errors such as:
- missing imports
- broken paths

SHALL escalate from WARN to FAIL in Phase B.

---

## 5. Readiness Impact

After adoption:

- PASS_WITH_WARN is no longer sufficient
- READY requires clean execution
- CI gating becomes authoritative

---

## 6. Backward Compatibility

Phase A behavior remains valid for historical runs.
Phase B applies only after RFC acceptance.

---

## 7. Authority

This RFC is ACCEPTED and binding for Phase B execution.
