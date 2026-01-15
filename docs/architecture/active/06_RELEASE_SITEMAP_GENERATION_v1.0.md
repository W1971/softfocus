# SoftFocus — Release Sitemap Generation

Version: v1.0  
Status: ACTIVE  

---

## Purpose

This document defines how `release/sitemap.xml`
is generated and used in SoftFocus.

The release sitemap represents a **stable, auditable product state**
and is distinct from the discovery sitemap.

---

## Core Principles

- Release sitemap is **generated only from tagged commits**
- It reflects **one specific release**
- It is **never auto-updated**
- It is **explicitly submitted** to search engines

---

## Generation Trigger

A release sitemap MAY be generated only when:

- the current commit has an annotated git tag
- all CI gates have passed
- Phase 1 and Phase A are locked

Any other generation is forbidden.

---

## Source of Truth

The release sitemap is generated from:

- active documentation structure
- canonical routing configuration
- release manifest

No runtime crawling or discovery is allowed.

---

## Included Routes

The release sitemap MUST include only:

- assessment root
- assessment results page
- protocol overview
- about page

Programmatic SEO pages are excluded.

---

## Excluded Routes

The following MUST NOT appear:

- draft content
- experimental routes
- programmatic SEO expansions
- localized variants beyond reference locale

---

## Lifecycle

1. Git tag created
2. Release sitemap generated
3. Sitemap submitted manually
4. Sitemap never changes

A new release requires a new sitemap.

---

## Relationship to Main Sitemap

- `/sitemap.xml` → discovery and indexing
- `/release/sitemap.xml` → validation and audit

They serve different purposes and must not be merged.

---

## Summary

The release sitemap is a compliance artifact,
not a growth mechanism.

Stability overrides coverage.

