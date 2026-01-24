# Frontend Plan — Status and Observations

## Scope
Frontend includes:
- product definition
- content
- protocol presentation
- UX / localization
- SEO-facing materials

This document fixes the current completion state and defines the next execution phase.

---

## ✅ Completed (v1.0)

### Content & UX
- Structured content model established
- RU content corpus created and validated
- Assessment content separated from governance and backend logic
- Public-facing explanation documents finalized

### Product & Protocol
- Phase A / B / C product documents structured
- Protocol documents versioned and localized
- Clear separation between free and paid boundaries (documentation level)

### SEO & Public
- SEO rules documented
- Indexing strategy documented
- Public trust and FAQ materials finalized

### Architecture Alignment
- Frontend docs isolated under `docs/frontend`
- No backend or governance leakage into frontend layer
- Docs validation and CI checks pass

---

## 🔒 Frozen Decisions

- Frontend does not execute business logic
- Frontend does not define governance rules
- Frontend consumes protocol definitions as read-only artifacts
- Documentation is the source of truth for UX behavior

---

## ⏭ Further Plan (v1.1+)

### Short-term
- Generate frontend index (auto or manual)
- Add visual navigation for protocol flow
- Introduce content changelog per release

### Mid-term
- Wire frontend docs to actual UI components
- Validate SEO assumptions with real traffic
- Add A/B documentation for content variants

### Long-term
- Frontend docs as design-system reference
- Auto-sync between docs and UI schemas
- Localization pipeline formalization

---

## Ownership
Frontend layer is owned by:
- product
- content
- UX / SEO

Changes require:
- docs update
- successful `alias-softfocus docs` check
