# CI-002: Condorcet majority cycle

**Claim, false:** Strict, complete, transitive individual rankings produce a transitive pairwise-majority ranking.

**Counterexample:** Three cyclically shifted rankings give majority preferences A>B, B>C, C>A.

**Statement and proof:** `Commonsense.condorcet_counterexample` in [Strengthened.lean](../Commonsense/Strengthened.lean), checking the individual ranking properties as well as collective nontransitivity.
