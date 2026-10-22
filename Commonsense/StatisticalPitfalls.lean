import Std

namespace Commonsense.StatisticalPitfalls

def squareSum (xs : List Nat) : Nat := (xs.map (fun x => x * x)).sum

/-- CI-065. False: equal means and variances determine the distribution.
Uniform draws from [0,3,3] and [1,1,4] have equal length, sum, and sum of
squares, hence equal first two moments, but disagree on the probability of zero. -/
theorem same_moments_different_distributions :
    ∃ xs ys : List Nat,
      xs.length = 3 ∧ ys.length = 3 ∧
      xs.sum = ys.sum ∧ squareSum xs = squareSum ys ∧
      xs.count 0 ≠ ys.count 0 := by
  refine ⟨[0, 3, 3], [1, 1, 4], ?_⟩
  decide

def tasks : List (Fin 4) := [0, 1, 2, 3]
def outcome (i : Fin 4) : Nat := if i.val < 2 then 0 else 100
def constantForecast (_ : Fin 4) : Nat := 50

def calibrationError (prediction : Fin 4 → Nat) (level : Fin 101) : Nat :=
  let group := tasks.filter (fun i => prediction i == level.val)
  (Int.ofNat (group.map outcome).sum - Int.ofNat (level.val * group.length)).natAbs

/-- CI-066. False: perfect calibration guarantees discrimination between
positive and negative cases. A constant 50% forecast is calibrated at every
reported level, yet assigns the same score to every case of either class. -/
theorem calibrated_but_no_discrimination :
    (∀ level : Fin 101, calibrationError constantForecast level = 0) ∧
    (∀ i j : Fin 4, constantForecast i = constantForecast j) ∧
    outcome 0 = 0 ∧ outcome 2 = 100 := by
  decide

def binaryTasks : List (Fin 2) := [0, 1]
def binaryTruth (i : Fin 2) : Nat := if i = 0 then 100 else 0

def classificationCorrect (prediction : Fin 2 → Nat) : Nat :=
  (binaryTasks.filter (fun i => decide
    ((50 ≤ prediction i) ↔ (50 ≤ binaryTruth i)))).length

def brierScaled (prediction : Fin 2 → Nat) : Nat :=
  (binaryTasks.map (fun i =>
    (Int.ofNat (prediction i) - Int.ofNat (binaryTruth i)).natAbs ^ 2)).sum

def accurateForecast (i : Fin 2) : Nat := if i = 0 then 51 else 49
def lowerLossForecast (i : Fin 2) : Nat := if i = 0 then 100 else 51

/-- CI-067. False: higher threshold classification accuracy implies a better
Brier probability score. At threshold 50%, scores 51,49 classify both cases
correctly but have squared loss 4802; scores 100,51 get one correct with loss 2601. -/
theorem more_accurate_worse_probability_score :
    classificationCorrect accurateForecast = 2 ∧
    classificationCorrect lowerLossForecast = 1 ∧
    brierScaled accurateForecast = 4802 ∧
    brierScaled lowerLossForecast = 2601 := by
  decide

/-- CI-068. False: identical sensitivity and specificity across two groups
force identical positive predictive values. Both groups below have 90%
sensitivity and specificity, but their positive predictive values differ.
All comparisons use cross-products with positive denominators. -/
theorem equal_error_rates_unequal_precision :
    ∃ tpA fnA fpA tnA tpB fnB fpB tnB : Nat,
      tpA + fnA + fpA + tnA = 100 ∧
      tpB + fnB + fpB + tnB = 100 ∧
      0 < tpA + fnA ∧ 0 < tpB + fnB ∧
      0 < tnA + fpA ∧ 0 < tnB + fpB ∧
      0 < tpA + fpA ∧ 0 < tpB + fpB ∧
      tpA * (tpB + fnB) = tpB * (tpA + fnA) ∧
      tnA * (tnB + fpB) = tnB * (tnA + fpA) ∧
      tpA * (tpB + fpB) < tpB * (tpA + fpA) := by
  refine ⟨9, 1, 9, 81, 81, 9, 1, 9, ?_⟩
  decide

def observations : List Int := [0, 0, 9]

def absoluteLoss (prediction : Fin 10) : Nat :=
  (observations.map (fun x => (x - Int.ofNat prediction.val).natAbs)).sum

def squaredLoss (prediction : Fin 10) : Nat :=
  (observations.map (fun x => (x - Int.ofNat prediction.val).natAbs ^ 2)).sum

/-- CI-069. False: the best constant prediction is independent of the error
penalty. Among integer predictions 0 through 9 for observations 0,0,9,
3 minimizes squared error while 0 minimizes absolute error, with strict
opposite preferences between these two predictions. -/
theorem best_prediction_depends_on_loss :
    (∀ prediction : Fin 10, squaredLoss 3 ≤ squaredLoss prediction) ∧
    (∀ prediction : Fin 10, absoluteLoss 0 ≤ absoluteLoss prediction) ∧
    squaredLoss 3 = 54 ∧ squaredLoss 0 = 81 ∧
    absoluteLoss 0 = 9 ∧ absoluteLoss 3 = 12 := by
  decide

end Commonsense.StatisticalPitfalls
