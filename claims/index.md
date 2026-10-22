# Claims and proofs

50 claims, each refuted by the linked Lean statement and proof. The English claim is also directly above the theorem in its source file. Definitions and hypotheses specify the exact model; the original six examples have stronger statements under their existing IDs.

| ID | Claim refuted | Lean theorem |
|---|---|---|
| CI-001 | Winning in every subgroup guarantees winning after pooling. | [simpsons_counterexample](../Commonsense/Strengthened.lean) |
| CI-002 | Consistent individual rankings guarantee a transitive majority ranking. | [condorcet_counterexample](../Commonsense/Strengthened.lean) |
| CI-003 | Winning more often than another die is a transitive relation. | [dice_counterexample](../Commonsense/Strengthened.lean) |
| CI-004 | 99% sensitivity and 95% specificity make most positive tests correct. | [base_rate_counterexample](../Commonsense/Strengthened.lean) |
| CI-005 | Adding a denomination cannot worsen descending greedy change. | [greedy_choice_counterexample](../Commonsense/Strengthened.lean) |
| CI-006 | Two individually likely events must be likely together. | [conjunction_counterexample](../Commonsense/Strengthened.lean) |
| CI-007 | Speeds over equal distances can be averaged arithmetically. | [equal_distance_speed](../Commonsense/Averages.lean) |
| CI-008 | Equal percentage gains and losses cancel. | [equal_percentage_gain_loss](../Commonsense/Averages.lean) |
| CI-009 | Averaging two success rates gives the pooled rate. | [average_of_rates](../Commonsense/Averages.lean) |
| CI-010 | Moving one observation cannot raise both group means. | [both_means_rise](../Commonsense/Averages.lean) |
| CI-011 | Squaring a mean equals the mean of the squares. | [square_of_average](../Commonsense/Averages.lean) |
| CI-012 | Positive mean percentage return guarantees growth. | [positive_mean_return_can_lose](../Commonsense/Averages.lean) |
| CI-013 | Pairwise independence implies mutual independence. | [pairwise_not_mutual](../Commonsense/FiniteProbability.lean) |
| CI-014 | Conditioning preserves independence. | [conditioning_creates_dependence](../Commonsense/FiniteProbability.lean) |
| CI-015 | Zero covariance implies independence. | [uncorrelated_not_independent](../Commonsense/FiniteProbability.lean) |
| CI-016 | The most likely alternative must have probability above one-half. | [mode_is_not_majority](../Commonsense/FiniteProbability.lean) |
| CI-017 | A union of unlikely events must be unlikely. | [unlikely_events_cover_everything](../Commonsense/FiniteProbability.lean) |
| CI-018 | Mutually exclusive positive-probability events are independent. | [disjoint_is_not_independent](../Commonsense/FiniteProbability.lean) |
| CI-019 | Identical distributions force random variables to agree. | [same_distribution_never_equal](../Commonsense/FiniteProbability.lean) |
| CI-020 | 99% classification accuracy guarantees detecting some positives. | [high_accuracy_zero_detection](../Commonsense/FiniteProbability.lean) |
| CI-021 | Majority voting among better-than-chance classifiers improves accuracy. | [majority_worse_than_every_member](../Commonsense/FiniteProbability.lean) |
| CI-022 | Winning more often guarantees higher expected payoff. | [usually_wins_lower_expectation](../Commonsense/FiniteProbability.lean) |
| CI-023 | P(A given B) equals P(B given A). | [reversed_conditionals](../Commonsense/Inference.lean) |
| CI-024 | Two independent likely events must be likely together. | [independent_likely_conjunction_unlikely](../Commonsense/Inference.lean) |
| CI-025 | A repeated positive test necessarily improves predictive value. | [repeated_result_adds_no_information](../Commonsense/Inference.lean) |
| CI-026 | Extending a sample always improves its mean estimate. | [larger_sample_can_be_worse](../Commonsense/Inference.lean) |
| CI-027 | Every task having a solver implies one solver handles every task. | [every_task_some_solver_not_one_solver_all](../Commonsense/Inference.lean) |
| CI-028 | Better training accuracy guarantees better held-out accuracy. | [training_winner_test_loser](../Commonsense/Inference.lean) |
| CI-029 | A strict local minimum must be a global minimum. | [local_not_global](../Commonsense/GreedyAlgorithms.lean) |
| CI-030 | Highest-value-first packing maximizes total value. | [largest_value_greedy_fails](../Commonsense/GreedyAlgorithms.lean) |
| CI-031 | Value-per-weight greedy packing solves indivisible knapsack. | [density_greedy_fails](../Commonsense/GreedyAlgorithms.lean) |
| CI-032 | More cache slots cannot increase misses under a fixed policy. | [more_memory_more_fifo_misses](../Commonsense/GreedyAlgorithms.lean) |
| CI-033 | Nearest-neighbor touring gives the shortest tour, even on a line. | [nearest_neighbor_tour_fails](../Commonsense/GreedyAlgorithms.lean) |
| CI-034 | Earliest-deadline-first minimizes the number of late jobs. | [earliest_deadline_not_fewest_late](../Commonsense/GreedyAlgorithms.lean) |
| CI-035 | Individually dominant choices guarantee the best joint outcome. | [individually_dominant_collectively_worse](../Commonsense/Games.lean) |
| CI-036 | Every finite game has an equilibrium in deterministic actions. | [no_pure_equilibrium](../Commonsense/Games.lean) |
| CI-037 | Pareto efficiency implies maximum total utility. | [pareto_not_maximum_total](../Commonsense/Games.lean) |
| CI-038 | A unique plurality winner cannot lose to every rival head-to-head. | [plurality_winner_pairwise_loser](../Commonsense/Voting.lean) |
| CI-039 | Raising a winning candidate on ballots cannot make them lose instant runoff. | [raising_candidate_makes_them_lose](../Commonsense/Voting.lean) |
| CI-040 | Removing a losing candidate cannot change the plurality winner. | [losing_candidate_changes_winner](../Commonsense/Voting.lean) |
| CI-041 | Adding a road cannot make all drivers worse at equilibrium. | [adding_road_worsens_equilibrium](../Commonsense/Networks.lean) |
| CI-042 | An inclusion-maximal matching must have maximum size. | [maximal_not_maximum_matching](../Commonsense/Networks.lean) |
| CI-043 | A minimum spanning tree preserves all shortest paths. | [minimum_tree_not_shortest_paths](../Commonsense/Networks.lean) |
| CI-044 | Pairwise-overlapping sets have a common element. | [pairwise_overlap_no_common_element](../Commonsense/Networks.lean) |
| CI-045 | An injective self-map must be surjective. | [injective_not_surjective](../Commonsense/Infinite.lean) |
| CI-046 | A surjective self-map must be injective. | [surjective_not_injective](../Commonsense/Infinite.lean) |
| CI-047 | Uniform people and uniform friendship endpoints have the same mean degree. | [friendship_endpoint_bias](../Commonsense/Networks.lean) |
| CI-048 | After an informed host reveals a goat, staying and switching are equally likely. | [switching_is_not_fifty_fifty](../Commonsense/MoreExamples.lean) |
| CI-049 | Expected payout one makes a positive payout likely. | [expectation_one_usually_zero](../Commonsense/MoreExamples.lean) |
| CI-050 | The median of equal-size group medians equals the pooled median. | [median_of_medians_not_pooled](../Commonsense/MoreExamples.lean) |
