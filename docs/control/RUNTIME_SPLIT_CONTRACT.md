---
type: runtime-contract
scope: web+mobile
mutability: frozen
---

# Runtime Split Contract

## app/web
- Web-only UX
- Long-form text allowed
- Interpretation allowed
- Return & exploration allowed

## app/mobile
- Orientation-only
- No explanation flows
- Exit = success
- One mental operation per screen

## app/shared
- No JSX
- No UX assumptions
- Logic, contracts, copy only

Violations are CI-blocking.
