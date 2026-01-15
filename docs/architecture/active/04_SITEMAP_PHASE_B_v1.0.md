# SoftFocus — Sitemap (Phase B)

Version: v1.0  
Status: ACTIVE  

---

## Purpose

This sitemap reflects the platform structure
after Phase B kickoff (Localization).

It defines indexable surfaces
without altering product logic.

---

## Canonical Sitemap

/sitemap.xml  
Primary sitemap submitted to Google Search Console.

Contains:
- core assessment pages
- protocol overview
- active localized routes

---

## Core Routes (All Languages)

/{locale}/burnout-test  
/{locale}/burnout-test/results  
/{locale}/protocol  

Locales:
- /en
- /ru
- /es
- /ar

---

## Programmatic SEO Layer

/{locale}/burnout-test-for/{audience}

Rules:
- identical structure
- audience context only
- single assessment entry

Examples:
/en/burnout-test-for/developers  
/ru/burnout-test-for/developers  

---

## Excluded from Indexation

- internal protocol steps
- payment confirmation
- diagnostics or logs
- experimental drafts

Controlled via:
- robots.txt
- X-Robots-Tag headers

---

## Summary

All indexable paths
lead to the same assessment core.

Localization increases access,
not surface area.

