# CI-004: Base rates and positive tests

- **Formal verification:** formalized; compiler check pending
- **Writing status:** captured
- **Source module:** [Commonsense/BaseRates.lean](../Commonsense/BaseRates.lean)
- **First recorded:** 2026-10-21

## Common-sense proposition
A highly sensitive test generally makes a positive result compelling evidence of the condition.

## Counterexample / result
A population of 10,000 with prevalence 1%, sensitivity 99%, specificity 95% yields 99 true positives and 495 false positives; PPV = 1/6.

## Scope and assumptions
The counts are stipulated; this is a toy diagnostic scenario, not clinical performance data.

## Boundaries, competing explanations
Sensitivity and specificity alone do not determine PPV. Prevalence is critical; actual tests vary.

## Writing seed
The number behind a positive result is not the number you think.

## Open question
Which real decision thresholds explicitly account for base rates?

## Provenance
Example first formalized in the October 21, 2026 Commonsense discussion. Lean compiler verification was not performed before repository import. Check the Actions result for the commit before changing proof status.
