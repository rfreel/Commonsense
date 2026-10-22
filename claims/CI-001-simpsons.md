# CI-001: Simpson's paradox

**Claim, false:** If A has a higher success rate than B in every subgroup, A has a higher pooled success rate.

**Counterexample:** A wins 81/87 versus 234/270 and 192/263 versus 55/80, but loses 273/350 versus 289/350 when pooled.

**Statement and proof:** `Commonsense.simpsons_counterexample` in [Strengthened.lean](../Commonsense/Strengthened.lean), including positive denominators and valid success counts.
