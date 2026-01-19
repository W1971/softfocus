# Sleep Calculator — Product Test Protocol
Version: v1.0  
Status: ACTIVE

---

## Purpose

Validate that `/kalkulyator-sna` functions as a product-grade analytical tool,
not a UX experiment or wellness quiz.

---

## Scope

This protocol covers:

- content correctness
- deterministic logic
- output contract
- return triggers

UI aesthetics and conversion metrics are explicitly out of scope.

---

## Preconditions

- content-validator passes with no FAIL
- project builds successfully
- calculator accessible at `/kalkulyator-sna`

---

## Test Scenarios

### Scenario A — Stable Recovery

Inputs:
- sleep: 7.5–8.5 hours
- regular schedule
- no stimulation
- no compensatory sleep

Expected:
- low-risk classification
- stable recovery framing
- non-urgent return trigger

---

### Scenario B — Compensated Load

Inputs:
- sleep: 6–6.5 hours
- regular caffeine use
- weekend catch-up sleep

Expected:
- mid-level classification
- risk of accumulation
- return trigger tied to regime change

---

### Scenario C — Systemic Deficit

Inputs:
- sleep: <6 hours
- irregular schedule
- continuous stimulation

Expected:
- high-risk classification
- sustainability risk explanation
- neutral, non-alarmist language

---

## Determinism Check

Repeat Scenario B three times.

Expected:
- identical classification
- identical interpretation text

---

## Acceptance Criteria

The calculator is considered valid if:

- all scenarios pass
- no emotional or medical language appears
- output can be shared without embarrassment

