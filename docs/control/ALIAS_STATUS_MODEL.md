# Alias Status Model

Statuses:
- READY: may execute, counted in generate-status
- DESIGN_ONLY: visible, non-executable for implementation
- LOCKED: visible, execution forbidden
- FAIL: blocks pipeline

Rules:
- v2-design-check must be READY
- If FAIL → overall status = FAIL
