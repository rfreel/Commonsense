import Std
import Commonsense.Simpsons
import Commonsense.Condorcet
import Commonsense.NontransitiveDice
import Commonsense.BaseRates
import Commonsense.GreedyChoice
import Commonsense.Probability

namespace Commonsense

/-- CI-001. False: valid success rates that win in both groups must win when pooled.
All denominators are positive and all successes are at most their trial counts. -/
theorem simpsons_counterexample :
    ∃ a n b m c k d l : Nat,
      (0 < n ∧ a ≤ n) ∧ (0 < m ∧ b ≤ m) ∧
      (0 < k ∧ c ≤ k) ∧ (0 < l ∧ d ≤ l) ∧
      a * m > b * n ∧ c * l > d * k ∧
      (a + c) * (m + l) < (b + d) * (n + k) := by
  refine ⟨81, 87, 234, 270, 192, 263, 55, 80, ?_⟩
  decide

/-- CI-002. False: strict, complete, transitive individual rankings guarantee a
transitive pairwise-majority ranking. The existing three ballots refute this. -/
theorem condorcet_counterexample :
    (∀ v a : Fin 3, voterPrefers v a a = false) ∧
    (∀ v a b c : Fin 3,
      voterPrefers v a b = true → voterPrefers v b c = true →
      voterPrefers v a c = true) ∧
    (∀ v a b : Fin 3, a ≠ b →
      voterPrefers v a b = true ∨ voterPrefers v b a = true) ∧
    ¬ (∀ a b c : Fin 3,
      1 < supportCount a b → 1 < supportCount b c →
      1 < supportCount a c) := by
  decide

def winsMore (a b : List Nat) : Prop :=
  2 * faceWins a b > a.length * b.length

/-- CI-003. False: winning more than half of independent, uniform face-pair
comparisons is transitive, even for three nonempty three-sided dice. -/
theorem dice_counterexample :
    ∃ a b c : List Nat,
      a.length = 3 ∧ b.length = 3 ∧ c.length = 3 ∧
      winsMore a b ∧ winsMore b c ∧ ¬ winsMore a c := by
  refine ⟨[2, 2, 5], [1, 4, 4], [3, 3, 3], ?_⟩
  decide

/-- CI-004. False: 99% sensitivity and 95% specificity force most positive
results to be correct. This complete confusion matrix has 1% prevalence
and exactly one true positive per six positive results. -/
theorem base_rate_counterexample :
    ∃ tp fp fn tn : Nat,
      tp + fp + fn + tn = 10000 ∧
      (tp + fn) * 100 = 10000 ∧
      tp * 100 = 99 * (tp + fn) ∧
      tn * 100 = 95 * (fp + tn) ∧
      0 < tp + fp ∧ 6 * tp = tp + fp ∧ 2 * tp < tp + fp := by
  refine ⟨99, 495, 1, 9405, ?_⟩
  decide

/-- Take as many coins as possible at each denomination, in the supplied order. -/
def greedyCoins : List Nat → Nat → List Nat
  | [], _ => []
  | d :: ds, amount =>
      List.replicate (amount / d) d ++ greedyCoins ds (amount % d)

/-- CI-005. False: adding a denomination cannot worsen descending greedy change.
Both outputs pay the same amount exactly; the larger menu uses more coins. -/
theorem greedy_choice_counterexample :
    greedyCoins [3, 1] 6 = [3, 3] ∧
    greedyCoins [4, 3, 1] 6 = [4, 1, 1] ∧
    (greedyCoins [3, 1] 6).sum = 6 ∧
    (greedyCoins [4, 3, 1] 6).sum = 6 ∧
    (greedyCoins [3, 1] 6).length < (greedyCoins [4, 3, 1] 6).length := by
  decide

/-- CI-006. False: two individually more-likely-than-not events must have a
more-likely-than-not intersection, on a uniform five-outcome sample space. -/
theorem conjunction_counterexample :
    ∃ a b : Fin 5 → Bool,
      2 * outcomeCount a > outcomes.length ∧
      2 * outcomeCount b > outcomes.length ∧
      2 * outcomeCount (fun i => a i && b i) < outcomes.length := by
  refine ⟨eventA, eventB, ?_⟩
  decide

end Commonsense
