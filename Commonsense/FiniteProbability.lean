import Std
import Commonsense.NontransitiveDice

namespace Commonsense.FiniteProbability

/-- Every event below is evaluated on n equally likely outcomes 0,...,n-1. -/
def count (n : Nat) (event : Nat → Bool) : Nat :=
  ((List.range n).filter event).length

def inter (a b : Nat → Bool) : Nat → Bool := fun i => a i && b i

abbrev independent (n : Nat) (a b : Nat → Bool) : Prop :=
  count n (inter a b) * n = count n a * count n b

def a (i : Nat) : Bool := decide (i < 2)
def b (i : Nat) : Bool := decide (i % 2 = 0)
def xorEvent (i : Nat) : Bool := a i != b i

/-- CI-013. False: pairwise independence implies mutual independence.
Three events on four equally likely outcomes are pairwise independent,
but their triple intersection does not have the product probability. -/
theorem pairwise_not_mutual :
    independent 4 a b ∧ independent 4 a xorEvent ∧
    independent 4 b xorEvent ∧
    count 4 (inter (inter a b) xorEvent) * 4 * 4 ≠
      count 4 a * count 4 b * count 4 xorEvent := by
  decide

def selected (i : Nat) : Bool := a i || b i

/-- CI-014. False: independent events remain independent after selecting
only outcomes where at least one occurs. Here selection creates dependence. -/
theorem conditioning_creates_dependence :
    independent 4 a b ∧ count 4 selected = 3 ∧
    count 4 (inter (inter a b) selected) * count 4 selected ≠
      count 4 (inter a selected) * count 4 (inter b selected) := by
  decide

def x (i : Nat) : Int := if i = 0 then -1 else if i = 1 then 0 else 1
def y (i : Nat) : Int := x i * x i

def total (n : Nat) (f : Nat → Int) : Int := ((List.range n).map f).sum

/-- CI-015. False: zero covariance implies independence. X is uniform on
{-1,0,1}, Y=X^2. Covariance is zero, but the zero events are dependent. -/
theorem uncorrelated_not_independent :
    total 3 (fun i => x i * y i) * 3 = total 3 x * total 3 y ∧
    ¬ independent 3 (fun i => x i == 0) (fun i => y i == 0) := by
  decide

def weights (i : Fin 3) : Nat := if i = 0 then 4 else 3

/-- CI-016. False: the most likely of three alternatives must have probability
above one-half. The unique mode has weight 4 out of 10. -/
theorem mode_is_not_majority :
    (∀ j : Fin 3, j ≠ 0 → weights 0 > weights j) ∧
    2 * weights 0 < weights 0 + weights 1 + weights 2 := by
  decide

/-- CI-017. False: a union of individually unlikely events must be unlikely.
Five singleton events each have probability 1/5, but their union is certain. -/
theorem unlikely_events_cover_everything :
    (∀ k : Fin 5, 2 * count 5 (fun i => i == k.val) < 5) ∧
    count 5 (fun i => (List.range 5).any (fun k => i == k)) = 5 := by
  decide

/-- CI-018. False: mutually exclusive positive-probability events are independent. -/
theorem disjoint_is_not_independent :
    count 2 (fun i => i == 0) = 1 ∧
    count 2 (fun i => i == 1) = 1 ∧
    count 2 (fun i => (i == 0) && (i == 1)) = 0 ∧
    ¬ independent 2 (fun i => i == 0) (fun i => i == 1) := by
  decide

/-- CI-019. False: two random variables with the same distribution must agree.
On two uniform outcomes, X=i and Y=1-i have identical marginals and never agree. -/
theorem same_distribution_never_equal :
    (∀ k : Fin 2,
      count 2 (fun i => i == k.val) = count 2 (fun i => 1 - i == k.val)) ∧
    count 2 (fun i => i == 1 - i) = 0 := by
  decide

/-- CI-020. False: 99% classification accuracy guarantees detecting at least
one positive when positives exist. This classifier misses every positive. -/
theorem high_accuracy_zero_detection :
    ∃ tp fp fn tn : Nat,
      tp + fp + fn + tn = 100 ∧ tp + tn = 99 ∧
      0 < tp + fn ∧ tp = 0 := by
  refine ⟨0, 0, 1, 99, ?_⟩
  decide

/-- Predictions on five equally likely binary tasks whose correct answer is true. -/
def expert (j : Fin 3) (i : Nat) : Bool := decide (i < 2 ∨ i = j.val + 2)
def majority (i : Nat) : Bool :=
  decide ((([0, 1, 2] : List (Fin 3)).filter (fun j => expert j i)).length ≥ 2)

/-- CI-021. False: majority voting among better-than-chance classifiers must
improve accuracy. Each is 60% correct, while their majority is only 40% correct. -/
theorem majority_worse_than_every_member :
    (∀ j : Fin 3, count 5 (expert j) = 3) ∧ count 5 majority = 2 := by
  decide

/-- CI-022. False: winning more often means having the larger expected payoff.
For independent uniform face draws, [3,3,3] usually wins against [0,0,100]
but has a much smaller mean payoff. -/
theorem usually_wins_lower_expectation :
    ∃ first second : List Nat,
      first.length = 3 ∧ second.length = 3 ∧
      2 * Commonsense.faceWins first second > first.length * second.length ∧
      first.sum * second.length < second.sum * first.length := by
  refine ⟨[3, 3, 3], [0, 0, 100], ?_⟩
  decide

end Commonsense.FiniteProbability
