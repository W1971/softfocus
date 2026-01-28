# Governance Invariant — SEO vs Canonical Explanations

## Status
ACTIVE — enforced from Phase C

## Invariant Statement

SEO entry documents and canonical explanation documents
serve different and non-overlapping roles.

- SEO documents introduce questions
- Canonical documents define meaning

SEO documents MUST NOT:
- redefine terminology
- introduce canonical interpretations
- override canonical explanations

Canonical explanation documents:
- are authoritative
- are stable
- may be referenced, but not duplicated

---

## Canonical Anchor

The single canonical explanation layer is:

→ docs/guides/CANONICAL_EXPLANATIONS_INDEX_RU.md

All SEO-facing indices must explicitly reference this anchor.

---

## Enforcement

Violations of this invariant result in:
- content validation failure
- governance review requirement
- blocked release if unresolved

---

## Rationale

This invariant prevents semantic drift
between discovery (SEO)
and interpretation (product meaning).

It allows SEO expansion
without destabilizing product semantics.

