/-! Additional denominations can worsen a particular greedy algorithm. -/
namespace Commonsense

def greedy13 (n : Nat) : Nat :=
  n / 3 + n % 3

def greedy134 (n : Nat) : Nat :=
  n / 4 + (n % 4) / 3 + (n % 4) % 3

theorem adding_choice_hurts_greedy :
    greedy13 6 = 2 ∧ greedy134 6 = 3 := by
  decide

end Commonsense
