# Entitlement Delivery Contract

## Definition

An entitlement is a controlled analytical access right,
not a downloadable asset.

---

## Delivery Requirements

An entitlement is valid only if:

1. Delivery script executed
2. Audit record written
3. run.jsonl contains PASS
4. No manual override occurred

---

## Failure Semantics

If any condition fails:
- entitlement is invalid
- no access is granted
- event is logged

---

## User Experience Rule

- No pressure
- No countdowns
- No scarcity language
- Clear optionality

---

## Governance Alignment

Entitlements do not:
- modify scoring
- add logic
- influence interpretation rules

They only expose existing analytical depth.

