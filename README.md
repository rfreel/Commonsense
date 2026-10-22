# Commonsense

Claim → Lean proof → next claim.

**80 claim-proof pairs:** the original six strengthened and 74 additional counterexamples. Each English claim sits immediately above its formal statement and proof in the Lean source. Necessary assumptions are encoded in the statement and its definitions.

Start with the [claim index](claims/index.md). For later writing, use the [one-sentence log entries](writing/idea-log.md).

## Build

The project pins Lean 4.24.0 and uses Lean's standard library, without Mathlib.

```sh
lake build --wfail
```

The existing GitHub Actions workflow runs this build. [Commonsense.lean](Commonsense.lean) imports every proof module.

## Contents

| Claims | Subject | Source |
|---|---|---|
| CI-001–006 | Stronger versions of the original six | [Strengthened](Commonsense/Strengthened.lean) |
| CI-007–012 | Averages and percentage changes | [Averages](Commonsense/Averages.lean) |
| CI-013–022 | Finite probability and classification | [FiniteProbability](Commonsense/FiniteProbability.lean) |
| CI-023–028 | Conditioning, sampling, and inference | [Inference](Commonsense/Inference.lean) |
| CI-029–034 | Greedy algorithms, caches, and scheduling | [GreedyAlgorithms](Commonsense/GreedyAlgorithms.lean) |
| CI-035–037 | Games and efficiency | [Games](Commonsense/Games.lean) |
| CI-038–040 | Voting | [Voting](Commonsense/Voting.lean) |
| CI-041–044, CI-047 | Networks, matchings, and sets | [Networks](Commonsense/Networks.lean) |
| CI-045–046 | Infinite sets | [Infinite](Commonsense/Infinite.lean) |
| CI-048–050 | Monty Hall, expectation, and medians | [MoreExamples](Commonsense/MoreExamples.lean) |
| CI-051–055 | Apportionment and voting power | [Allocation](Commonsense/Allocation.lean) |
| CI-056–059 | Bin-packing reversals | [Packing](Commonsense/Packing.lean) |
| CI-060–064 | Scheduling and competing objectives | [Scheduling](Commonsense/Scheduling.lean) |
| CI-065–069 | Moments, calibration, and prediction losses | [StatisticalPitfalls](Commonsense/StatisticalPitfalls.lean) |
| CI-070–074 | Transformations, units, and geometry | [Transformations](Commonsense/Transformations.lean) |
| CI-075–076 | Graph paths and degree sequences | [GraphShapes](Commonsense/GraphShapes.lean) |
| CI-077–080 | Coding, confidence, and infinite limits | [CodingAndLimits](Commonsense/CodingAndLimits.lean) |

The original six proof modules are retained; their stronger statements keep the same claim IDs rather than being counted as new discoveries.

## Expert claims, missing premises

The [E-series](claims/index.md#expert-conclusions-and-missing-premises) proves small counterexamples in which a narrow technical result is correct but a broader conclusion fails. Start with [six examples](Commonsense/ExpertClaims.lean) spanning wrong objectives, omitted constraints, aggregation, distribution shift, requirements mismatch and inference overreach. These are formal toy models, not claims about the intent or competence of particular experts.
