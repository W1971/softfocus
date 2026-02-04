# Mobile Runtime Baseline (Phase D)

This document defines the fixed runtime baseline
for SoftFocus Mobile under Phase D (Maintenance Mode).

No product logic is defined here.

---

## Runtime Stack

- Framework: Expo
- Expo SDK: 54
- React Native: 0.81.x
- React: 19.x
- JavaScript Engine: Hermes
- Architecture: Bridgeless (default Expo runtime)

---

## Platform Scope

- iOS (Apple App Store)
- Android (Google Play)

Web is explicitly excluded.

---

## Constraints

The following elements are frozen:

- Runtime framework choice
- SDK version
- Rendering engine
- Platform targets

No native modules beyond Expo-managed defaults are permitted.

---

## Governance Status

This runtime baseline is FINAL for Phase D.

Any change to:
- SDK version
- runtime architecture
- engine selection
- platform scope

requires a new phase declaration
and a new canonical bundle contract.

