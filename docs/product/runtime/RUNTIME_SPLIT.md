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

