# SoftFocus — Release Sitemap Specification

Version: v1.0  
Status: ACTIVE  

---

## Purpose

The release sitemap defines
which URLs represent a stable product release.

It is used for:
- tagged releases
- audits
- distribution validation

---

## Release Sitemap URL

/release/sitemap.xml

This sitemap is generated
only from tagged commits.

---

## Included Pages

- assessment root
- protocol overview
- about page

Excluded:
- experiments
- drafts
- staging routes
- programmatic SEO expansions

---

## Indexing Rules

- submitted manually per release
- never auto-updated
- tied to git tag

---

## Relationship to Main Sitemap

- sitemap.xml → discovery
- release sitemap → validation

Both coexist.

