# Cleanup Plan — Mobile v1

## Status
ACTIVE — classification only

## Goal
Isolate Mobile v1 from non-mobile logic
without deleting or refactoring existing code.

---

## Mobile v1 scope
Mobile v1 includes:
- result orientation screens
- explanatory excerpts
- observation and tracking hooks

Mobile v1 explicitly excludes:
- calculators
- interactive inputs
- numeric manipulation
- execution logic

---

## Non-mobile layers
The following are classified as non-mobile:
- app/kalkulyator-*
- calculator components
- calculation contracts and datasets

These layers must not be imported
into mobile components.

---

## Cleanup rules
- No deletion in this phase
- No refactoring for style
- Only classification and enforcement
- Violations must be caught by CI

---

## Completion condition
Cleanup is complete when:
- mobile code cannot import calculators
- CI blocks mobile/calculator coupling
- Mobile v1 is fully isolated


---

## Naming collision: docs/frontend vs /frontend

The project contains two similarly named directories with different roles:

- docs/frontend/ — documentation layer (policies, contracts, schemas, mobile constraints)
- /frontend/ — implementation layer (runtime code, build artifacts, UI components)

This is not duplication. It is a layered architecture.

### Mobile v1 enforcement rule

Mobile v1 constraints are defined in docs/frontend/mobile/.
Runtime implementation in /frontend/ must comply with these constraints.

Mobile code must not import:
- app/kalkulyator-*
- calculator components
- calculator datasets or contracts

If mobile behavior depends on calculators, it violates Mobile v1 scope.

