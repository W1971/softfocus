---
type: release-chain
scope: mobile
status: canonical
phase: phase-d
mutability: frozen
last_verified_utc: 2026-02-03T00:00Z
---

# Mobile Release Chain
## Canonical Pass / Fail Sequence

This document defines the **single allowed sequence**
for releasing the SoftFocus mobile application
to Apple App Store and Google Play.

No step may be skipped.
No step may be reordered.
No step may be partially satisfied.

---

## Chain Overview (Linear)

```text
STEP 1 — Product Meaning Freeze
        ↓
STEP 2 — Store Positioning Validation
        ↓
STEP 3 — Technical Readiness
        ↓
STEP 4 — Privacy & Compliance
        ↓
STEP 5 — Store Submission

Release is permitted **only** if all steps PASS.

STEP 1 — Product Meaning Freeze (MANDATORY)
-------------------------------------------

### Purpose

Ensure that mobile product meaning is closed and stable.

### Source of Truth

*   docs/mobile/canonical/FINAL\_MOBILE\_SPEC.md
    
*   docs/mobile/control/MOBILE\_DOCS\_STATUS\_MAP.md
    

### PASS Criteria

*   FINAL\_MOBILE\_SPEC exists
    
*   No open semantic TODOs
    
*   Mobile docs are ordered and locked
    

### FAIL Means

Product meaning is not stable.

### NEXT ACTION ON FAIL

*   Fix documentation conflicts
    
*   Re-run mobile design alignment
    
*   Do NOT touch code
    

STEP 2 — Store Positioning Validation
-------------------------------------

### Purpose

Ensure store-facing description matches product behavior.

### Source of Truth

*   docs/mobile/store/STORE\_DESCRIPTION.md
    
*   docs/mobile/store/STORE\_SUMMARY.txt
    

### PASS Criteria

*   Description is non-clinical
    
*   No promises or recommendations
    
*   Matches actual app behavior
    

### FAIL Means

Risk of store rejection or misleading positioning.

### NEXT ACTION ON FAIL

*   Rewrite store copy
    
*   Re-validate against FINAL\_MOBILE\_SPEC
    

STEP 3 — Technical Readiness
----------------------------

### Purpose

Ensure the app is technically safe to submit.

### Source of Truth

*   docs/mobile/release/MOBILE\_TECH\_READINESS\_CHECKLIST.md
    

### PASS Criteria

*   All checklist items completed
    
*   App launches and reaches Result screen
    
*   No dead UI or crashes
    

### FAIL Means

App is not submission-safe.

### NEXT ACTION ON FAIL

*   Fix technical issues
    
*   Re-run this step only after fixes
    

STEP 4 — Privacy & Compliance
-----------------------------

### Purpose

Ensure legal and compliance safety.

### Source of Truth

*   docs/mobile/release/PRIVACY\_POLICY.md
    
*   docs/mobile/release/NON\_CLINICAL\_DISCLAIMER.md
    

### PASS Criteria

*   Privacy Policy accessible via URL
    
*   Non-clinical disclaimer present
    
*   No restricted permissions
    

### FAIL Means

High risk of store rejection.

### NEXT ACTION ON FAIL

*   Update policy documents
    
*   Remove offending permissions or language
    

STEP 5 — Store Submission
-------------------------

### Purpose

Upload binary and metadata to stores.

### Preconditions

*   STEPS 1–4 = PASS
    

### Output

*   TestFlight build (iOS)
    
*   Internal testing release (Android)
    

### This Step FAILS If

*   Any previous step was skipped
    
*   Store review feedback contradicts product meaning
    

Hard Rule
---------

If any STEP = FAIL:

*   The chain stops
    
*   No further steps may be executed
    
*   Fix must occur at the failing step
    

Final Authority
---------------

This chain overrides:

*   ad-hoc checklists
    
*   personal judgment
    
*   “almost ready” interpretations
    

Release is a **binary state**:PASS or NOT RELEASED.

