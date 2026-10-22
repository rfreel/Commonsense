# CI-005: More choices can hurt greedy selection

**Claim, false:** Adding a coin denomination cannot worsen descending greedy change.

**Counterexample:** For amount 6, [3,1] yields [3,3], whereas [4,3,1] yields [4,1,1].

**Statement and proof:** `Commonsense.greedy_choice_counterexample` in [Strengthened.lean](../Commonsense/Strengthened.lean), running the same recursive greedy procedure on both menus and checking the sums and coin counts.
