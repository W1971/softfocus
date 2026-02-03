---
type: governance-rule
scope: ci
status: canonical
mutability: restricted
version: v1.0
---

Last updated: Feb 02, 2026 — 15:20 UTC

# CI Authority Resolution Rule

RULE-01  
CI scripts MUST reference ONLY documents listed in
CONTROL_AUTHORITY_INDEX.md (Section I or II).

RULE-02  
CI MUST ignore:
- phase records
- architecture notes
- historical freezes
- reference docs

RULE-03  
If CI logic depends on a document
not listed in the Authority Index:
→ CI FAIL

RULE-04  
CI checklists evaluate STATE, not INTENT.

