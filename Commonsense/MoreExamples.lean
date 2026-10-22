import Std

namespace Commonsense.MoreExamples

/-- The initial choice is door 0. The informed host reveals an unchosen goat;
when the prize is at 0, the host deterministically reveals door 1. -/
def host (prize : Fin 3) : Fin 3 := if prize = 1 then 2 else 1
def switchDoor (prize : Fin 3) : Fin 3 := if host prize = 1 then 2 else 1

def prizes : List (Fin 3) := [0, 1, 2]

/-- CI-048. False: staying and switching are equally likely to win after an
informed host reveals a goat. With uniform prize placement and this explicit
legal host policy, staying wins once and switching wins twice out of three. -/
theorem switching_is_not_fifty_fifty :
    (∀ prize : Fin 3,
      host prize ≠ 0 ∧ host prize ≠ prize ∧
      switchDoor prize ≠ 0 ∧ switchDoor prize ≠ host prize) ∧
    (prizes.filter (fun prize => prize == 0)).length = 1 ∧
    (prizes.filter (fun prize => switchDoor prize == prize)).length = 2 := by
  decide

/-- One hundred equally likely outcomes, one paying 100 and all others zero. -/
def payouts : List Nat := (List.range 100).map (fun i => if i = 0 then 100 else 0)

/-- CI-049. False: expected payout one means receiving something is likely.
The expectation is exactly 100/100=1, but only one of 100 outcomes pays anything. -/
theorem expectation_one_usually_zero :
    payouts.length = 100 ∧ payouts.sum = payouts.length ∧
    (payouts.filter (fun n => decide (n > 0))).length = 1 := by
  decide

def insertSorted (n : Nat) : List Nat → List Nat
  | [] => [n]
  | x :: xs => if n ≤ x then n :: x :: xs else x :: insertSorted n xs

def sort : List Nat → List Nat
  | [] => []
  | x :: xs => insertSorted x (sort xs)

/-- Used only for the nonempty odd-length lists in the theorem below. -/
def median (xs : List Nat) : Nat := (sort xs).getD (xs.length / 2) 0

def groups : List (List Nat) := [[1, 2, 100], [3, 4, 5], [6, 7, 8]]

/-- CI-050. False: the median of group medians equals the pooled median,
even for three equal-size groups. Group medians are 2,4,7, giving 4;
the sorted pooled data has median 5. -/
theorem median_of_medians_not_pooled :
    groups.length = 3 ∧ groups.map List.length = [3, 3, 3] ∧
    groups.map median = [2, 4, 7] ∧
    sort groups.flatten = [1, 2, 3, 4, 5, 6, 7, 8, 100] ∧
    median (groups.map median) = 4 ∧ median groups.flatten = 5 := by
  decide

end Commonsense.MoreExamples
