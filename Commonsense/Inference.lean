import Commonsense.FiniteProbability

namespace Commonsense.Inference
open Commonsense.FiniteProbability

def rare (i : Nat) : Bool := i == 0
def broad (i : Nat) : Bool := decide (i < 5)

/-- CI-023. False: P(A|B) equals P(B|A). On ten uniform outcomes,
A={0}, B={0,...,4}; the conditional probabilities are 1/5 and 1. -/
theorem reversed_conditionals :
    0 < count 10 rare ∧ 0 < count 10 broad ∧
    count 10 (inter rare broad) * count 10 rare ≠
      count 10 (inter rare broad) * count 10 broad := by
  decide

def row (i : Nat) : Bool := decide (i / 3 < 2)
def column (i : Nat) : Bool := decide (i % 3 < 2)

/-- CI-024. False: independence makes the conjunction of two likely events
likely. Each event has probability 2/3; their independent intersection has 4/9. -/
theorem independent_likely_conjunction_unlikely :
    independent 9 row column ∧
    2 * count 9 row > 9 ∧ 2 * count 9 column > 9 ∧
    2 * count 9 (inter row column) < 9 := by
  decide

def positive (i : Nat) : Bool := decide (i < 4)
def affectedCase (i : Nat) : Bool := i == 0

/-- CI-025. False: a second positive result necessarily improves predictive
value. With perfectly repeated results, one positive and two positives both
have one affected case out of four on this eight-person population. -/
theorem repeated_result_adds_no_information :
    count 8 positive = 4 ∧ count 8 (inter positive positive) = 4 ∧
    count 8 (inter affectedCase positive) = 1 ∧
    count 8 (inter affectedCase (inter positive positive)) = 1 := by
  decide

/-- CI-026. False: extending a sample always brings its mean closer to the
population mean. For a fair binary population, [0,1] is exactly centered,
but appending another possible observation, 1, moves its mean away from 1/2. -/
theorem larger_sample_can_be_worse :
    ∃ small large : List Nat,
      small.length = 2 ∧ large = small ++ [1] ∧
      small.length < large.length ∧
      large.all (fun v => (v == 0) || (v == 1)) = true ∧
      2 * small.sum = small.length ∧ 2 * large.sum ≠ large.length := by
  refine ⟨[0, 1], [0, 1, 1], ?_⟩
  decide

/-- CI-027. False: if every task has a solver, one solver handles every task.
Each of two tasks has a matching specialist, but no specialist matches both. -/
theorem every_task_some_solver_not_one_solver_all :
    (∀ task : Bool, ∃ solver : Bool, solver = task) ∧
    ¬ (∃ solver : Bool, ∀ task : Bool, solver = task) := by
  decide

def truth (i : Nat) : Bool := decide (i % 2 = 0)
def fitted (i : Nat) : Bool := (i == 0) || (i == 3)
def general (i : Nat) : Bool := i != 3

def correct (cases : List Nat) (predict : Nat → Bool) : Nat :=
  (cases.filter (fun i => predict i == truth i)).length

/-- CI-028. False: better training accuracy guarantees better held-out accuracy.
The fitted rule wins 2-1 on training cases and loses 0-2 on disjoint test cases. -/
theorem training_winner_test_loser :
    correct [0, 1] fitted = 2 ∧ correct [0, 1] general = 1 ∧
    correct [2, 3] fitted = 0 ∧ correct [2, 3] general = 2 := by
  decide

end Commonsense.Inference
