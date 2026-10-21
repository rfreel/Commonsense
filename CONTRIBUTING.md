# Evidence and verification policy

## Record boundaries

1. **Lean source** states a narrow formal proposition, its exact assumptions, and a proof.
2. **Claim record** states the informal intuition, counterexample, alternative explanations, limits, and a link to Lean.
3. **Writing log** records chronological observations and hypotheses. Entries are append-only; corrections get new dated entries referencing earlier ones.
4. **Evidence** holds source identifiers and provenance for *empirical* claims, if introduced later.

## Status definitions

Formal verification: `candidate` → `formalized` → `compiler-verified` → `independently-reviewed`.
Writing: `captured` → `investigating` → `outlined` → `drafted` → `published`.

A proof is **compiler-verified** only after a passing `lake build` on the pinned toolchain, with the successful commit/check recorded. A checked statement does not automatically substantiate its explanatory or empirical interpretation.

## New claim procedure

Give each new claim a stable, never-recycled `CI-NNN` identifier. Add `Commonsense/<Topic>.lean`; import it in `Commonsense.lean`; add `claims/CI-NNN-<slug>.md`; update `claims/index.md`. Append a dated entry to `writing/idea-log.md`. Cite primary sources when claims depend on historical or empirical facts. State assumptions and plausible counterexamples to the interpretation.

Do not replace past log entries. Correct with new entries, preserving provenance.
