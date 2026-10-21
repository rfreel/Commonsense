/-! A 3-voter majority cycle from consistent individual rankings. -/
namespace Commonsense

def ballotRank (v candidate : Fin 3) : Nat :=
  (candidate.val + 3 - v.val) % 3

def voterPrefers (v a b : Fin 3) : Bool :=
  decide (ballotRank v a < ballotRank v b)

def supportCount (a b : Fin 3) : Nat :=
  (if voterPrefers 0 a b then 1 else 0) +
  (if voterPrefers 1 a b then 1 else 0) +
  (if voterPrefers 2 a b then 1 else 0)

theorem majority_cycle :
    supportCount 0 1 = 2 ∧
    supportCount 1 2 = 2 ∧
    supportCount 2 0 = 2 := by
  decide

end Commonsense
