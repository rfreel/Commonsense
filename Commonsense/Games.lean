import Std

namespace Commonsense.Games

/-- Symmetric costs to minimize: action 0 cooperates; action 1 defects. -/
def dilemmaCost (mine other : Fin 2) : Nat :=
  if mine = 0 then (if other = 0 then 2 else 4)
  else (if other = 0 then 1 else 3)

/-- CI-035. False: each player choosing a strictly dominant action guarantees
the best joint outcome. Defection is individually cheaper against either action,
but both players pay less under mutual cooperation than mutual defection. -/
theorem individually_dominant_collectively_worse :
    (∀ other : Fin 2, dilemmaCost 1 other < dilemmaCost 0 other) ∧
    dilemmaCost 0 0 < dilemmaCost 1 1 := by
  decide

/-- Rock-paper-scissors utility: win=2, draw=1, lose=0. -/
def rpsPayoff (mine other : Fin 3) : Nat :=
  if mine = other then 1 else if (mine.val + 2) % 3 = other.val then 2 else 0

/-- CI-036. False: every finite two-player game has a stable pair of deterministic
actions. No pure rock-paper-scissors profile prevents all profitable deviations. -/
theorem no_pure_equilibrium :
    ¬ (∃ a b : Fin 3,
      (∀ alternative : Fin 3, rpsPayoff alternative b ≤ rpsPayoff a b) ∧
      (∀ alternative : Fin 3, rpsPayoff alternative a ≤ rpsPayoff b a)) := by
  decide

def allocation (i : Fin 3) : Nat × Nat :=
  if i = 0 then (0, 10) else if i = 1 then (6, 6) else (10, 0)

abbrev dominates (a b : Nat × Nat) : Prop :=
  a.1 ≥ b.1 ∧ a.2 ≥ b.2 ∧ (a.1 > b.1 ∨ a.2 > b.2)

/-- CI-037. False: a Pareto-efficient allocation maximizes total utility.
(0,10) is undominated among these feasible allocations, but (6,6) has greater sum. -/
theorem pareto_not_maximum_total :
    (∀ alternative : Fin 3, ¬ dominates (allocation alternative) (allocation 0)) ∧
    (allocation 0).1 + (allocation 0).2 < (allocation 1).1 + (allocation 1).2 := by
  decide

end Commonsense.Games
