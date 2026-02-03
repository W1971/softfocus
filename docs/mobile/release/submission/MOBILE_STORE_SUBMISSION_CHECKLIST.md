---
type: submission-checklist
scope: mobile
status: canonical
phase: phase-d
mutability: frozen
last_verified_utc: 2026-02-03T00:00Z
---

# Mobile Store Submission Checklist
## Final Release Gate (iOS + Android)

This checklist is the **final executable gate**
before submitting SoftFocus to Apple App Store
and Google Play.

No submission is allowed unless this checklist PASSES.

---

## Preconditions (MANDATORY)

All previous steps in the Mobile Release Chain MUST be PASS:

- STEP 1 — Product Meaning Freeze → PASS
- STEP 2 — Store Positioning → PASS
- STEP 3 — Technical Readiness → PASS
- STEP 4 — Privacy & Compliance → PASS

If any precondition is not met → STOP.

---

## A. Build Artifacts

### iOS
- [ ] Release build created (no debug flags)
- [ ] App launches on physical device
- [ ] Result screen reachable
- [ ] No placeholder content
- [ ] Build uploaded to TestFlight

### Android
- [ ] Release AAB generated
- [ ] App installs on clean device
- [ ] Result screen reachable
- [ ] No debug logs or test flags
- [ ] Internal testing release uploaded

---

## B. Store Metadata Verification

- [ ] App name matches STORE_DESCRIPTION.md
- [ ] Description matches actual behavior
- [ ] No medical or therapeutic claims
- [ ] Keywords comply with safe set
- [ ] Screenshots reflect real UI

---

## C. Privacy & Compliance Verification

- [ ] Privacy Policy URL added to store listing
- [ ] Non-clinical disclaimer present in metadata
- [ ] No undeclared permissions
- [ ] No tracking or analytics SDKs

---

## D. Final Human Review (Mandatory)

Answer YES to all:

- [ ] App does exactly what it claims — nothing more
- [ ] App does not pressure, retain, or upsell
- [ ] App can be exited at any point
- [ ] App ends interaction cleanly

If any answer is NO → FAIL.

---

## PASS / FAIL RULE

### PASS
- All checklist items completed
- Submission is allowed

### FAIL
- Any unchecked item
- Submission is forbidden

---

## NEXT ACTION ON FAIL

- Identify failing section (A–D)
- Fix the issue
- Re-run this checklist from the top

---

## Final Authority

This checklist is final.

If store reviewers request changes that violate:
- FINAL_MOBILE_SPEC
- Non-clinical boundary
- Product meaning

The correct response is:
**reject the change or withdraw the submission**.

