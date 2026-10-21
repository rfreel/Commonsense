/-! Two events of probability 3/5 can intersect with probability 1/5. -/
namespace Commonsense

def outcomes : List (Fin 5) := [0, 1, 2, 3, 4]

def eventA (i : Fin 5) : Bool := decide (i.val < 3)
def eventB (i : Fin 5) : Bool := decide (i.val >= 2)

def outcomeCount (p : Fin 5 → Bool) : Nat :=
  (outcomes.filter p).length

theorem likely_individually_unlikely_together :
    outcomeCount eventA = 3 ∧
    outcomeCount eventB = 3 ∧
    outcomeCount (fun i => eventA i && eventB i) = 1 := by
  decide

end Commonsense
