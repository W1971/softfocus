# SoftFocus — Overview, Architecture & Product Plan  
**(Operational Update & Maintenance Roadmap)**

**Version:** v1.5.0  
**Status:** OPERATIONAL (Phase D — Maintenance Mode)  
**Mode:** governance-aware, product-first, deterministic

---

## 0. Current Snapshot (Now)

**As of today:**

- Recovery Scoring v1 — **frozen**
- Frontend calculators — **build PASS**
- Governance pipeline — **deterministic**
- Phase D lock — **active**
- System is **operational and governed**

SoftFocus has transitioned from implementation to **stable operation**.

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
**Status:** OPERATIONAL, STABLE

- Deterministic  
- Behavior- and pattern-based  
- Canonical terminology enforced  
- Standalone analytical value without payment  

Assessments remain the **primary analytical entry point**.

#### Assessment Instrumentation (Clarification; no new meaning)
Assessments may be implemented as **role-aware question sets** to improve signal capture
without changing interpretation semantics.

- QuestionSets: 40–60 вопросов на роль (типовой объём), в 5 канонических секциях:
  - latency / residual / compensation / predictability / detachment
- QuestionSets do **not** contain scoring or interpretation.
- Aggregation produces the same section-level signal shape (0–3 per section),
  which is then interpreted by canonical recovery logic.

Reference artifacts (non-canonical to meaning):
- `app/shared/questionSets/**` — question pools
- `docs/assessments/contracts/QUESTION_SET_CONTRACT.md` — format contract

---

### 2.2 Calculators (`/kalkulyatory`)
**Status:** OPERATIONAL, FROZEN (Recovery Calculator v1)

- Sleep, recovery, compensation  
- Deterministic scoring  
- Explainable, non-adaptive interpretation  

The **Recovery Calculator v1** is formally frozen under governance and is the
**primary monetizable analytical artifact** in v1.x.

#### Result Contract (Clarification; no new meaning)
Calculator output may be represented via a stable, deterministic **Result Contract**
to ensure identical interpretation across runtimes (web/mobile) without changing scoring.

- Contract is descriptive and non-clinical.
- Entitlement affects **depth only** (no UI monetization messaging).
- Canonical meaning remains owned by Recovery Scoring v1.

Reference artifacts (non-canonical to meaning):
- `app/shared/contracts/result.contract.schema.json` — schema
- `scripts/cli/runProAssessment.cjs` — local contract builder/validator (dev tooling only)

---

### 2.3 Guides (`/guides`)
**Status:** LIMITED, READ-ONLY

- Analytical explanations  
- Mechanism-focused  
- SEO-oriented  
- Reduced strictness (WARN-level)  

Guides **do not define logic** and never override product interpretation.

---

### 2.4 Blog (`/blog`)
**Status:** OPTIONAL / DISABLED

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

Any modification requires a new phase declaration (v2.x).

---

## 4. Governance Layer (Operational)

Governance is **operational infrastructure**.

### 4.1 Content Validator

The `content-validator` enforces:

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

## 6. Product Entitlement Model

Paid products are delivered as **entitlements**, not files.

An entitlement is valid only when:

1. Delivery script executes  
2. An audit event is written (`run.jsonl`)  
3. Severity = PASS  
4. No manual override  

This ensures auditable delivery and low operational overhead.

---

## 7. Phase D — Maintenance & Operation

**Phase D is active. Product meaning is frozen.**

Allowed actions:
- operational deployment
- distribution via approved channels
- mobile store submission
- bug fixes without semantic impact
- documentation clarification only

Forbidden actions:
- new features
- new UX flows
- new analytical axes
- SEO expansion
- monetization experiments / UI

Leaving Phase D requires:
- new phase declaration
- new bundle contract
- new version line (v2.x)

---

## 8. Maintenance Roadmap (Phase D)

Goals:
- stability
- auditability
- cost control
- controlled distribution

Allowed actions:
- dependency/security updates
- operational fixes
- documentation clarification
- mobile packaging and store submission

No expansion work is permitted in v1.x.

---

## Project Phase Status

- Current phase: **Phase D**
- Mode: **Maintenance**
- Mutability: **Frozen**

Phase D is formally closed for meaning changes.
All subsequent changes must comply with Maintenance Mode constraints.

## Runtime Compatibility (Mobile)

SoftFocus mobile runtime is validated against:
- Expo SDK 54
- React Native 0.81.x
- React 19.x
- Hermes (default)

This compatibility baseline is mandatory for:
- Expo Go (iOS / Android)
- development builds
- App Store / Play Store submission

Older Expo SDK versions are explicitly unsupported
due to Expo Go runtime constraints.
