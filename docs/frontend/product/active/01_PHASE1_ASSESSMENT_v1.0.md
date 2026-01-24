> **Non-Clinical Scope Declaration**  
> This document describes internal system design and product evolution.  
> Any clinical terminology is used **only to define what is explicitly excluded**.  
> SoftFocus does not operate as a diagnostic or therapeutic system.

# SoftFocus — Phase 1: Assessment

Status: LOCKED  
Scope: Product Core  
Version: v1.0

---

## Purpose

Phase 1 defines the core assessment layer of SoftFocus.

The goal is not diagnosis or advice, but structured identification
and explanation of burnout-related states based on stable signals.

This phase establishes the product foundation.
All later phases build on it and must not contradict it.

---

## What Phase 1 Is

Phase 1 is an assessment-driven system that:

- identifies burnout-related states
- explains underlying mechanisms
- avoids prescriptions or recommendations
- treats the user as competent and autonomous

The assessment itself is the product.

---

## What Phase 1 Is Not

Phase 1 explicitly excludes:

- therapy
- coaching
- motivation
- community
- productivity optimization
- emotional support language

---

## Assessment Contract

The assessment measures five parameters:

1. Cognitive load  
2. Mental fatigue  
3. Emotional detachment  
4. Functional exhaustion  
5. Recovery capacity  

It does not measure depression, anxiety, motivation, or values.

---

## Result Type

Results are presented as qualitative categories,
not scores or percentages.

The purpose is understanding, not comparison.

---

## State Categories

The following categories are fixed:

- Functional Load  
- Emerging Burnout  
- Established Burnout  

No numeric scales or severity labels are used.

---

## Question Set v1

- Total questions: 15  
- Timeframe: last 2–4 weeks  
- Unified response scale:
  - Never
  - Rarely
  - Sometimes
  - Often
  - Almost always

Each question maps to exactly one signal.
Each signal maps to exactly one parameter.

---

## Result Logic

Answers are aggregated by parameter.
Parameters form a state profile.
The profile maps to one state category.

No hidden weights.
No opaque scoring.

---

## Result Interpretation

The result screen contains:

1. State title  
2. Brief state description  
3. Explanation of mechanisms  
4. Practical meaning (non-prescriptive)  
5. Optional transition to protocol context  

The result explains what the state means.
It does not tell the user how this is interpreted.

---

## Transition to Protocol

The only allowed framing:

> For cases where burnout signals are persistent,
> a structured approach to recovery is used,
> working with load and recovery as a system.

CTA text:
**View the structured protocol**

No urgency.
No persuasion.

---

## Copy Lock

All terminology, state names, and explanations
defined in Phase 1 are locked.

Any change requires a new product phase.

---

## Phase 1 Status

Phase 1 is complete and closed.

Further development may extend the product,
but must not modify this foundation.
