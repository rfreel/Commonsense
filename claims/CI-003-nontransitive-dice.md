# CI-003: Nontransitive dice

- **Formal verification:** formalized; compiler check pending
- **Writing status:** captured
- **Source module:** [Commonsense/NontransitiveDice.lean](../Commonsense/NontransitiveDice.lean)
- **First recorded:** 2026-10-21

## Common-sense proposition
If A beats B more often and B beats C more often, A should beat C more often.

## Counterexample / result
Dice [2,2,5], [1,4,4], and [3,3,3] produce a win cycle with 5/9, 6/9, and 6/9 pairwise successes.

## Scope and assumptions
Independent uniform sampling of the three face positions for each die; strict comparison; no ties in these comparisons.

## Boundaries, competing explanations
The conclusion is about pairwise winning probabilities, not numerical ordering of expected values.

## Writing seed
There can be no universal champion, even with fixed simple rules.

## Open question
What does this imply for pairwise model-evaluation leaderboards?

## Provenance
Example first formalized in the October 21, 2026 Commonsense discussion. Lean compiler verification was not performed before repository import. Check the Actions result for the commit before changing proof status.
