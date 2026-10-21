# CI-002: Condorcet majority cycle

- **Formal verification:** formalized; compiler check pending
- **Writing status:** captured
- **Source module:** [Commonsense/Condorcet.lean](../Commonsense/Condorcet.lean)
- **First recorded:** 2026-10-21

## Common-sense proposition
A group of internally consistent voters has a consistent majority ranking.

## Counterexample / result
Three cyclically shifted, transitive ballots produce 2–1 pairwise wins A>B, B>C, and C>A.

## Scope and assumptions
Three voters and three candidates; unweighted, strict, complete preference orders; majority decided pairwise.

## Boundaries, competing explanations
This disproves collective transitivity, not individual transitivity. A different voting rule can resolve the selection problem.

## Writing seed
Three rational ballots, no coherent majority winner.

## Open question
Which aggregation procedures preserve transitivity, and what do they sacrifice?

## Provenance
Example first formalized in the October 21, 2026 Commonsense discussion. Lean compiler verification was not performed before repository import. Check the Actions result for the commit before changing proof status.
