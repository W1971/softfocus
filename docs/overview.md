# SoftFocus — Overview, Architecture & Product Plan  
**(Operational Update & Maintenance Roadmap)**

**Version:** v1.5.0  
**Status:** OPERATIONAL (Phase D — Maintenance Mode)  
**Mode:** governance-aware, product-first, deterministic

---

## 0. Current Snapshot (Now)

**As of today:**

- Recovery Scoring v1 — **frozen**
- Frontend calculators — **build PASS**
- Governance pipeline — **deterministic**
- Phase D lock — **active**
- System is **operational and governed**

SoftFocus has transitioned from implementation to **stable operation**.

---

## 1. What SoftFocus Is

**SoftFocus** is a multilingual analytical platform  
(RU primary; EN / ES / AR planned) focused on:

- cognitive load under sustained effort  
- early burnout risk signals  
- recovery capacity degradation  
- compensation patterns that mask decline  

The project is **explicitly non-clinical**:

- no diagnosis  
- no therapy  
- no medical claims or norms  

SoftFocus is a **thinking and orientation system**.  
It is not a quiz, checklist, coaching flow, or motivational product.

---

## 2. Product Domains (Operational State)

SoftFocus is structured around **product-grade domains**, each with explicit governance severity.

### 2.1 Assessments (`/testy`)
**Status:** OPERATIONAL, STABLE

- Deterministic  
- Behavior- and pattern-based  
- Canonical terminology enforced  
- Standalone analytical value without payment  

Assessments remain the **primary analytical entry point**.

#### Assessment Instrumentation (Clarification; no new meaning)
Assessments may be implemented as **role-aware question sets** to improve signal capture
without changing interpretation semantics.

- QuestionSets: 40–60 вопросов на роль (типовой объём), в 5 канонических секциях:
  - latency / residual / compensation / predictability / detachment
- QuestionSets do **not** contain scoring or interpretation.
- Aggregation produces the same section-level signal shape (0–3 per section),
  which is then interpreted by canonical recovery logic.

Reference artifacts (non-canonical to meaning):
- `app/shared/questionSets/**` — question pools
- `docs/assessments/contracts/QUESTION_SET_CONTRACT.md` — format contract

---

### 2.2 Calculators (`/kalkulyatory`)
**Status:** OPERATIONAL, FROZEN (Recovery Calculator v1)

- Sleep, recovery, compensation  
- Deterministic scoring  
- Explainable, non-adaptive interpretation  

The **Recovery Calculator v1** is formally frozen under governance and is the
**primary monetizable analytical artifact** in v1.x.

#### Result Contract (Clarification; no new meaning)
Calculator output may be represented via a stable, deterministic **Result Contract**
to ensure identical interpretation across runtimes (web/mobile) without changing scoring.

- Contract is descriptive and non-clinical.
- Entitlement affects **depth only** (no UI monetization messaging).
- Canonical meaning remains owned by Recovery Scoring v1.

Reference artifacts (non-canonical to meaning):
- `app/shared/contracts/result.contract.schema.json` — schema
- `scripts/cli/runProAssessment.cjs` — local contract builder/validator (dev tooling only)

---

### 2.3 Guides (`/guides`)
**Status:** LIMITED, READ-ONLY

- Analytical explanations  
- Mechanism-focused  
- SEO-oriented  
- Reduced strictness (WARN-level)  

Guides **do not define logic** and never override product interpretation.

---

### 2.4 Blog (`/blog`)
**Status:** OPTIONAL / DISABLED

- Contextual and SEO-only content  
- Lowest strictness tier  
- Never product-critical  

Can remain disabled without system impact.

---

## 3. Core Product Axis (Frozen)

All analytical products align to a single canonical axis:

**burnout → recovery capacity → compensation**

This axis is **frozen for all v1.x** and enforced through:

- content-validator rules  
- governance severity levels  
- CI and Release Gate checks  
- RFC-based change control  

Any modification requires a new phase declaration (v2.x).

---

## 4. Governance Layer (Operational)

Governance is **operational infrastructure**.

### 4.1 Content Validator

The `content-validator` enforces:

