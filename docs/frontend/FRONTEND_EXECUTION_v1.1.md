# Frontend Execution v1.1 — UI and Content Wiring

## Goal
Bind documented frontend architecture to actual UI and content
without introducing new product decisions.

---

## Source of Truth
- docs/frontend/**
- protocol definitions
- content taxonomy

Frontend code must not diverge from docs.

---

## Execution Steps

### Content Wiring
- Map docs/frontend/content → src/content
- Ensure locale parity (ru/en)
- Enforce noindex rules from docs

### UI Wiring
- Layouts reflect protocol phases
- Assessment flow mirrors documented UX
- Public pages map 1:1 to docs/public

### Validation
- Build fails if content structure diverges
- Docs changes require UI re-check

---

## v1.1 Deliverables
- Content loader aligned with docs
- Basic UI shell following protocol
- No styling optimization (out of scope)

---

## Non-Goals
- No redesign
- No experimentation
- No monetization logic
