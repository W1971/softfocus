# SoftFocus — Phase C-5: Failure Modes & Safe Defaults

Version: v1.0  
Status: ACTIVE  
Phase: C  
Step: 5  
Audience: Maintainers, auditors

---

## Purpose

This document defines **failure modes and safe default behaviors**
for the paid access layer in SoftFocus.

It ensures system stability and meaning preservation
under partial or total failure conditions.

---

## Core Invariant

No failure in the paid layer may:
- alter assessment execution;
- alter scoring or classification;
- alter base result delivery or meaning.

---

## Identified Failure Modes

### F1 — Enforcement Unavailable

Description:
- Enforcement component is unreachable or crashes.

Default Behavior:
- Class 0 resources: ALLOW
- Paid resources: DENY

---

### F2 — Access Class Resolution Failure

Description:
- User access class cannot be determined.

Default Behavior:
- Treat user as Class 0.

---

### F3 — Resource Classification Missing

Description:
- Requested resource lacks a declared required access class.

Default Behavior:
- Treat resource as Class 0.

---

### F4 — Logging Failure

Description:
- Audit log write fails.

Default Behavior:
- Enforcement decision proceeds;
- Failure must be detectable by governance checks.

---

### F5 — Version Mismatch

Description:
- Enforcement or logging version does not match declared governance version.

Default Behavior:
- DENY paid resources;
- ALLOW Class 0 resources.

---

## Prohibited Fallbacks

The system must never:
- escalate user access;
- infer intent;
- substitute alternative content;
- retry with relaxed rules.

---

## Determinism Requirement

For any failure mode:
- the same failure state must produce the same outcome;
- no probabilistic or heuristic behavior is allowed.

---

## Isolation Requirement

Failure handling must be:
- contained within the paid layer;
- removable without affecting core logic;
- independently testable.

---

## Governance Constraints

- Failure modes are binding for Phase C.
- New failure classes require a new Phase C step.
- Undeclared fallback behavior is forbidden.

---

## Auditability

Each failure-triggered decision must be:
- traceable to a failure mode defined here;
- reproducible under audit conditions.

---

## Final Statement

Phase C-5 defines **how SoftFocus behaves when things go wrong**
without compromising **what SoftFocus means**.

