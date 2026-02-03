---
type: control
scope: ci
status: canonical
phase: phase-d
---

# Frontend CI Execution Model

Frontend CI executes in strict order:

1. Gates (alias, status, cleanliness)
2. Mobile governance (FAIL-FAST)
3. Build (npm test + build)
4. Post-build guards (ShellCheck)

If any step fails:
- execution stops
- build is blocked
- release is blocked

No step may be reordered.

