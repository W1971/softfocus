# SoftFocus — Scripts Re-Explanation (Internal)

Version: v1.0  
Status: LOCKED  
Audience: Maintainers, Auditors  
Phase: D → E (Closed)

---

## Purpose

This document explains why each script exists, what risk it prevents,
and how scripts collectively enforce readiness.

Scripts are not helpers.
They are governance and safety mechanisms.

No checklist exists outside the scripts.
Readiness is proven only by successful linear execution.

---

## Core Principle: Linear Enforcement

SoftFocus uses a linear script chain.

Each script:
- assumes previous scripts have passed,
- validates its own invariants,
- BLOCKs immediately on violation.

If any script fails:
- execution stops,
- tagging is forbidden,
- Phase transition is blocked.

There is no manual override.

---

## Canonical Execution Order

```text
archive.sh
   ↓
content-validator.js
   ↓
audience-coverage.js
   ↓
ready-gate.sh
   ↓
TAG ALLOWED
Phase D → E Closure
With this linear chain enforced:
no script can be skipped,
no tag can be created accidentally,
readiness is a system property.
Phase D is CLOSED.
Phase E is ACTIVE.
