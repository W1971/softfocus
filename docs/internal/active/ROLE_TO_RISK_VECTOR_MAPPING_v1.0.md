# SoftFocus — Role to Risk Vector Mapping

Version: v1.0  
Status: LOCKED  
Visibility: INTERNAL ONLY

---

## Purpose

Define **expected dominant risk vectors**
by occupational role.

This mapping informs:
- assessment interpretation,
- primary vector tie-breakers,
- B2B reporting aggregation.

---

## Mapping Principles

- Mapping is probabilistic, not deterministic
- Individual assessment overrides role defaults
- Used only when domain impacts are comparable

---

## Canonical Role Mappings

### Software Engineers
Primary vectors:
- Cognitive Sustainability
- Attention Fragmentation

Secondary:
- Decision Load

---

### Engineering Managers / Leads
Primary vectors:
- Decision Load
- Recovery Inefficiency

Secondary:
- Load Compensation

---

### Startup Founders
Primary vectors:
- Decision Load
- Load Compensation

Secondary:
- Recovery Inefficiency

---

### Healthcare Professionals
Primary vectors:
- Recovery Inefficiency
- Decision Integrity Risk

Secondary:
- Attention Fragmentation

---

### Safety-Critical Operators
Primary vectors:
- Attention Stability
- Decision Integrity Risk

Secondary:
- Recovery Inefficiency

---

### Consultants / Analysts
Primary vectors:
- Cognitive Sustainability
- Decision Fatigue

Secondary:
- Attention Fragmentation

---

## Governance Rule

Role-based mapping must:
- never override strong assessment signals
- never be exposed publicly
- be versioned and auditable

