# SoftFocus — Canonical Execution Flow

Version: v1.0  
Status: CANONICAL  
Audience: Maintainers, CI systems, auditors

---

## Purpose

This document defines the **single, linear, canonical execution flow**
for all governance, validation, release, and deployment actions
within the SoftFocus repository.

No script may split this flow.
No script may bypass this flow.
No script may introduce branching outside explicit GO / BLOCK decisions.

This flow is **authoritative and exhaustive**.

---

## Canonical Flow (Linear)

```text
project-cleanup.sh
        ↓
structure-audit.sh
        ↓
structure-parity-check.sh
        ↓
user-content-guard.sh
        ↓
content validation & test scenarios
        ↓
verify-test-logs.sh
        ↓
READY classification
        ↓
release-audit-check.sh
        ↓
indexing-guard.sh
        ↓
DEPLOY or BLOCK
Transition Semantics
Each step in the flow represents one intact script
with one responsibility and one explicit outcome.
For every step:
IF condition satisfied → GO → next script
IF condition violated → BLOCK → stop execution
IF human decision required → DELEGATE → explicit decision point
Silent continuation is forbidden.
Cleanup Phase
Script: project-cleanup.sh
IF forbidden or obsolete artifacts are present → GO after archival
IF execution artifacts exist in repository → BLOCK
Structure Audit Phase
Script: structure-audit.sh
IF repository structure matches locked specification → GO
IF any forbidden directory or misplaced script exists → BLOCK
Localization Parity Phase
Script: structure-parity-check.sh
IF required locale counterparts exist → GO
IF any mandatory counterpart is missing → BLOCK
User Content Guard Phase
Script: user-content-guard.sh
IF no advisory or imperative language detected → GO
IF forbidden phrasing detected → BLOCK
Validation & Testing Phase
Components: content validators and test scenarios
IF all validations and tests pass → GO
IF any validation or test fails → BLOCK
Log Verification Phase
Script: verify-test-logs.sh
IF logs are complete, append-only, and well-formed → GO
IF logs are missing, malformed, or inconsistent → BLOCK
READY Classification Phase
Derived from: test logs
Possible outcomes:
READY FOR DEPLOY → GO
LOW RISK → DELEGATE (explicit human override)
STRUCTURAL FAIL → BLOCK
Release Audit Phase
Script: release-audit-check.sh
IF all mandatory release artifacts exist and match tag → GO
IF any artifact is missing or inconsistent → BLOCK
Indexing Guard Phase
Script: indexing-guard.sh
IF indexing explicitly ENABLED for release tag → GO
IF indexing DISABLED or undefined → BLOCK
Final State
GO → DEPLOY
BLOCK → STOP
No other terminal states are allowed.
Hard Rules
This flow MUST NOT be split across documents.
This flow MUST NOT be redefined in scripts.
Every script MUST reference this file.
Any change requires a new version of this document.
Final Statement
This document defines how SoftFocus moves
from repository state to public release
in a deterministic, auditable, and machine-verifiable manner.
Anything outside this flow is not allowed.
