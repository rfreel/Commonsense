# CI-006: Likely separately, unlikely together

**Claim, false:** Two more-likely-than-not events have a more-likely-than-not intersection.

**Counterexample:** On five uniform outcomes, {0,1,2} and {2,3,4} each have probability 3/5, but their intersection has probability 1/5.

**Statement and proof:** `Commonsense.conjunction_counterexample` in [Strengthened.lean](../Commonsense/Strengthened.lean), comparing the exact event counts against one-half of the sample space.
