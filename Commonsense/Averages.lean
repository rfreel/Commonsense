import Std

namespace Commonsense.Averages

/-- CI-007. False: average speed over equal distances is the arithmetic mean
of the two speeds. All distances and times are positive; the comparison is
exact cross-multiplication of total distance/time and the mean of the rates. -/
theorem equal_distance_speed :
    ∃ d t₁ t₂ : Nat, 0 < d ∧ 0 < t₁ ∧ 0 < t₂ ∧
      (2 * d) * (2 * t₁ * t₂) ≠
        (d * t₂ + d * t₁) * (t₁ + t₂) := by
  refine ⟨60, 2, 1, ?_⟩
  decide

/-- CI-008. False: a percentage gain followed by the same percentage loss
restores the original positive amount. The loss is below 100%. -/
theorem equal_percentage_gain_loss :
    ∃ amount p : Nat,
      0 < amount ∧ 0 < p ∧ p < 100 ∧
      amount * (100 + p) * (100 - p) < amount * 100 * 100 := by
  refine ⟨100, 10, ?_⟩
  decide

/-- CI-009. False: the unweighted mean of two valid success rates equals
the pooled success rate. Denominators are positive; no integer division is used. -/
theorem average_of_rates :
    ∃ a n b m : Nat,
      0 < n ∧ 0 < m ∧ a ≤ n ∧ b ≤ m ∧
      (a * m + b * n) * (n + m) ≠ 2 * n * m * (a + b) := by
  refine ⟨9, 10, 9, 90, ?_⟩
  decide

abbrev meanLT (xs ys : List Nat) : Prop :=
  xs.sum * ys.length < ys.sum * xs.length

/-- CI-010. False: moving one unchanged observation between two nonempty
groups cannot raise both group means. The pooled observations are identical. -/
theorem both_means_rise :
    meanLT [1, 2] [1, 2, 3] ∧
    meanLT [3, 4, 5] [4, 5] ∧
    ([1, 2] ++ [3, 4, 5] : List Nat) = [1, 2, 3] ++ [4, 5] := by
  decide

/-- CI-011. False: squaring an average gives the average of the squares.
The inequality compares these quantities after multiplying by four. -/
theorem square_of_average :
    ∃ x y : Nat, (x + y) ^ 2 < 2 * (x ^ 2 + y ^ 2) := by
  refine ⟨1, 3, ?_⟩
  decide

/-- CI-012. False: a positive arithmetic mean of successive percentage
returns guarantees growth. A 100% gain then a 60% loss has positive mean
return but leaves only 80% of the original amount. -/
theorem positive_mean_return_can_lose :
    ∃ gain loss : Nat,
      loss < 100 ∧ gain > loss ∧
      (100 + gain) * (100 - loss) < 100 * 100 := by
  refine ⟨100, 60, ?_⟩
  decide

end Commonsense.Averages
