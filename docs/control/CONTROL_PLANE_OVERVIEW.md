---
type: governance-overview
scope: control-plane
mutability: restricted
---

# SoftFocus Control Plane Overview

SoftFocus control plane is composed of four independent layers.

---

## 1. Alias Registry

Defines which aliases exist and how they execute.

Source:
- docs/control/ALIASES.yaml

---

## 2. Alias Classification Policy

Defines the criticality of each alias.

Source:
- docs/control/ALIAS_CLASSIFICATION_POLICY.md

Alias classes:
- CORE
- OPTIONAL
- EXPERIMENTAL

---

## 3. Alias Status Model

Defines valid execution states and aggregation rules.

Source:
- docs/control/ALIAS_STATUS_MODEL.md

Statuses:
- READY
- DESIGN_ONLY
- LOCKED
- FAIL

---

## 4. Alias Scope Map

Defines which repository areas each alias governs.

Source:
- docs/control/ALIAS_SCOPES.yaml

Used to:
- determine affected aliases per change
- aggregate CI results
- compute overall system status

---

## Aggregation Principle

Overall system status is derived by combining:

- alias class
- alias status
- alias scope relevance

No single file is authoritative alone.
