---
type: audit
scope: mobile-ui
status: active
governance: enforced
---

# Mobile UI Audit Checklist (v1)

This checklist validates that the current mobile UI
complies with canonical mobile policies.

## Documents in scope

- ANTI_REQUIREMENTS_MOBILE_UI.md
- SoftFocus_Mobile_Policy.md
- SoftFocus_Mobile_Result_Schema.json

---

## Visual & Structural Checks

- [ ] No numeric scores or percentages visible
- [ ] No charts, graphs, or visual analytics
- [ ] Single-column vertical layout
- [ ] No tabs, sidebars, or dashboards
- [ ] No collapsible primary content
- [ ] Result state visible without scrolling
- [ ] Context visible without scrolling
- [ ] Excerpt visible without scrolling

---

## Interaction Checks

- [ ] No required user interaction
- [ ] No forced navigation
- [ ] No modals or overlays
- [ ] No notifications or prompts after result

---

## Language & Tone Checks

- [ ] No motivational language
- [ ] No urgency framing
- [ ] No promises or outcomes
- [ ] No action verbs ("do", "improve", directive phrasing)

---

## CTA & Conversion

- [ ] No primary CTA
- [ ] Reference link (if present) is secondary and non-directive

---

## Pass Condition

The mobile UI PASSES if:
- all checks above are satisfied
- the screen can be understood in under 20 seconds
- the UI does not trigger "what should I do now?"