- non-clinical boundaries  
- canonical terminology  
- audience discipline  
- strict separation of product vs distribution content  

Severity model:

| Content Type | Canonical Missing |
|-------------|-------------------|
| assessment  | FAIL              |
| calculator  | FAIL              |
| guide/blog  | WARN              |

FAIL blocks CI and release.

---

## 5. Analytical Core: Recovery Scoring (v1)

### 5.1 Recovery Scoring v1
**Status:** FROZEN, RELEASE-SAFE

- Deterministic core implementation  
- Runtime-safe, non-frontend-owned logic  
- QA-covered with golden fixtures  
- Governed by RFC and checksum  

Artifacts:

- `scripts/core/recovery/scoreRecovery.cjs`  
- `tests/qa/runRecoveryQA.cjs`  
- `docs/governance/RFC-RECOVERY-SCORING-v1.md`  

This scoring model is the **single source of truth** for recovery analysis in v1.

---

## 6. Product Entitlement Model

Paid products are delivered as **entitlements**, not files.

An entitlement is valid only when:

1. Delivery script executes  
2. An audit event is written (`run.jsonl`)  
3. Severity = PASS  
4. No manual override  

This ensures auditable delivery and low operational overhead.

---

## 7. Phase D — Maintenance & Operation

**Phase D is active. Product meaning is frozen.**

Allowed actions:
- operational deployment
- distribution via approved channels
- mobile store submission
- bug fixes without semantic impact
- documentation clarification only

Forbidden actions:
- new features
- new UX flows
- new analytical axes
- SEO expansion
- monetization experiments / UI

Leaving Phase D requires:
- new phase declaration
- new bundle contract
- new version line (v2.x)

---

## 8. Maintenance Roadmap (Phase D)

Goals:
- stability
- auditability
- cost control
- controlled distribution

Allowed actions:
- dependency/security updates
- operational fixes
- documentation clarification
- mobile packaging and store submission

No expansion work is permitted in v1.x.

---

## Project Phase Status

- Current phase: **Phase D**
- Mode: **Maintenance**
- Mutability: **Frozen**

Phase D is formally closed for meaning changes.
All subsequent changes must comply with Maintenance Mode constraints.

## Runtime Compatibility (Mobile)

SoftFocus mobile runtime is validated against:
- Expo SDK 54
- React Native 0.81.x
- React 19.x
- Hermes (default)

This compatibility baseline is mandatory for:
- Expo Go (iOS / Android)
- development builds
- App Store / Play Store submission

Older Expo SDK versions are explicitly unsupported
due to Expo Go runtime constraints.

---

## 9. Future Version Line (v2.x — Declared)

SoftFocus has formally declared a **v2.x version line**,
operating under **Phase A — Analytical Exploration**.

v2.x introduces a new analytical focus,
independent from the v1.x recovery model.

### v2 Analytical Axis (Declared)

**load predictability → control illusion → cognitive fragmentation**

This axis examines how sustained responsibility
and uncertainty reshape cognitive structure,
not recovery or energy capacity.

### Separation Rule

- v1.x remains operational and frozen
- v2.x is non-executable and conceptual
- No shared scoring, logic, or UI is permitted

v2.x will progress only via explicit phase declarations
and a new bundle contract.
# Upgrade SoftFocus-Web
Version: Phase C → Institutional Surface Upgrade
Scope: Design / Architecture / UX / SEO / Production Hardening
Duration: 7 Days Intensive Sprint

---

## 🎯 Sprint Objective

Elevate SoftFocus-Web from a structured product prototype
to a visually institutional, typographically refined,
SEO-strong, production-grade multilingual analytical system.

---

# DAY 1 — Structural Architecture Hardening

## 1.1 Finalize i18n Structure

- Confirm `/[lang]` routing integrity
- Validate `/en /ru /es /ar`
- Ensure canonical + hreflang works correctly
- Add `x-default`
- Fix metadata consistency across routes

## 1.2 Remove Layout Duplication

- Root layout → only `<html>` shell
- `[lang]/layout.tsx` → language surface
- v2 layout → isolated context
- No nested `<html>` or `<body>` duplication

## 1.3 Middleware/Proxy Stabilization

