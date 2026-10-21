# CI-005: More choices hurt greedy selection

- **Formal verification:** formalized; compiler check pending
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
Example first formalized in the October 21, 2026 Commonsense discussion. Lean compiler verification was not performed before repository import. Check the Actions result for the commit before changing proof status.
