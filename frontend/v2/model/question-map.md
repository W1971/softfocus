# SoftFocus v2 — Question → Signal Mapping

**Status:** DESIGN-ONLY  
**Phase:** Phase A — Analytical Exploration  
**Scope:** Analytical mapping only (no scoring)  
**Last updated:** 2026-02-11

---

## Purpose

This document defines the explicit mapping between:

- individual questions
- analytical dimensions
- primary and secondary signals

The mapping stabilizes analytical intent
and prevents semantic drift prior to any implementation.

No scoring, weighting, or execution logic is defined here.

---

## Mapping Legend

- **Dimension** — canonical v2 axis component (A / B / C)
- **Subdimension** — structural subdivision inside a dimension
- **Primary Signal** — main analytical signal captured
- **Secondary Signal** — supportive or amplifying signal

---

# DIMENSION A — Load Predictability

Primary signals:
- volatility
- temporal drift
- recovery instability

---

## A1 — Temporal Predictability

| Question ID | Question (short) | Subdimension | Primary Signal | Secondary Signal |
|------------|------------------|--------------|----------------|------------------|
| A1.1 | Workload changes unexpectedly within the same day | Temporal predictability | volatility | temporal drift |
| A1.2 | Planned tasks displaced by urgent inputs | Temporal predictability | volatility | priority erosion |
| A1.3 | Schedule requires continuous re-adjustment | Temporal predictability | temporal drift | instability |
| A1.4 | Day starts without clear task order | Temporal predictability | temporal ambiguity | anticipatory load |
| A1.5 | Timelines shift without explanation | Temporal predictability | volatility | causal opacity |
| A1.6 | Priorities change after work has started | Temporal predictability | priority instability | execution disruption |

---

## A2 — Causal Clarity

| Question ID | Question (short) | Subdimension | Primary Signal | Secondary Signal |
|------------|------------------|--------------|----------------|------------------|
| A2.1 | Unclear why a task became urgent | Causal clarity | causal opacity | reactivity |
| A2.2 | Requests arrive without context | Causal clarity | causal opacity | coordination cost |
| A2.3 | Outcomes depend on invisible factors | Causal clarity | visibility gap | learned helplessness |
| A2.4 | Decisions disconnected from assumptions | Causal clarity | assumption drift | trust erosion |
| A2.5 | Effort does not correlate with progress | Causal clarity | effort–outcome decoupling | demotivation |
| A2.6 | Feeling reactive rather than executing | Causal clarity | reactivity | loss of agency |

---

## A3 — Recovery Predictability

| Question ID | Question (short) | Subdimension | Primary Signal | Secondary Signal |
|------------|------------------|--------------|----------------|------------------|
| A3.1 | Rest fails to restore readiness | Recovery predictability | recovery instability | residual load |
| A3.2 | Downtime feels too short to matter | Recovery predictability | recovery insufficiency | time compression |
| A3.3 | Recovery inconsistent across similar weeks | Recovery predictability | recovery volatility | unpredictability |
| A3.4 | Breaks fail to reduce background tension | Recovery predictability | residual tension | baseline elevation |
| A3.5 | Weekends insufficient for reset | Recovery predictability | incomplete reset | cumulative load |
| A3.6 | Next cycle starts before recovery completes | Recovery predictability | cycle overlap | load carryover |

---

## Notes

- Dimension A captures **environmental instability**, not personal traits.
- Signals here act as **upstream drivers** for Dimensions B and C.
- No interpretation should be performed on Dimension A in isolation.

# DIMENSION B — Control Illusion

Primary signals:
- control–responsibility gap
- compensatory vigilance
- fragile stability

---

## B1 — Perceived vs Actual Control

| Question ID | Question (short) | Subdimension | Primary Signal | Secondary Signal |
|------------|------------------|--------------|----------------|------------------|
| B1.1 | Responsible without decision authority | Perceived vs actual control | control–responsibility gap | role strain |
| B1.2 | Outcomes evaluated without control over inputs | Perceived vs actual control | accountability mismatch | fairness erosion |
| B1.3 | Managing expectations you cannot influence | Perceived vs actual control | expectation burden | emotional load |
| B1.4 | Planning feels symbolic rather than effective | Perceived vs actual control | illusory planning | disengagement |
| B1.5 | Anticipating issues you cannot prevent | Perceived vs actual control | anticipatory helplessness | vigilance load |
| B1.6 | Accountability without execution power | Perceived vs actual control | agency deficit | chronic tension |

---

## B2 — Compensatory Control