- Finalize auto language detection
- Ensure no hydration mismatch
- Add safe fallback to `/en`

Deliverable:
Clean architecture tree + no console errors.

---

# DAY 2 — Typography System (Apple-Level Calibration)

## 2.1 Establish Type Scale

Create a strict modular scale:

- H1: 88 → 80 → 72 responsive
- H2: 32
- H3: 20
- Body Large: 24
- Body: 20
- Caption: 14

## 2.2 Baseline Grid System

- 8px rhythm base
- Vertical spacing multiples of 16px
- Strict max-width alignment

## 2.3 Refine Hero

- Increase negative letter-spacing precision
- Balance line-length to 14–16ch for titles
- Improve optical alignment

Deliverable:
Visually Apple Keynote-grade hero.

---

# DAY 3 — Header & Navigation Institutional Upgrade

## 3.1 Navigation System

- Replace simple links with structured nav
- Add subtle hover underline animation
- Improve active link precision

## 3.2 Scroll Behavior

- Smooth height shrink
- Typography shift on scroll
- Increase contrast on scroll
- Micro-shadow tuning

## 3.3 Language Switcher Upgrade

- Active language highlight
- Subtle weight difference
- RTL tested

Deliverable:
Header feels like apple.com.

---

# DAY 4 — v2 Flow UX Refinement

## 4.1 Progress Indicator Redesign

- Replace simple progress with refined bar
- Add smooth easing transitions
- Add stage labeling

## 4.2 Question Presentation Upgrade

- Improve whitespace
- Improve statement rhythm
- Add micro fade transitions

## 4.3 Result Page Depth

- Increase hierarchy contrast
- Separate core / dynamic / boundary visually
- Add analytical severity marker

Deliverable:
v2 flow feels institutional, not startup.

---

# DAY 5 — Visual Depth & Surface Enhancement

## 5.1 Subtle Mathematical Grid

- Reduce grid opacity
- Improve spacing coherence
- Align grid to typography rhythm

## 5.2 Elevation System

- Define 3 elevation levels
- Subtle shadow system
- Hover states refined

## 5.3 Micro Motion Audit

- Fade timings unified
- No abrupt transitions
- Use cubic-bezier refinement

Deliverable:
Design feels intentional, not decorative.

---

# DAY 6 — SEO & Authority Upgrade

## 6.1 Structured Data

- Add JSON-LD Organization
- Add WebApplication schema
- Add FAQ (if applicable)

## 6.2 Metadata Precision

- Improve titles per language
- Improve descriptions per language
- Add OG tags
- Add Twitter card

## 6.3 Performance

- Lighthouse 95+ target
- Check CLS
- Check hydration
- Check bundle size

Deliverable:
Search + technical authority solid.

---

# DAY 7 — Institutional Polish & Production Readiness

## 7.1 Visual Audit

- Check every spacing block
- Remove any inconsistent font-weight
- Remove accidental color shifts

## 7.2 Console Clean State

- No hydration warnings
- No layout mismatch
- No missing metadata

## 7.3 Prepare Production Snapshot

- Final commit
- Tag version
- Document upgrade summary
- Screenshot documentation

Deliverable:
Phase C Institutional Web Surface.

---

# Success Criteria

- Zero console errors
- Multilingual SEO correct
- Apple-level typography
- Institutional seriousness
- No design noise
- No hydration mismatch
- Lighthouse 95+
- Production-ready build

---

# Optional Advanced Upgrade (If Time Remains)

- Dark mode (mathematical version)
- Analytical PDF export
- Subtle parallax depth
- Motion-controlled typography scaling
- Interactive structural diagram

---

End of Sprint Plan.
Upgrade Softfocus-Web
=====================

**Phase:** Surface Maturation**Objective:** Elevate SoftFocus-Web to institutional-grade editorial system**Duration:** 7 days**Scope:** Design / Typography / Architecture / Interaction / SEO

Week Goal
---------

Transform SoftFocus-Web from:

> clean prototype

into:

> mathematically precise, editorial-grade, multilingual, production-ready system.

No feature expansion.Only depth, precision, refinement.

Day 1 — Layout Architecture Hardening
=====================================

