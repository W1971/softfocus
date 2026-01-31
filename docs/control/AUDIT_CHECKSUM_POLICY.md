---
type: product-governance
scope: audit
mutability: frozen (v1.x)
---

# Audit Checksum Policy

All audit artifacts must include:

- a checksum of the referenced checklist or contract
- computed at audit time
- validated by CI

If checksum mismatch is detected,
the audit is invalid.

No exceptions in v1.x.
