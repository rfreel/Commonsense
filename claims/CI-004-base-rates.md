# CI-004: Base rates

**Claim, false:** A test with 99% sensitivity and 95% specificity makes most positive results correct.

**Counterexample:** Of 10,000 people, 99 are true positives, 495 false positives, 1 a false negative, and 9,405 true negatives; only one positive in six is correct.

**Statement and proof:** `Commonsense.base_rate_counterexample` in [Strengthened.lean](../Commonsense/Strengthened.lean), checking the complete confusion matrix, prevalence, sensitivity, specificity, and predictive value.
