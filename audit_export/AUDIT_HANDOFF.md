# SoftFocus — Audit Handoff (Phase C)

**Scope:** SoftFocus v1.x, Phase C (Maintenance)  
**Baseline Tag:** `phase-c-clean-baseline`  
**Mode:** non-clinical, deterministic, governance-enforced

---

## 1. Purpose

This document is the **single handoff entry** for external or internal auditors.

It defines:
- what SoftFocus is and is not
- where canonical meaning lives
- how to run a deterministic audit
- what constitutes PASS / WARN / FAIL

---

## 2. System Definition (Non-Clinical)

SoftFocus is a multilingual analytical system focused on:
- sustained cognitive load
- early burnout risk signals
- recovery capacity degradation
- compensation patterns

SoftFocus is explicitly **non-clinical**:
- no diagnosis
- no therapy
- no medical claims
- no recommendations, norms, or behavioral prompts

---

## 3. Canonical Precedence Model

### 3.1 Canonical Entry (Level 0)
- `docs/overview.md`

If any document conflicts with `docs/overview.md`, it is invalid.

---

### 3.2 Canonical Interpretation Layer
- `docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md`

SEO or guide content may introduce questions  
but **must not define meaning**.

---

### 3.3 Documentation Hierarchy
- `docs/PROJECT_DOCS_HIERARCHY.md`

Defines override and precedence rules.

---

## 4. Audit Entry Point (Generated)

Auditors must start with the generated bundle:

- `artifacts/bundles/latest.md`

Properties:
- generated automatically
- timestamped (UTC)
- includes git metadata
- includes SHA256 checksum
- protected from manual PR edits

---

## 5. How to Run the Audit

### 5.1 External Audit Script

scripts/audit/run_external_audit.sh
**Exit codes:**

*   0 — PASS (no violations)
    
*   10 — CONDITIONAL (WARN only, accepted in Phase C)
    
*   20 — FAIL (governance or semantic violation)
    

### 5.2 Pre-Audit Cleanup (Required)

 `

Removes backup or temporary files that may pollute audit scans.

6\. Failure Conditions (FAIL)
-----------------------------

A FAIL indicates violation of Phase C governance.

Typical FAIL classes:

*   interpretive or advisory language in UI zones
    
*   clinical framing in UI zones (including disclaimers)
    
*   value judgement applied to results or scores in UI zones
    
*   missing required canonical documents
    
*   manual edits of generated audit artifacts in PRs (CI guard violation)
    

7\. Accepted Warnings (WARN)
----------------------------

WARN signals **review attention** but does not block Phase C.

Accepted WARN class:

*   value-judgement terminology in SEO or guide content (non-UI), provided:
    
    *   it does not redefine canonical meaning
        
    *   it does not appear in UI zones
        
    *   canonical explanations remain authoritative
        

8\. Governance Controls
-----------------------

### 8.1 UI Language Prohibition

*   docs/governance/rfc/RFC-UI-LANGUAGE-PROHIBITION.md
    

UI is **projection-only**.No advice, no disclaimers, no interpretation.

### 8.2 Bundle Naming Invariant

*   docs/governance/rfc/RFC-BUNDLE-NAMING-INVARIANT.md
    

All bundles must follow:

 

### 8.3 Phase C Maintenance Rules

*   docs/governance/rfc/RFC-PHASE-C-MAINTENANCE.md
    

Defines allowed vs forbidden change classes.

9\. Baseline Reference
----------------------

Authoritative baseline:

*   phase-c-clean-baseline
    

All audits should compare against this tag.

10\. Integrity Verification (Optional)
--------------------------------------

To verify bundle integrity:



The computed hash must match the SHA256: value in the bundle header.

Summary
-------

SoftFocus Phase C is a governed, deterministic analytical system.

Audit relies on:

*   canonical precedence
    
*   RFC-driven constraints
    
*   deterministic scripts and CI guards
    
*   a single generated audit entry (latest.md)
    

