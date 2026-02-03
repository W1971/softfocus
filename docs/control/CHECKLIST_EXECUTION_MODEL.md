---
type: governance-rule
scope: execution
status: canonical
mutability: restricted
version: v1.1
---

Last updated: Feb 02, 2026 — 13:40 UTC

# Checklist Execution Model (Canonical)

RULE-01  
All checklists MUST be executable bash scripts.

RULE-02  
Markdown, text, or UI checklists are INVALID and have no authority.

RULE-03  
Each checklist MUST execute linearly.

RULE-04  
Each check MUST return only:
- PASS (exit 0)
- FAIL (exit 1)

RULE-05  
On first FAIL:
- execution STOPS immediately
- next stage is FORBIDDEN

RULE-06  
Stage N+1 MAY execute ONLY IF Stage N exited with PASS.

RULE-07  
No WARN, NO SKIP, NO MANUAL OVERRIDE.

RULE-08  
All checklists MUST be executed ONLY via alias-softfocus.

RULE-09  
CI and human execution MUST use the SAME checklist script.

RULE-10  
Any deviation from these rules = GOVERNANCE FAIL.

