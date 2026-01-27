# SoftFocus — Overview, Architecture & Product Plan  
**(Operational Update & Forward Roadmap)**

**Version:** v1.4  
**Status:** ACTIVE (Operational, Phase B readiness achieved)  
**Mode:** governance-aware, product-first, deterministic

---

## 0. Current Snapshot (Now)

**As of today:**

- Recovery Scoring v1 — **frozen**
- Frontend calculators — **build PASS**
- Governance pipeline — **deterministic**
- Phase B readiness logic — **defined and enforced**
- System is **technically releasable**

SoftFocus has transitioned from *implementation* to **controlled operation**.

---

## 1. What SoftFocus Is

**SoftFocus** is a multilingual analytical platform  
(RU primary; EN / ES / AR planned) focused on:

- cognitive load under sustained effort  
- early burnout risk signals  
- recovery capacity degradation  
- compensation patterns that mask decline  

The project is **explicitly non-clinical**:

- no diagnosis  
- no therapy  
- no medical claims or norms  

SoftFocus is a **thinking and orientation system**.  
It is not a quiz, checklist, coaching flow, or motivational product.

---

## 2. Product Domains (Operational State)

SoftFocus is structured around **product-grade domains**, each with explicit governance severity.

### 2.1 Assessments (`/testy`)
**Status:** ACTIVE, STABLE

- Deterministic  
- Behavior- and pattern-based  
- Canonical terminology enforced  
- Standalone analytical value without payment  

Assessments remain the **primary analytical entry point**.

**Operational intent:**  
No changes during Phase B or Phase C without RFC approval.

---

### 2.2 Calculators (`/kalkulyatory`)
**Status:** ACTIVE, FROZEN (Recovery Calculator v1)

- Sleep, recovery, compensation  
- Inherit assessment-level strictness  
- Deterministic scoring  
- Explainable, non-adaptive interpretation  

The **Recovery Calculator v1** is formally frozen under governance and is the
**primary monetizable analytical artifact** in v1.x.

---

### 2.3 Guides (`/guides`)
**Status:** LIMITED

- Analytical explanations  
- Mechanism-focused  
- SEO-oriented  
- Reduced strictness (WARN-level)  

Guides **do not define logic** and never override product interpretation.

---

### 2.4 Blog (`/blog`)
**Status:** OPTIONAL / DEFERRED

- Contextual and SEO-only content  
- Lowest strictness tier  
- Never product-critical  

Can remain disabled without system impact.

---

## 3. Core Product Axis (Frozen)

All analytical products align to a single canonical axis:

**burnout → recovery capacity → compensation**

This axis is **frozen for all v1.x** and enforced through:

- content-validator rules  
- governance severity levels  
- CI and Release Gate checks  
- RFC-based change control  

Any modification requires a new RFC and version bump.

---

## 4. Governance Layer (Operational)

Governance is no longer experimental — it is **operational infrastructure**.

### 4.1 Content Validator

The `content-validator` is a **first-class architectural component**.

It enforces:

- non-clinical boundaries  
- canonical terminology  
- audience discipline  
- strict separation of product vs distribution content  

Severity model:

| Content Type | Canonical Missing |
|-------------|-------------------|
| assessment  | FAIL              |
| calculator  | FAIL              |
| guide/blog  | WARN              |

FAIL blocks CI and release.

---

### 4.2 Boundary-Aware Validation

Documents may reference clinical terminology **only** if:

- explicitly scoped as exclusionary  
- a non-clinical boundary is present  
- located in PRODUCT or PUBLIC zones  

Violations block CI and Release Gate.

---

## 5. Analytical Core: Recovery Scoring (v1)

### 5.1 Recovery Scoring v1
**Status:** FROZEN, RELEASE-SAFE

- Deterministic core implementation  
- Runtime-safe, non-frontend-owned logic  
- QA-covered with golden fixtures  
- Governed by RFC and checksum  

Artifacts:

