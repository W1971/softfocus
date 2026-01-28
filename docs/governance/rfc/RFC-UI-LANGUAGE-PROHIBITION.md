# RFC: UI Language Prohibition Policy

**RFC ID:** RFC-UI-LANGUAGE-PROHIBITION  
**Status:** DRAFT  
**Applies To:** SoftFocus v1.x (Phase C)  
**Author:** SoftFocus Governance  
**Created:** YYYY-MM-DD  
**Reviewers:** Governance Council  
**Severity:** FAIL (violation blocks CI and release)

---

## 1. Purpose

This RFC defines a **hard prohibition** on interpretive, advisory,
or meta-descriptive language in all UI-facing zones of SoftFocus.

The goal is to:
- preserve semantic neutrality
- prevent implicit guidance
- enforce UI as a projection layer only

This policy is **protective**, not explanatory.

---

## 2. Scope

This RFC applies to all UI-facing content, including but not limited to:

- frontend/components/
- frontend/adapters/
- frontend/mobile/
- frontend/content/calculators/
- any text rendered adjacent to results or scores

This RFC does **not** apply to:
- docs/
- guides/
- product documentation
- SEO content

---

## 3. Core Rule (Normative)

> **UI MUST NOT explain, interpret, qualify, negate, or advise.**

UI is restricted to **describing what is measured**, and nothing more.

---

## 4. Explicitly Forbidden Language Classes

The following are **strictly prohibited** in UI zones,
including in negative or disclaiming form:

### 4.1 Advisory Language
Examples (non-exhaustive):
- «стоит»
- «следует»
- «нужно»
- «рекомендуется»
- «полезно»

---

### 4.2 Clinical and Medical Framing
Including any mention of:
- диагноз
- терапия
- лечение
- медицинский
- психологический

This includes phrases such as:
- «не является диагнозом»
- «не является лечением»

Negation does **not** make such language acceptable.

---

### 4.3 Interpretive or Explanatory Framing
Including:
- «это означает»
- «это говорит о»
- «указывает на»
- «следует рассматривать как»

---

### 4.4 Value Judgement and Polarity
Including:
- «хороший / плохой»
- «низкий / высокий»
- «нормальный / ненормальный»

when applied to results, scores, or states.

---

## 5. Allowed UI Language (Strictly Limited)

The UI may contain **only neutral descriptive statements**
about what is measured.

### Allowed example (canonical):

> «Результат отражает текущую способность к восстановлению  
> в условиях длительной когнитивной нагрузки.»

Constraints:
- no advice
- no negation
- no framing
- no implication of action or norm

---

## 6. Rationale (Non-Normative)

- UI is the highest-risk surface for semantic drift
- Even protective disclaimers introduce interpretation
- Users infer meaning from UI placement, not intent

Therefore:
- **absence of language is safer than “helpful” language**
- explanation belongs outside the UI

---

## 7. Enforcement

Violations of this RFC result in:

- severity: FAIL
- CI block
- release block

Detection is enforced via:
- `run_external_audit.sh`
- UI-zone language scans

No manual override is permitted.

---

## 8. Relationship to Other RFCs

This RFC:
- complements `RFC-PHASE-C-MAINTENANCE`
- refines UI constraints under Phase C
- does not alter analytical logic

In case of conflict:
- stricter rule applies

---

## 9. Exit Conditions

This RFC remains in force until:
- SoftFocus v1 is sunset
- or a v2 UI/interpretation model is formally approved

---

## Summary

UI in SoftFocus is a **projection surface**, not an interpretive layer.

Any language that attempts to help, reassure, explain,
or guide the user is considered unsafe and prohibited.

