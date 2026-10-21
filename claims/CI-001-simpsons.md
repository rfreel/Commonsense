# CI-001: Simpson's paradox

- **Formal verification:** formalized; compiler check pending
- **Writing status:** captured
- **Source module:** [Commonsense/Simpsons.lean](../Commonsense/Simpsons.lean)
- **First recorded:** 2026-10-21

## Common-sense proposition
Superiority within every subgroup guarantees superiority in the aggregate.

## Counterexample / result
Exact integer cross products show A > B in both strata, while B > A after pooling.

## Scope and assumptions
A: 81/87 vs B: 234/270 in group 1; A: 192/263 vs B: 55/80 in group 2; pooled A: 273/350 vs B: 289/350.

## Boundaries, competing explanations
The subgroups are weighted differently. This does not mean every aggregation reverses rankings or that treatment A is causally preferable.

## Writing seed
When every subgroup says A wins but the total says B wins.

## Open question
Can model benchmark rankings reverse when task-mixture weights differ?

## Provenance
Example first formalized in the October 21, 2026 Commonsense discussion. Lean compiler verification was not performed before repository import. Check the Actions result for the commit before changing proof status.
