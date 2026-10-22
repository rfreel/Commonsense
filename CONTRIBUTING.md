# Adding a claim

Write a plain-English claim, then its formal statement and Lean proof. For a false claim, prove an explicit counterexample. Put necessary assumptions in the statement and definitions rather than silently weakening the English claim.

Use a new stable `CI-NNN` ID for a genuinely different claim. Strengthening a proof keeps its existing ID. Put related claims together in a Lean module and import that module from `Commonsense.lean`.

Add the claim and theorem reference to `claims/index.md`. Append one sentence and the fully qualified theorem name to `writing/idea-log.md`; preserve earlier entries.

Run the existing build and fix failures before retaining the result:

```sh
lake build --wfail
```

No unfinished proofs, assumed answers, or new evidence framework. Keep the work on claims and proofs.
