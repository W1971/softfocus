# SoftFocus — Content Validation Rules

Version: v1.4  
Status: ACTIVE  
Enforcement: Mandatory  
Applies to: All repositories, all releases

---

## 1. Purpose

This policy defines **non-negotiable content constraints**
required to keep SoftFocus:

- non-clinical,
- governance-safe,
- legally non-adjacent to medical systems,
- internally coherent at scale.

These rules are enforced **automatically**.
There is no manual override.

---

## 2. Core Principle

Clinical terminology is **not forbidden by vocabulary**.  
It is forbidden by **intent and scope**.

SoftFocus may reference clinical concepts **only to define exclusion boundaries**.

---

## 3. Content Zones

Each document belongs to exactly one zone, determined by path.

### 3.1 Zones

| Zone | Description |
|----|----|
| PUBLIC | Public-facing explanatory content |
| B2B | Executive, investor, enterprise material |
| PRODUCT | Product design, protocol, system logic |
| STRICT | Assessment core, taxonomy, question logic |

Unclassified documents are **invalid**.

---

## 4. Clinical Terminology Policy

### 4.1 Clinical Terms

Clinical terminology includes (non-exhaustive):

- diagnosis / diagnostic
- therapy / therapeutic
- treatment
- mental health
- medical assessment
- psychological condition

Exact matching is enforced by validator regex.

---

### 4.2 Default Rule

If clinical terminology is detected:

→ **BLOCK**

Unless an approved boundary declaration exists.

---

## 5. Boundary Declarations (v1.4)

Clinical terminology is permitted **only if** the document contains
a valid boundary declaration appropriate to its zone.

### 5.1 Canonical Boundary Markers

Boundary markers are **exact phrases**.
No paraphrasing is allowed.

#### PUBLIC

#### B2B / PRODUCT

#### STRICT

---

### 5.2 Boundary Placement Rules

A boundary declaration is valid **only if**:

- it appears within the first 25 lines, AND
- it appears before the first `##` heading.

Boundaries placed later are ignored.

---

## 6. Zone-Specific Rules

### 6.1 PUBLIC

- No diagnosis, treatment, or therapy claims
- Clinical terms allowed **only with Boundary Notice**
- Tone must be descriptive, not prescriptive

---

### 6.2 B2B

- Clinical terms allowed **only with Scope & Compliance Boundary**
- No implied medical responsibility
- No health outcome claims

---

### 6.3 PRODUCT

- May describe internal logic
- Clinical terms allowed **only with Scope & Compliance Boundary**
- No behavioral prescriptions

---

### 6.4 STRICT

STRICT documents may reference clinical concepts
**only to define what SoftFocus is not**.

Allowed:
- exclusion language
- taxonomy clarification
- boundary enforcement

Forbidden:
- diagnostic framing
- therapeutic implication
- medical equivalence

STRICT documents **must** include:


---

## 7. Enforcement

Violations result in:

- immediate BLOCK
- release halt
- tag prohibition

There is no manual override.

---

## 8. Change Control

Any modification to these rules requires:

- new version number
- explicit supersession
- validator update

