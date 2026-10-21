# Writing log

Chronological, append-only observations. These are editorial seeds, not proven generalizations.

## 2026-10-21 | CI-001 | Simpson's paradox

**Intuition:** Superiority within every subgroup guarantees superiority in the aggregate.

**Formal example:** Exact integer cross products show A > B in both strata, while B > A after pooling.

**Status:** Lean proof written; compiler verification pending. Writing captured.

**Writing seed:** “When every subgroup says A wins but the total says B wins.”

**Caution:** The subgroups are weighted differently. This does not mean every aggregation reverses rankings or that treatment A is causally preferable.

**Question:** Can model benchmark rankings reverse when task-mixture weights differ?

---

## 2026-10-21 | CI-002 | Condorcet majority cycle

**Intuition:** A group of internally consistent voters has a consistent majority ranking.

**Formal example:** Three cyclically shifted, transitive ballots produce 2–1 pairwise wins A>B, B>C, and C>A.

**Status:** Lean proof written; compiler verification pending. Writing captured.

**Writing seed:** “Three rational ballots, no coherent majority winner.”

**Caution:** This disproves collective transitivity, not individual transitivity. A different voting rule can resolve the selection problem.

**Question:** Which aggregation procedures preserve transitivity, and what do they sacrifice?

---

## 2026-10-21 | CI-003 | Nontransitive dice

**Intuition:** If A beats B more often and B beats C more often, A should beat C more often.

**Formal example:** Dice [2,2,5], [1,4,4], and [3,3,3] produce a win cycle with 5/9, 6/9, and 6/9 pairwise successes.

**Status:** Lean proof written; compiler verification pending. Writing captured.

**Writing seed:** “There can be no universal champion, even with fixed simple rules.”

**Caution:** The conclusion is about pairwise winning probabilities, not numerical ordering of expected values.

**Question:** What does this imply for pairwise model-evaluation leaderboards?

---

## 2026-10-21 | CI-004 | Base rates and positive tests

**Intuition:** A highly sensitive test generally makes a positive result compelling evidence of the condition.

**Formal example:** A population of 10,000 with prevalence 1%, sensitivity 99%, specificity 95% yields 99 true positives and 495 false positives; PPV = 1/6.

**Status:** Lean proof written; compiler verification pending. Writing captured.

**Writing seed:** “The number behind a positive result is not the number you think.”

**Caution:** Sensitivity and specificity alone do not determine PPV. Prevalence is critical; actual tests vary.

**Question:** Which real decision thresholds explicitly account for base rates?

---

## 2026-10-21 | CI-005 | More choices hurt greedy selection

**Intuition:** Giving a decision algorithm more options cannot worsen its result.

**Formal example:** For amount six, greedy [3,1] uses 2 coins, while greedy [4,3,1] uses 3.

**Status:** Lean proof written; compiler verification pending. Writing captured.

**Writing seed:** “The gift of an additional option that makes the algorithm worse.”

**Caution:** This does not claim that enlarging the feasible set hurts a globally optimal algorithm. It is a failure of the specified heuristic.

**Question:** How can a search procedure detect when its heuristic lacks monotonicity?

---

## 2026-10-21 | CI-006 | Likely separately, unlikely together

**Intuition:** Two individually likely events should themselves be likely to occur together.

**Formal example:** On five equiprobable outcomes, events {0,1,2} and {2,3,4} have probabilities 3/5 and 3/5 but intersection 1/5.

**Status:** Lean proof written; compiler verification pending. Writing captured.

**Writing seed:** “Two good reasons can jointly make a bad prediction.”

**Caution:** Joint probability depends on event dependence; 1/5 is the minimum intersection for two 3/5 events, not a universal value.

**Question:** When do independent-looking evaluation criteria strongly overlap or conflict?


