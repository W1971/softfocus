# Mobile Overview — SoftFocus

## Scope

This document defines how SoftFocus operates in a mobile context.

It describes:
- what the mobile surface is responsible for
- what it explicitly does not do
- how mobile behavior is observed and evaluated

This document is canonical for mobile.
Desktop considerations are out of scope.

---

## Why SoftFocus is mobile-first

SoftFocus is primarily consumed in states of:
- cognitive fatigue
- reduced tolerance for effort
- fragmented attention

These states align with mobile usage patterns:
- short sessions
- partial reading
- return-based engagement

Mobile is not a delivery channel.
It is the correct cognitive environment for the product.

---

## What the mobile surface provides

The mobile surface provides orientation, not action.

Specifically, it delivers:
- a clear state label
- minimal contextual clarification
- a short explanatory excerpt
- an optional reference to deeper material

The mobile surface must not:
- request decisions
- suggest actions
- require follow-up steps

---

## Mobile result screen contract

Every mobile result screen must:
- be understandable in under 20 seconds
- fit within a single vertical flow
- avoid numbers, charts, and comparisons
- avoid calls to action

The result screen exists to reduce internal pressure,
not to drive behavior.

---

## Observation instead of optimization

Mobile behavior is observed, not optimized.

SoftFocus tracks:
- impression (was the explanation seen)
- click (did the user seek context)
- read (did the user stay with the explanation)

These signals are used to detect:
- loss of orientation value
- cognitive overload
- drift toward desktop-style complexity

They are not used for growth optimization.

---

## Daily and weekly signals

Mobile resonance is evaluated through:
- daily resonance reports (human-readable)
- weekly trend snapshots (directional only)
- regression alerts tied to concrete commits

These mechanisms protect the product
from silent degradation.

---

## What mobile is not

The mobile surface is not:
- a dashboard
- a coaching interface
- a habit tracker
- a task manager
- a notification system

If a feature requires motivation or execution,
it does not belong on mobile.

---

## Relationship to the core product

Mobile does not contain product logic.

It renders:
- assessment results
- explanatory context
- protocol references

All core logic remains:
- deterministic
- server-side
- audit-safe

Mobile is a surface, not a system.

---

## Summary

SoftFocus Mobile exists to make understanding possible
when effort is limited.

If a mobile screen increases pressure,
adds decisions,
or demands action,
it violates this policy.
