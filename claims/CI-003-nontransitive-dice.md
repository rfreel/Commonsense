# CI-003: Nontransitive dice

**Claim, false:** If A beats B more often and B beats C more often, A beats C more often.

**Counterexample:** Independent uniform draws from [2,2,5], [1,4,4], [3,3,3] produce a win cycle.

**Statement and proof:** `Commonsense.dice_counterexample` in [Strengthened.lean](../Commonsense/Strengthened.lean), defining a win advantage as more than half of all face-position pairs.
