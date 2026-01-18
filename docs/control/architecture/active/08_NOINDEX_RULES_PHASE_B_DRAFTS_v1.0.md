# SoftFocus — Noindex Rules for Phase B Drafts

Version: v1.0  
Status: ACTIVE  

---

## Purpose

This document defines indexation rules
for Phase B (Localization) draft content.

Draft localization must never affect SEO.

---

## Definition of Draft Content

Draft content includes:

- incomplete translations
- review-stage localization
- language parity checks
- internal QA versions

Drafts are not user-facing.

---

## Indexation Policy

All Phase B drafts MUST be:

- noindex
- nofollow
- excluded from sitemap.xml
- excluded from release sitemap

---

## Enforcement Mechanisms

Indexation is prevented via:

- X-Robots-Tag headers
- route-level noindex flags
- explicit exclusion from sitemaps

Robots.txt alone is insufficient.

---

## Promotion to Indexable

A localized page may be indexed only when:

- translation is complete
- parity with RU is verified
- Phase B checklist is passed
- content is moved out of draft state

---

## Prohibited Actions

- indexing draft locales
- testing translations on live indexed URLs
- temporary indexing for experiments

---

## Summary

Phase B drafts are operational artifacts,
not content.

Indexation begins only after parity is achieved.

