# CI-002: Condorcet majority cycle

- **Formal verification:** compiler-verified (Lean 4.24.0; [successful CI run](https://github.com/rfreel/Commonsense/actions/runs/39693844539) on commit `6c7c0c1a`)
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
Example first formalized in the October 21, 2026 Commonsense discussion. The initial draft was unverified; compiler verification succeeded in [GitHub Actions](https://github.com/rfreel/Commonsense/actions/runs/39693844539) on commit `6c7c0c1a244cbead947386d8dc5df3ab72024256` with proof files unchanged.
