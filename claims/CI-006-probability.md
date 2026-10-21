# CI-006: Likely separately, unlikely together

- **Formal verification:** compiler-verified (Lean 4.24.0; [successful CI run](https://github.com/rfreel/Commonsense/actions/runs/39693844539) on commit `6c7c0c1a`)
- **Writing status:** captured
- **Source module:** [Commonsense/Probability.lean](../Commonsense/Probability.lean)
- **First recorded:** 2026-10-21

## Common-sense proposition
Two individually likely events should themselves be likely to occur together.

## Counterexample / result
On five equiprobable outcomes, events {0,1,2} and {2,3,4} have probabilities 3/5 and 3/5 but intersection 1/5.

## Scope and assumptions
Uniform finite sample space and exactly the specified event sets.

## Boundaries, competing explanations
Joint probability depends on event dependence; 1/5 is the minimum intersection for two 3/5 events, not a universal value.

## Writing seed
Two good reasons can jointly make a bad prediction.

## Open question
When do independent-looking evaluation criteria strongly overlap or conflict?

## Provenance
Example first formalized in the October 21, 2026 Commonsense discussion. The initial draft was unverified; compiler verification succeeded in [GitHub Actions](https://github.com/rfreel/Commonsense/actions/runs/39693844539) on commit `6c7c0c1a244cbead947386d8dc5df3ab72024256` with proof files unchanged.
