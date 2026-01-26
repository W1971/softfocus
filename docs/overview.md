# SoftFocus — Overview, Architecture & Product Plan

**Version:** v1.3  
**Status:** ACTIVE (Operational Transition)  
**Mode:** governance-aware, product-first, deterministic

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

## 2. Product Domains (Current State)

SoftFocus is structured around **product-grade domains**, each with explicit governance severity.

### 2.1 Assessments (`/testy`)

**Status:** ACTIVE (v1)

- Deterministic
- Behavior- and pattern-based
- Canonical terminology enforced
- Standalone analytical value without payment

Assessments are the **primary analytical entry point**.

---

### 2.2 Calculators (`/kalkulyatory`)

**Status:** ACTIVE (Recovery Calculator v1 frozen)

- Sleep, recovery, compensation
- Inherit assessment-level strictness
- Deterministic scoring
- Explainable, non-adaptive interpretation

The **Recovery Calculator** is the first calculator formally frozen under governance.

---

### 2.3 Guides (`/guides`)

**Status:** LIMITED (distribution layer)

- Analytical explanations
- Mechanism-focused
- SEO-oriented
- Reduced strictness (WARN-level)

Guides **do not define logic** and never override product interpretation.

---

### 2.4 Blog (`/blog`)

**Status:** OPTIONAL

- Contextual and SEO-only content
- Lowest strictness tier
- Never product-critical
- Can be disabled without system impact

---

## 3. Core Product Axis (Frozen)

All analytical products align to a single canonical axis:

**burnout → recovery capacity → compensation**

This axis is **frozen for v1** and enforced through:

- content-validator rules
- governance severity levels
- CI and Release Gate checks
- RFC-based change control

Any modification requires a new RFC and version bump.

---

## 4. Governance Layer (Mandatory, Active)

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
| calculator | FAIL              |
| guide/blog | WARN              |

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

### 5.1 Recovery Scoring v1 (Frozen)

**Status:** FROZEN, RELEASED

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

---

## 8. Current Lifecycle Stage

### Phase A — Operation & Observation (ACTIVE)

**Current state:**

- Recovery Scoring v1 frozen
- Release Gate passed
- Governance rules enforced
- Product logic locked

Goals:

- validate real-world stability
- observe search interpretation
- confirm entitlement-based monetization
- detect governance friction

No logic, scoring, or axis changes are permitted in Phase A.

---

## 9. Planned Lifecycle Progression

### Phase B — Minor Expansion (v1.x)

**Planned:**

- language expansion (EN → ES → AR)
- role-based distribution overlays
- SEO surface extension

Constraints:

- no changes to scoring logic
- no new analytical axes
- no protocol modification

---

### Phase C — Major Expansion (v2.x)

**Future (RFC-required):**

- introduction of a new analytical axis
- independent calculators and scoring
- separate protocol, same entitlement model

Existing axes remain frozen and supported.

---

## 10. Economic Model

Primary revenue:

- one-time digital products ($15–30)

Secondary revenue:

- non-clinical affiliate tools

Advertising:

- only after ~50k monthly visitors
- never core revenue

---

## Summary

SoftFocus is:

- a governed analytical system
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

Until readiness is declared:

- the system remains under observation
- no asset-level guarantees are assumed

After declaration:

- product logic remains frozen
- governance rules are stable
- SoftFocus v1 is treated as an operational asset

This rule is mandatory and overrides informal interpretations.
