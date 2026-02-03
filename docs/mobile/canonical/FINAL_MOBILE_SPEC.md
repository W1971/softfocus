---
type: product-spec
scope: mobile
status: target
phase: phase-d
mutability: frozen
boundary: non-clinical
last_verified_utc: 2026-02-03T00:00Z
---

# SoftFocus — Final Mobile Spec (v1)
**Single-Screen Result App**

This specification defines the target end-state of the mobile experience.
It is a product-level contract (design intent), not an implementation guide.

---

## 1. Purpose (Fixed)

SoftFocus mobile is a **terminal artifact**.

It exists to:
- state the analytical truth clearly,
- reduce interpretive noise,
- end interaction.

Mobile is not designed for retention, guidance, or progression.

---

## 2. Screen Count (Hard Rule)

### Required
- `ResultOrientationScreen` (the only mandatory screen)

### Optional (only if mobile is used as an entry surface)
- `AssessmentScreen`
- `ExitScreen` (may be visually empty)

Navigation must not be treated as a product concept.
User flows are not designed.

---

## 3. Canonical Screen: ResultOrientationScreen

### 3.1 Visual Frame

- Background: single-tone near-white / white
- No cards
- No borders
- No separators
- No icons
- No top branding / header chrome

The screen must feel **quiet** and visually **empty** before reading.

### 3.2 Layout (Vertical Composition)

The canonical composition is:

- large negative space (top)
- MAIN STATEMENT
- negative space
- SECONDARY STATEMENT (optional)
- large negative space (bottom)

White space is an active element.

---

## 4. Screen Content (Semantics)

### 4.1 MAIN STATEMENT (Mandatory)

Function: state the system condition as a fact.

Properties:
- a single declarative sentence
- calm, non-emotive tone
- no personalization (“you”)
- no “test result” framing
- no time hedging (“right now”, “at the moment”)

Example (type, not final copy):

“Recovery does not close under current load.”

### 4.2 SECONDARY STATEMENT (Optional, 1–2 lines)

Function: stabilize interpretation without expanding scope.

Properties:
- short (1–2 lines)
- descriptive, not instructional
- no advice
- no next steps
- no implied actions

Example (type, not final copy):

“Rest is present, but total load does not decrease.”

---

## 5. Typography (Principle)

- One font family
- Minimal weight contrast
- No color-based meaning
- No emphasis devices (badges, chips, highlights)

MAIN STATEMENT:
- large
- readable
- regular/medium weight

SECONDARY STATEMENT:
- smaller
- visually secondary
- lighter weight

---

## 6. Interactivity (Zero)

The screen must not contain:
- buttons
- links
- gestures / swipe affordances
- “tap to continue”
- hidden navigation
- interactive elements

The intended action is: **close the app**.

---

## 7. Motion (None)

- No entrance animations
- No “soft reveal”
- No loading theatrics
- No micro-interactions

The screen appears immediately, like a printed statement.

---

## 8. Prohibited Patterns (Hard Ban)

- onboarding / walkthrough
- progress indicators
- retention mechanics
- CTAs
- upsell / monetization references
- entitlement prompts or explanations
- “learn more” affordances
- recommendations / coping language
- therapeutic language
- promises of improvement

If a user feels they are being led, the spec is violated.

---

## 9. Success Criteria (Final)

Mobile is considered final if:
- the meaning is understood in 5–10 seconds,
- there is no question “what should I click?”,
- the user can exit immediately without loss,
- the interface does not invite staying.

Ideal outcome:
- read
- (optional) screenshot
- close
- no return pressure

---

## 10. Web / Calculator Relation (Meaning Parity)

- Web explains
- Calculators quantify (deterministically)
- Mobile states and ends

Mobile does not replicate web content.
Mobile does not expand calculator logic.
Mobile is the terminal statement.

