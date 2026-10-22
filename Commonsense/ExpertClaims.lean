import Std

namespace Commonsense.ExpertClaims

/-- E-001. Maximizing a reward need not maximize the intended task score.
Both scoring rules are exact; the missing premise is objective alignment. -/
def proxyReward (choice : Bool) : Nat := if choice then 4 else 10
def actualSuccess (choice : Bool) : Nat := if choice then 1 else 0

theorem reward_optimal_goal_inferior :
    proxyReward false > proxyReward true ∧
    actualSuccess false < actualSuccess true := by
  decide

/-- E-008. A cheap schedule can violate a shared machine-capacity constraint.
Two jobs each run for two time units. Their starts cost one unit per delay. -/
def scheduleCost (first second : Nat) : Nat := 2 + first + second
def noOverlap (first second : Nat) : Prop :=
  first + 2 ≤ second ∨ second + 2 ≤ first

theorem cheapest_schedule_is_infeasible :
    scheduleCost 0 0 < scheduleCost 0 2 ∧
    ¬ noOverlap 0 0 ∧ noOverlap 0 2 ∧
    (∀ a b : Nat, 2 ≤ scheduleCost a b) := by
  constructor
  · decide
  constructor
  · simp [noOverlap]
  constructor
  · simp [noOverlap]
  · intro a b
    simp [scheduleCost]
    omega

/-- E-012. Every driver can act in unilateral self-interest while the joint
outcome is worse for everyone. Payoffs use the prisoner's-dilemma matrix. -/
def payoff (self other : Bool) : Nat :=
  if self then (if other then 2 else 0)
  else (if other then 3 else 1)

theorem dominant_actions_collectively_inferior :
    (∀ other : Bool, payoff false other > payoff true other) ∧
    payoff false false < payoff true true := by
  decide

/-- E-016. Validation superiority can reverse under a deployment
distribution. Outcomes in each four-case sample are all 'true'. -/
def modelA (x : Nat) : Bool := x == 0
def modelB (x : Nat) : Bool := x == 1
def correctCount (model : Nat → Bool) (sample : List Nat) : Nat :=
  (sample.filter model).length
def validation : List Nat := [0, 0, 0, 1]
def deployment : List Nat := [0, 1, 1, 1]

theorem validation_winner_deployment_loser :
    correctCount modelA validation = 3 ∧
    correctCount modelB validation = 1 ∧
    correctCount modelA deployment = 1 ∧
    correctCount modelB deployment = 3 := by
  decide

/-- E-020. A program may perfectly implement a verified specification
yet fail the different intended requirement. -/
def writtenSpec (x : Nat) : Nat := x
def implementation (x : Nat) : Nat := x
def intendedRequirement (x : Nat) : Nat := x + 1

theorem verified_to_spec_wrong_for_goal :
    (∀ x : Nat, implementation x = writtenSpec x) ∧
    (∃ x : Nat, implementation x ≠ intendedRequirement x) := by
  constructor
  · intro x
    rfl
  · exact ⟨0, by decide⟩

/-- E-022. Improving a surrogate score need not improve the actual outcome.
The missing premise is that the surrogate ordering predicts outcome ordering. -/
def surrogate (treatment : Bool) : Nat := if treatment then 10 else 5
def realOutcome (treatment : Bool) : Nat := if treatment then 1 else 8

theorem surrogate_improves_outcome_worsens :
    surrogate true > surrogate false ∧
    realOutcome true < realOutcome false := by
  decide

end Commonsense.ExpertClaims
