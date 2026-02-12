---
type: runtime-contract
scope: global
mutability: frozen
---

# Runtime Split Contract

This document defines mandatory runtime separation.

---

## Application Structure

- app/web/**
  Governed by docs/web/**  
  Primary surface for **understanding (Layer A)**

- app/mobile/**
  Governed by docs/mobile/**  
  Primary surface for **embodiment and confirmation (Layers B & C)**

- app/shared/**
  Governed by docs/product/**  
  Shared analytical logic only (no UI)

---

## Rules

- No cross-scope imports
- No shared UI components between web and mobile
- Shared logic allowed only in app/shared

Violations invalidate the build.


## Runtime Separation (v1 / v2)

SoftFocus now operates as two isolated runtimes:

v1.x (operational):
- Recovery axis
- Deterministic scoring
- Phase D lock active

v2.x (isolated exploration):
- Cognitive axis
- Non-executable
- Phase C structural freeze

No scoring, logic, or UI semantics may be shared
between these runtimes.

Any cross-axis coupling is a governance violation.

