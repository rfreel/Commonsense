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


---

## 2026-10-21 | Verification update | CI-001–CI-006

The first CI build failed during environment configuration because the project lacked a `lake-manifest.json`, before any theorem was compiled. The manifest was committed, and a subsequent [Lean 4.24.0 CI run](https://github.com/rfreel/Commonsense/actions/runs/39693844539) passed for commit `6c7c0c1a244cbead947386d8dc5df3ab72024256`. All six proof modules are now compiler-verified as of that commit. This later observation supersedes the *status* in the earlier entries without rewriting the historical entries. No empirical or universal interpretation was thereby established.

---

## 2026-10-21 | Claim-proof pass

CI-001: Valid subgroup success rates can reverse when pooled (`Commonsense.simpsons_counterexample`).

CI-002: Strict, complete, transitive ballots can produce a nontransitive majority (`Commonsense.condorcet_counterexample`).

CI-003: More-than-half face-pair victories do not form a transitive relation (`Commonsense.dice_counterexample`).

CI-004: The full confusion matrix confirms that only one positive in six need be correct (`Commonsense.base_rate_counterexample`).

CI-005: Running the same greedy coin procedure with an extra denomination increases its coin count (`Commonsense.greedy_choice_counterexample`).

CI-006: Two majority-probability events can have a minority-probability intersection (`Commonsense.conjunction_counterexample`).

CI-007: Equal-distance average speed need not equal the arithmetic mean of speeds (`Commonsense.Averages.equal_distance_speed`).

CI-008: Equal percentage gains and losses can leave a net loss (`Commonsense.Averages.equal_percentage_gain_loss`).

CI-009: Averaging rates without their sample-size weights can misstate the pooled rate (`Commonsense.Averages.average_of_rates`).

CI-010: Moving one unchanged observation can raise both group means (`Commonsense.Averages.both_means_rise`).

CI-011: The square of a mean need not equal the mean square (`Commonsense.Averages.square_of_average`).

CI-012: Positive mean percentage returns can coexist with shrinking wealth (`Commonsense.Averages.positive_mean_return_can_lose`).

CI-013: Every pair can be independent while the triple is dependent (`Commonsense.FiniteProbability.pairwise_not_mutual`).

CI-014: Selection can create dependence between initially independent events (`Commonsense.FiniteProbability.conditioning_creates_dependence`).

CI-015: Zero covariance can conceal exact nonlinear dependence (`Commonsense.FiniteProbability.uncorrelated_not_independent`).

CI-016: Being the most likely alternative need not mean being more likely than not (`Commonsense.FiniteProbability.mode_is_not_majority`).

CI-017: Unlikely events can collectively cover every outcome (`Commonsense.FiniteProbability.unlikely_events_cover_everything`).

CI-018: Mutual exclusion is not independence (`Commonsense.FiniteProbability.disjoint_is_not_independent`).

CI-019: Identically distributed random variables can disagree on every outcome (`Commonsense.FiniteProbability.same_distribution_never_equal`).

CI-020: A 99%-accurate classifier can miss every positive (`Commonsense.FiniteProbability.high_accuracy_zero_detection`).

CI-021: Three 60%-accurate classifiers can produce a 40%-accurate majority (`Commonsense.FiniteProbability.majority_worse_than_every_member`).

CI-022: The usually winning lottery can have the lower expected payoff (`Commonsense.FiniteProbability.usually_wins_lower_expectation`).

CI-023: Reversing a conditional can change its probability from one-fifth to one (`Commonsense.Inference.reversed_conditionals`).

CI-024: Independence still allows two likely events to have an unlikely conjunction (`Commonsense.Inference.independent_likely_conjunction_unlikely`).

CI-025: Perfectly repeated positive results need not add information (`Commonsense.Inference.repeated_result_adds_no_information`).

CI-026: One extra valid observation can worsen an exact sample-mean estimate (`Commonsense.Inference.larger_sample_can_be_worse`).

CI-027: A specialist for every task does not imply a universal solver (`Commonsense.Inference.every_task_some_solver_not_one_solver_all`).

CI-028: The training winner can be the held-out loser (`Commonsense.Inference.training_winner_test_loser`).

CI-029: Beating both neighboring choices does not establish a global minimum (`Commonsense.GreedyAlgorithms.local_not_global`).

CI-030: A highest-value-first packing can block a better feasible combination (`Commonsense.GreedyAlgorithms.largest_value_greedy_fails`).

CI-031: Value density does not solve indivisible knapsack (`Commonsense.GreedyAlgorithms.density_greedy_fails`).

CI-032: A fourth FIFO cache slot can increase misses from nine to ten (`Commonsense.GreedyAlgorithms.more_memory_more_fifo_misses`).

CI-033: Strict nearest-neighbor choices can produce a longer tour even on a line (`Commonsense.GreedyAlgorithms.nearest_neighbor_tour_fails`).

CI-034: Earliest-deadline-first can create more late jobs than another ordering (`Commonsense.GreedyAlgorithms.earliest_deadline_not_fewest_late`).

CI-035: Individually dominant actions can make both players worse off (`Commonsense.Games.individually_dominant_collectively_worse`).

CI-036: A finite game need not have a pure-strategy equilibrium (`Commonsense.Games.no_pure_equilibrium`).

CI-037: Pareto efficiency need not maximize total utility (`Commonsense.Games.pareto_not_maximum_total`).

CI-038: A plurality winner can lose to every rival head-to-head (`Commonsense.Voting.plurality_winner_pairwise_loser`).

CI-039: Three voters raising a candidate can turn an instant-runoff win into a loss (`Commonsense.Voting.raising_candidate_makes_them_lose`).

CI-040: Removing a losing candidate can reverse the surviving plurality winner (`Commonsense.Voting.losing_candidate_changes_winner`).

CI-041: A zero-cost connecting road can raise every driver's equilibrium cost (`Commonsense.Networks.adding_road_worsens_equilibrium`).

CI-042: A matching that cannot be extended can still be smaller than another matching (`Commonsense.Networks.maximal_not_maximum_matching`).

CI-043: The cheapest spanning tree can lengthen a shortest route (`Commonsense.Networks.minimum_tree_not_shortest_paths`).

CI-044: Pairwise overlaps need not supply a shared element (`Commonsense.Networks.pairwise_overlap_no_common_element`).

CI-045: Successor is a one-to-one self-map that does not reach zero (`Commonsense.Infinite.injective_not_surjective`).

CI-046: Predecessor is an onto self-map that sends two inputs to zero (`Commonsense.Infinite.surjective_not_injective`).

CI-047: Sampling friendship endpoints overrepresents high-degree people in a star (`Commonsense.Networks.friendship_endpoint_bias`).

CI-048: An informed host's reveal can leave switching twice as successful as staying (`Commonsense.MoreExamples.switching_is_not_fifty_fifty`).

CI-049: An expected payout of one can coexist with a 99% chance of zero (`Commonsense.MoreExamples.expectation_one_usually_zero`).

CI-050: Equal-size group medians can yield four while the pooled median is five (`Commonsense.MoreExamples.median_of_medians_not_pooled`).
