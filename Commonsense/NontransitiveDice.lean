/-! Counts winning face pairs for three equiprobable three-sided dice. -/
namespace Commonsense

def faceWins (xs ys : List Nat) : Nat :=
  (xs.flatMap (fun x => ys.filter (fun y => decide (x > y)))).length

theorem nontransitive_dice :
    faceWins [2, 2, 5] [1, 4, 4] = 5 ∧
    faceWins [1, 4, 4] [3, 3, 3] = 6 ∧
    faceWins [3, 3, 3] [2, 2, 5] = 6 := by
  decide

end Commonsense