| Question ID | Question (short) | Subdimension | Primary Signal | Secondary Signal |
|------------|------------------|--------------|----------------|------------------|
| B2.1 | Increasing effort to offset uncertainty | Compensatory control | compensatory effort | overextension |
| B2.2 | Relying on personal vigilance to keep stability | Compensatory control | compensatory vigilance | cognitive load |
| B2.3 | Over-preparing to avoid disruption | Compensatory control | preventive overdrive | inefficiency |
| B2.4 | Staying mentally “on” to prevent mistakes | Compensatory control | sustained alertness | attentional fatigue |
| B2.5 | Double-checking due to lack of process trust | Compensatory control | process distrust | redundancy |
| B2.6 | Feeling that stopping would cause collapse | Compensatory control | system dependency | fear of disengagement |

---

## B3 — Illusion Stability

| Question ID | Question (short) | Subdimension | Primary Signal | Secondary Signal |
|------------|------------------|--------------|----------------|------------------|
| B3.1 | Sense of control feels fragile | Illusion stability | fragile stability | anxiety |
| B3.2 | Small disruptions break planning | Illusion stability | disruption sensitivity | volatility amplification |
| B3.3 | Control depends on constant attention | Illusion stability | vigilance dependency | attentional lock |
| B3.4 | Relief only after tasks are finished | Illusion stability | delayed relief | sustained tension |
| B3.5 | Delegation increases rather than reduces strain | Illusion stability | delegation paradox | trust deficit |
| B3.6 | Success feels temporary | Illusion stability | impermanence perception | insecurity |

---

## Notes

- Dimension B captures **subjective control compensation**, not actual authority.
- Signals here often mask upstream instability from Dimension A.
- High B scores with low A scores indicate **internalized over-control**.
- High A + high B indicates **systemic instability compensated by vigilance**.

# DIMENSION C — Cognitive Fragmentation

Primary signals:
- attention residue
- decision drag
- integration loss

---

## C1 — Attention Continuity

| Question ID | Question (short) | Subdimension | Primary Signal | Secondary Signal |
|------------|------------------|--------------|----------------|------------------|
| C1.1 | Switching contexts without closure | Attention continuity | attention residue | task leakage |
| C1.2 | Tasks remain mentally open after completion | Attention continuity | attention residue | cognitive persistence |
| C1.3 | Attention split across parallel threads | Attention continuity | attentional fragmentation | divided focus |
| C1.4 | Interruptions leave lasting residue | Attention continuity | interruption residue | recovery delay |
| C1.5 | Focus requires deliberate effort | Attention continuity | effortful focus | mental friction |
| C1.6 | Thinking feels scattered | Attention continuity | cognitive dispersion | loss of coherence |

---

## C2 — Decision Coherence

| Question ID | Question (short) | Subdimension | Primary Signal | Secondary Signal |
|------------|------------------|--------------|----------------|------------------|
| C2.1 | Decisions feel heavier than their impact | Decision coherence | decision overweighting | anticipatory strain |
| C2.2 | Small choices drain disproportionate energy | Decision coherence | decision drag | energy leakage |
| C2.3 | Decision-making feels effortful without clarity | Decision coherence | decision friction | ambiguity |
| C2.4 | Postponing decisions due to overload | Decision coherence | avoidance | backlog accumulation |
| C2.5 | Decision fatigue appears early in the day | Decision coherence | early fatigue | baseline depletion |
| C2.6 | Revisiting resolved questions | Decision coherence | decision loop | cognitive churn |

---

## C3 — Integration Loss

| Question ID | Question (short) | Subdimension | Primary Signal | Secondary Signal |
|------------|------------------|--------------|----------------|------------------|
| C3.1 | Work feels fragmented into unrelated parts | Integration loss | fragmentation | loss of narrative |
| C3.2 | Hard to hold the whole picture | Integration loss | reduced integration | tunnel perception |
| C3.3 | Progress feels disjointed | Integration loss | coherence breakdown | motivational drift |
| C3.4 | Losing track of why something matters | Integration loss | meaning erosion | detachment |
| C3.5 | Work feels mechanical rather than integrated | Integration loss | automation without ownership | alienation |
| C3.6 | Completion lacks satisfaction | Integration loss | closure deficit | emotional flatness |

---

## Notes

- Dimension C reflects **downstream cognitive effects**, not root causes.
- High C with low A/B suggests **local overload** or acute fragmentation.
- High C with high A and B indicates **structural cognitive drift**.
- Interpretation of C requires cross-dimension context.