- `scripts/core/recovery/scoreRecovery.cjs`  
- `tests/qa/runRecoveryQA.cjs`  
- `docs/governance/RFC-RECOVERY-SCORING-v1.md`  

This scoring model is the **single source of truth** for recovery analysis in v1.

---

### 5.2 Interpretation & UI

- Mobile: orientation-only, low-cognitive-load  
- Desktop: analytical detail, penalty breakdown  
- No adaptive logic  
- No behavior shaping  

UI is a **pure consumer** of the frozen scoring core.

---

## 6. Product Entitlement Model

### 6.1 Entitlements (Z-layer)

Paid products are delivered as **entitlements**, not files.

An entitlement is valid only when:

1. Delivery script executes  
2. An audit event is written (`run.jsonl`)  
3. Severity = PASS  
4. No manual override  

This ensures:

- auditable delivery  
- CI-verifiable monetization  
- low operational overhead  

---

## 7. Alias Control Plane

SoftFocus is operated via a **single control plane**: `alias-softfocus`.

Aliases expose:

- validation  
- readiness  
- delivery  
- governance state  

Statuses are derived automatically:

- READY  
- LOW_CONFIDENCE  
- FAIL  

Manual status setting is not permitted.

Phase B uses a **deterministic, blocking `generate-status`** as the
authoritative readiness signal.

---

## 8. Lifecycle Status (Updated)

### Phase A — Observation
**Status:** COMPLETE (historical, frozen)

- Recovery Scoring v1 frozen  
- Governance rules validated  
- No longer modifiable  

---

### Phase B — Controlled Expansion
**Status:** ACTIVE (current)

Phase B focuses on **surface expansion without logic risk**.

Constraints:

- no changes to scoring logic  
- no new analytical axes  
- no protocol modification  

---

## 9. Operational Roadmap

### Next 7 Days — Stabilization & Release

**Goals:**

- Declare **Operational Readiness v1**  
- Cut release tag (e.g. `v1.0.0-operational`)  
- Browser-level verification of calculators  
- Minimal production deployment  

**Actions:**

- Finalize `OPERATIONAL_READINESS.md`  
- Publish release notes  
- Light real-user testing (non-clinical framing)  
- No feature work  

---

### Next 1 Month — Phase B Expansion (Low Risk)

**Goals:**

- Increase reach without touching logic  
- Validate monetization assumptions  
- Observe user interpretation patterns  

**Actions:**

- EN language rollout (content-only)  
- SEO surface expansion (guides)  
- Role-based landing pages  
- Entitlement delivery dry-runs  
- No scoring or UI complexity changes  

---

### Next 3 Months — Phase C Preparation

**Goals:**

- Decide whether Phase C is justified  
- Accumulate operational evidence  
- Reduce unknowns before introducing new axes  

**Actions:**

- Traffic and conversion analysis  
- Governance friction analysis  
- Draft RFCs for:
  - potential new analytical axis  
  - independent calculators  

**Decision Gate:**  
If Phase C is not clearly justified, SoftFocus v1 continues as a **stable operational asset**.

---

## 10. Economic Model

Primary revenue:

- one-time digital analytical products ($15–30)

Secondary revenue:

- non-clinical affiliate tools

Advertising:

- only after ~50k monthly visitors  
- never core revenue  

---

## Summary

SoftFocus is now:

- a **governed analytical system**  
- with deterministic, frozen product logic  
- formal validation and release control  
- auditable monetization  
- minimal operational overhead  

The project is built and operated as a **long-term asset**,  
not as a content workflow or growth experiment.

---

## Operational Readiness

SoftFocus v1 transitions from implementation to operation only after formal declaration.

Operational readiness is defined by:

- `docs/control/OPERATIONAL_READINESS.md`

After declaration:

- product logic remains frozen  
- governance rules are stable  
- SoftFocus v1 is treated as an **operational asset**

This rule is mandatory and overrides informal interpretations.

Routing decisions (including the root route) are governed by
docs/control/ROOT_ROUTE_POLICY.md.
