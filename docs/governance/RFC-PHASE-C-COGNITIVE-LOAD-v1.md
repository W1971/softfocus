# RFC — Phase C Analytical Axis: Cognitive Load

RFC ID: RFC-PHASE-C-COGNITIVE-LOAD-v1  
Status: DRAFT  
Author: <name>  
Date: 2026-01-26

---

## 1. Purpose

This RFC proposes **Cognitive Load** as a candidate analytical axis
for Phase C of SoftFocus.

This document is **definition- and boundary-only**.
No executable logic is authorized by this RFC.

---

## 2. Scope Definition

The Cognitive Load axis aims to analyze:

- sustained mental effort
- task-switching overhead
- decision density
- attention fragmentation

This axis is conceptually distinct from:

- burnout states
- recovery capacity
- compensation mechanisms

---

## 3. Explicit Non-Goals

The Cognitive Load axis MUST NOT:

- diagnose medical or psychological conditions
- infer recovery, burnout, or compensation scores
- reuse or extend Recovery Scoring v1
- act as an input to any v1 calculator

---

## 4. Relationship to v1

- No shared scoring logic
- No shared normalization scales
- No shared result interpretation
- No backward inference into v1 outputs

v1 and Cognitive Load may coexist
but never co-evolve.

---

## 5. Risks

| Risk | Mitigation |
|----|----|
| Semantic overlap with burnout | Strict vocabulary separation |
| User misinterpretation | Versioned copy and framing |
| Accidental coupling | Separate namespace and CI guards |

---

## 6. Status

DRAFT.

This RFC does not authorize implementation.
It exists to anchor Phase C design discussions.
