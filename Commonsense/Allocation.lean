import Std

namespace Commonsense.Allocation

def voters : List (Fin 3) := [0, 1, 2]
def population (i : Fin 3) : Nat := if i = 0 then 5 else if i = 1 then 3 else 1

def quotaFloor (seats : Nat) (i : Fin 3) : Nat := seats * population i / 9
def remainder (seats : Nat) (i : Fin 3) : Nat := seats * population i % 9

def remainderRank (seats : Nat) (i : Fin 3) : Nat :=
  (voters.filter (fun j => decide
    (remainder seats i < remainder seats j ∨
      (remainder seats i = remainder seats j ∧ j.val < i.val)))).length

def hamilton (seats : Nat) (i : Fin 3) : Nat :=
  quotaFloor seats i +
    if remainderRank seats i < seats - (voters.map (quotaFloor seats)).sum
    then 1 else 0

/-- CI-051. False: increasing the number of seats cannot take a seat away
under largest-remainder apportionment. Populations 5,3,1 receive 2,1,1 seats
at house size four, but 3,2,0 at size five; ties use increasing group index. -/
theorem more_seats_can_remove_a_seat :
    (voters.map population).sum = 9 ∧
    voters.map (hamilton 4) = [2, 1, 1] ∧
    voters.map (hamilton 5) = [3, 2, 0] ∧
    hamilton 5 2 < hamilton 4 2 := by
  decide

def included (mask : Nat) (i : Fin 3) : Bool := mask / 2 ^ i.val % 2 == 1

def coalitionWeight (w : Fin 3 → Nat) (mask : Nat) : Nat :=
  (voters.map (fun i => if included mask i then w i else 0)).sum

/-- Number of coalitions without i that change from losing to winning when i joins. -/
def swings (w : Fin 3 → Nat) (quota : Nat) (i : Fin 3) : Nat :=
  ((List.range 8).filter (fun mask =>
    !(included mask i) && decide
      (coalitionWeight w mask < quota ∧ quota ≤ coalitionWeight w mask + w i))).length

def unequalWeights (i : Fin 3) : Nat := if i = 2 then 2 else 49

/-- CI-052. False: voting power measured by pivotal coalitions is proportional
to voting weight. With weights 49,49,2 and quota 51, all three have two swings. -/
theorem small_voter_equal_swing_power :
    unequalWeights 2 < unequalWeights 0 ∧
    (voters.map unequalWeights).sum = 100 ∧
    (∀ i : Fin 3, swings unequalWeights 51 i = 2) := by
  decide

def dummyWeights (i : Fin 3) : Nat := if i = 0 then 4 else if i = 1 then 2 else 1

/-- CI-053. False: a positive voting weight guarantees some pivotal power.
With weights 4,2,1 and quota 4, both smaller voters have zero swings. -/
theorem positive_weight_zero_power :
    (∀ i : Fin 3, 0 < dummyWeights i) ∧
    swings dummyWeights 4 0 = 4 ∧
    swings dummyWeights 4 1 = 0 ∧ swings dummyWeights 4 2 = 0 := by
  decide

def rankABC (i : Fin 3) : Nat := i.val
def rankBCA (i : Fin 3) : Nat := if i = 1 then 0 else if i = 2 then 1 else 2

def support (a b : Fin 3) : Nat :=
  (if rankABC a < rankABC b then 3 else 0) +
  (if rankBCA a < rankBCA b then 2 else 0)

def bordaScore (a : Fin 3) : Nat := 3 * (2 - rankABC a) + 2 * (2 - rankBCA a)

/-- CI-054. False: a candidate who beats every opponent head-to-head must
win Borda scoring. Three ballots are A>B>C and two are B>C>A; A wins both
pairwise contests, but B's Borda score is strictly largest. -/
theorem pairwise_winner_loses_borda :
    (∀ rival : Fin 3, rival ≠ 0 → support 0 rival > support rival 0) ∧
    bordaScore 0 = 6 ∧ bordaScore 1 = 7 ∧ bordaScore 2 = 2 := by
  decide

def dhPopulation (i : Fin 3) : Nat := if i = 0 then 5 else 1

def dhWinner (allocation : Fin 3 → Nat) : Fin 3 :=
  voters.foldl (fun best candidate =>
    if dhPopulation candidate * (allocation best + 1) >
       dhPopulation best * (allocation candidate + 1)
    then candidate else best) 0

def dhondt : Nat → (Fin 3 → Nat)
  | 0 => fun _ => 0
  | seats + 1 =>
      let previous := dhondt seats
      let winner := dhWinner previous
      fun i => previous i + if i = winner then 1 else 0

/-- CI-055. False: a proportional highest-averages allocation always gives
at most the ceiling of a group's exact quota. D'Hondt awards all four seats
to population 5 in a 5,1,1 population, although its upper quota is three. -/
theorem highest_averages_exceeds_upper_quota :
    (voters.map dhPopulation).sum = 7 ∧
    voters.map (dhondt 4) = [4, 0, 0] ∧
    (4 * dhPopulation 0 + 6) / 7 = 3 ∧
    dhondt 4 0 > (4 * dhPopulation 0 + 6) / 7 := by
  decide

end Commonsense.Allocation
