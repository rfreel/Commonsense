import Std

namespace Commonsense.Infinite

/-- CI-045. False: a one-to-one self-map must be onto. The successor function
on natural numbers is injective but never reaches zero. -/
theorem injective_not_surjective :
    (∀ a b : Nat, Nat.succ a = Nat.succ b → a = b) ∧
    ¬ (∀ target : Nat, ∃ source : Nat, Nat.succ source = target) := by
  constructor
  · intro a b h
    exact Nat.succ.inj h
  · intro allReached
    obtain ⟨source, impossible⟩ := allReached 0
    cases impossible

/-- CI-046. False: an onto self-map must be one-to-one. Natural-number
predecessor reaches every target, but sends both 0 and 1 to 0. -/
theorem surjective_not_injective :
    (∀ target : Nat, ∃ source : Nat, Nat.pred source = target) ∧
    (∃ a b : Nat, a ≠ b ∧ Nat.pred a = Nat.pred b) := by
  constructor
  · intro target
    exact ⟨Nat.succ target, rfl⟩
  · exact ⟨0, 1, by decide⟩

end Commonsense.Infinite
