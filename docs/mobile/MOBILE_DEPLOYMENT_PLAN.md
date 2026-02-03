# SoftFocus Mobile — Deployment Plan (Phase D)

## Scope

This document defines how SoftFocus Mobile
is built, validated, and deployed under Phase D.

No product logic is defined here.

---

## Runtime

- Expo SDK 54
- React Native 0.81.x
- React 19.x
- Hermes enabled
- No Expo Router
- No Web target

---

## Development Mode

Primary:
- Expo Go (iOS / Android)

Secondary (pre-release):
- Expo development build
- Platform simulators

---

## Build Strategy

- No prebuild during development
- Prebuild only for store submission
- No custom native modules

---

## Validation Gates

Before submission:
- Runtime baseline PASS
- Zero red screens
- Orientation locked (portrait)
- Non-clinical copy verified
- No external links without disclosure

---

## Distribution

### Apple App Store
- Build via EAS
- Manual review notes
- Non-clinical declaration required

### Google Play
- Internal testing track
- Same binary logic as iOS

---

## Phase D Constraint

No changes to:
- scoring logic
- interpretation semantics
- user flow structure

Mobile is a delivery surface only.
