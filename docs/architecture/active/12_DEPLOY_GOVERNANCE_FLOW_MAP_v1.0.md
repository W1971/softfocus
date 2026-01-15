# SoftFocus — Deploy Governance Flow Map

Version: v1.0  
Status: ACTIVE  
Audience: Core maintainer

---

## Purpose

This document defines the **deploy governance protocol** as an executable,
linear flow.

Each step is mapped to a concrete script or artifact to ensure:

- deterministic execution
- explicit stop conditions
- controlled human intervention
- auditable release authorization

This is an **operational specification**, not a conceptual overview.

---

## Canonical Entry Point

### START — Linear Runner

`scripts/stage-runner-linear.sh`

This is the single entry point.
All deploy-related checks must pass through this runner.
No script is allowed to bypass it.

---

## Visual Diagram (SVG)

The visual reference is derived from the ASCII flow below.

![Deploy Governance Flow](./12_DEPLOY_GOVERNANCE_FLOW_MAP_v1.0.svg)

> The SVG is **illustrative**.  
> The ASCII flow is **canonical** and authoritative.

---

## Flow Chart (ASCII — Canonical)

```text
START
 |
 | scripts/stage-runner-linear.sh
 v
[OFFLINE READY CHECK]
 | tests/offline/ready-for-deploy.sh
 |
 +--> FAIL (STRUCTURAL)
 |        |
 |        | examples:
 |        |  - checksum mismatch
 |        |  - missing phase locks
 |        |  - build failure
 |        |
 |        v
 |   STOP (NO OVERRIDE)
 |   scripts:
 |     - scripts/locks/check-locked-hash.sh
 |     - scripts/helpers/override-policy.sh (HIGH)
 |
 +--> FAIL (LOW RISK)
 |        |
 |        | examples:
 |        |  - git dirty
 |        |  - missing optional docs
 |        |
 |        v
 |   SHOW DIFF + GUIDE
 |   scripts:
 |     - scripts/helpers/interactive-decision.sh
 |     - scripts/helpers/contentlint-guided.sh
 |        |
 |        v
 |   HUMAN y/n
 |        |
 |        +--> NO → DIAGNOSTIC → STOP
 |        |
 |        +--> YES → AUDIT (LOW)
 |              scripts:
 |                - scripts/audit/append-audit-log.sh
 |                - scripts/audit/append-audit-json.sh
 |
 v
[LINEAR RUNNER CONTINUES]
 | scripts/stage-runner-linear.sh
 |
 v
[POLICY BUNDLE CHECK]
 | scripts/helpers/override-policy.sh
 | + phase policy bundles
 |
 v
[RELEASE AUTHORIZED]
 | scripts/release/release-safe.sh
 |
 v
[SIGNED RELEASE]
 | scripts/release/release-from-tag.sh
 |
 v
[DASHBOARD UPDATE]
 | audit/READY_AUDIT.jsonl
 |
END
```
