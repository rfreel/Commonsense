# Commonsense

Machine-checkable counterexamples to plausible intuitions, with separate claim records and an append-only writing log.

## Start here

- [Claim index](claims/index.md) — six initial counterintuitive claims, each linked to a Lean proof.
- [Writing log](writing/idea-log.md) — dated observations and ideas for later articles.
- [Lean source](Commonsense.lean) — imports all six examples.
- [Verification policy](CONTRIBUTING.md) — tracks claims, assumptions, proof checks, and writing independently.

## Verify locally

Install [Lean 4 and Lake](https://lean-lang.org/lean4/doc/setup.html), then:

```sh
lake build
```

GitHub Actions performs the same build on pushed commits and pull requests.

**Provenance:** The initial six examples originated in an October 21, 2026 discussion. The original proofs had not been checked in a Lean compiler when drafted; GitHub Actions is the first independent compiler gate. Formal proofs establish the specific encoded propositions, not unrestricted empirical interpretations.