### 1.1 Remove Nested 

Ensure:

*   Root layout owns 
    
*   \[lang\]/layout.tsx renders only content
    
*   No hydration mismatch
    

### 1.2 Clean Route Tree

Target structure:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   app/   ├ layout.tsx   ├ [lang]/   │   ├ layout.tsx   │   ├ page.tsx   │   ├ v2/   │   │   ├ page.tsx   │   │   ├ flow/   │   │   ├ intake/   │   │   └ result/   `

### 1.3 Fix Metadata Canonical Logic

Ensure:

*   canonical per language
    
*   hreflang cluster correct
    
*   no duplicated alternates
    

Day 2 — Typographic System (Apple-Keynote Grade)
================================================

### 2.1 Build Typographic Scale

Introduce controlled modular scale:

TokenSizeHero XL88pxHero L72pxLead24pxBody20pxMicro14px

No arbitrary sizes allowed.

### 2.2 Mathematical Vertical Rhythm

Define baseline grid:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   --sf-rhythm: 8px;   `

All spacing = multiple of 8.

Remove:

*   56px
    
*   64px
    
*   192pxunless justified by rhythm.
    

### 2.3 Refine Letterspacing

Hero:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   letter-spacing: -0.055em   `

Nav:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   0.08em uppercase   `

Body:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   0em or 0.01em max   `

Day 3 — Header as Institutional System
======================================

### 3.1 Active Route Precision

*   usePathname
    
*   pattern-aware active state
    
*   subtle underline indicator
    

### 3.2 Scroll Behavior

*   height shrink
    
*   font-size micro shift
    
*   opacity + blur recalibration
    

### 3.3 Language Switch Architecture

Switch must:

*   preserve current path
    
*   switch only language segment
    
*   not reset to homepage
    

Example:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   /en/v2/flow  → /ru/v2/flow   `

Day 4 — Assessment UI Refinement
================================

### 4.1 Question Surface Polish

Remove:

*   visual noise
    
*   heavy borders
    
*   hard contrasts
    

Add:

*   16px rhythm
    
*   soft segmented scale
    
*   tactile hover state
    

### 4.2 Result Page Depth

Refactor result page to:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   Name  3-line core  dynamic paragraph  boundary  exit   `

Typography:

*   Name: 56–64px
    
*   Core lines: 22px
    
*   Dynamic: 19px
    
*   Boundary: 14px
    

Add whitespace dominance.

Day 5 — RTL / i18n Hardening
============================

### 5.1 Arabic RTL Audit

Verify:

*   nav alignment
    
*   flex direction reversal
    
*   padding inversion
    
*   margin logic
    

### 5.2 Semantic Direction Control

Use:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML

Avoid manual CSS flips unless necessary.

### 5.3 Language Detection Refinement

Improve proxy:

*   prioritize explicit path
    
*   fallback to accept-language
    
*   default = EN
    

Day 6 — Motion & Interaction Calibration
========================================

### 6.1 Reveal Animation Softening

Current:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   900ms ease   `

Upgrade to:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   cubic-bezier(.25,.1,.25,1)   `

### 6.2 Remove Over-animation

SoftFocus is quiet.

*   No bounce
    
*   No scale pop
    
*   No animated counters
    

### 6.3 Subtle Page Transition (Optional)

Opacity crossfade only.

Day 7 — Authority Polish & Production Readiness
===============================================

### 7.1 Add:

*   sitemap.ts
    
*   robots.ts
    
*   OpenGraph images per language
    
*   structured metadata
    

### 7.2 Performance

Target:

*   < 120kb JS
    
*   zero hydration warnings
    
*   no layout shift
    

### 7.3 Final Design Integrity Review

Ask:

*   Is it quieter than before?
    
*   Is spacing mathematically consistent?
    
*   Does anything feel “producty”?
    

Remove anything decorative.

Deliverable After 7 Days
========================

SoftFocus-Web should feel:

*   Editorial
    
*   Calm
    
*   Institutional
    
*   Exact
    
*   Intentional
    
*   Non-startup
    

Not “app-like”.Not “SaaS-like”.Not “wellness”.
