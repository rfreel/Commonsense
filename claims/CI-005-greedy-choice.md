# CI-005: More choices hurt greedy selection

- **Formal verification:** compiler-verified (Lean 4.24.0; [successful CI run](https://github.com/rfreel/Commonsense/actions/runs/39693844539) on commit `6c7c0c1a`)
- **Writing status:** captured
- **Source module:** [Commonsense/GreedyChoice.lean](../Commonsense/GreedyChoice.lean)
- **First recorded:** 2026-10-21

## Common-sense proposition
Giving a decision algorithm more options cannot worsen its result.

## Counterexample / result
For amount six, greedy [3,1] uses 2 coins, while greedy [4,3,1] uses 3.

## Scope and assumptions
Canonical descending-denomination greedy rule; objective is minimum coin count; amount 6.

## Boundaries, competing explanations
This does not claim that enlarging the feasible set hurts a globally optimal algorithm. It is a failure of the specified heuristic.

## Writing seed
The gift of an additional option that makes the algorithm worse.

## Open question
How can a search procedure detect when its heuristic lacks monotonicity?

## Provenance
Example first formalized in the October 21, 2026 Commonsense discussion. The initial draft was unverified; compiler verification succeeded in [GitHub Actions](https://github.com/rfreel/Commonsense/actions/runs/39693844539) on commit `6c7c0c1a244cbead947386d8dc5df3ab72024256` with proof files unchanged.
