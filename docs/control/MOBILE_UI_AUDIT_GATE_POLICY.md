---
type: product-governance
scope: mobile-ui
mutability: frozen (v1.x)
---

# Mobile UI Audit Gate Policy

## Enforcement

Mobile UI Audit Checklist is enforced via a GitHub Actions blocking gate.

Any change to:

- frontend/screens/mobile/**

requires:

- a PASS mobile UI audit artifact
- bound to the same git commit
- referencing the canonical checklist

No exceptions are permitted in v1.x.
