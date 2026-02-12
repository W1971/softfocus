# SoftFocus v2 — Signal Density & Imbalance Heuristics

**Status:** DESIGN-ONLY  
**Phase:** Phase C — Analytical Consolidation  
**Scope:** Conceptual heuristics (non-scored)  
**Last updated:** 2026-02-11

---

## Purpose

This document defines **conceptual heuristics**
for reasoning about signal density and imbalance
across the SoftFocus v2 dimensions.

These heuristics:
- are non-numeric
- are non-executable
- do not imply thresholds or severity

They exist to guide **interpretation logic design** only.

---

## Signal Density (Conceptual)

**Signal density** refers to the concentration of
non-absent signals within a dimension.

Conceptual states:

- Low density → episodic, situational signals
- Medium density → regular but bounded patterns
- High density → structurally embedded patterns

Density is assessed **within** a dimension,
not across dimensions.

---

## Cross-Dimension Imbalance

Imbalance occurs when one dimension
significantly dominates the others.

### Common Imbalance Types

| Imbalance | Description |
|---------|-------------|
| A-heavy | Environment unstable, compensation not yet internalized |
| B-heavy | Control illusion compensating for perceived instability |
| C-heavy | Cognitive fragmentation without visible instability |
| A+B heavy | Systemic instability masked by vigilance |
| B+C heavy | Over-control sustaining fragmentation |
| A+C heavy | Volatile execution leading directly to fragmentation |

---

## Interpretive Principles

- High density ≠ severity
- Low density ≠ safety
- Imbalance is more informative than absolute density
- Single-dimension readings are unreliable

Meaning emerges from **relative structure**, not magnitude.

---

## Temporal Note

Heuristics assume:
- a rolling 3–4 week window
- pattern persistence, not isolated spikes

They are invalid for momentary states.

---

## Boundary Rule

If heuristics begin to resemble:
- scoring rules
- alert thresholds
- recommendations

this document violates Phase C constraints
and must be revised.

