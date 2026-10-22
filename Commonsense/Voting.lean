import Std

namespace Commonsense.Voting

/-- A weighted profile: each group gives a positive voter count and a complete
ranking of candidates 0,1,2. Every concrete profile below has that form. -/
abbrev Profile := List (Nat × List Nat)

def tally (profile : Profile) (removed : List Nat) (candidate : Nat) : Nat :=
  (profile.map (fun group =>
    if ((group.2.filter (fun c => !(removed.contains c))).headD 3) = candidate
    then group.1 else 0)).sum

def pairVotes (profile : Profile) (a b : Nat) : Nat :=
  (profile.map (fun group =>
    if group.2.idxOf a < group.2.idxOf b then group.1 else 0)).sum

/-- Smallest candidate number breaks ties for elimination. -/
def firstLoser (profile : Profile) : Nat :=
  let a := tally profile [] 0
  let b := tally profile [] 1
  let c := tally profile [] 2
  if a ≤ b ∧ a ≤ c then 0 else if b ≤ c then 1 else 2

/-- Three-candidate instant runoff; smaller remaining candidate breaks a final tie. -/
def irv (profile : Profile) : Nat :=
  let loser := firstLoser profile
  if loser = 0 then
    if tally profile [loser] 1 ≥ tally profile [loser] 2 then 1 else 2
  else if loser = 1 then
    if tally profile [loser] 0 ≥ tally profile [loser] 2 then 0 else 2
  else
    if tally profile [loser] 0 ≥ tally profile [loser] 1 then 0 else 1

def pluralityProfile : Profile :=
  [(3, [0, 1, 2]), (2, [1, 2, 0]), (2, [2, 1, 0])]

/-- CI-038. False: a unique plurality winner cannot lose to every rival
head-to-head. Candidate 0 wins 3-2-2 but loses both pairwise contests 3-4. -/
theorem plurality_winner_pairwise_loser :
    tally pluralityProfile [] 0 = 3 ∧
    tally pluralityProfile [] 1 = 2 ∧
    tally pluralityProfile [] 2 = 2 ∧
    pairVotes pluralityProfile 1 0 = 4 ∧
    pairVotes pluralityProfile 0 1 = 3 ∧
    pairVotes pluralityProfile 2 0 = 4 ∧
    pairVotes pluralityProfile 0 2 = 3 := by
  decide

def beforeRaise : Profile :=
  [(8, [0, 2, 1]), (3, [1, 0, 2]), (6, [1, 2, 0]), (7, [2, 0, 1])]

def afterRaise : Profile :=
  [(8, [0, 2, 1]), (3, [0, 1, 2]), (6, [1, 2, 0]), (7, [2, 0, 1])]

/-- CI-039. False: moving a winning candidate upward on ballots cannot make
that candidate lose instant runoff. Only three ballots change, from 1>0>2 to
0>1>2. No elimination or final-round tie occurs in either election. -/
theorem raising_candidate_makes_them_lose :
    tally beforeRaise [] 0 = 8 ∧ tally beforeRaise [] 1 = 9 ∧
    tally beforeRaise [] 2 = 7 ∧ firstLoser beforeRaise = 2 ∧
    tally beforeRaise [2] 0 = 15 ∧ tally beforeRaise [2] 1 = 9 ∧
    tally afterRaise [] 0 = 11 ∧ tally afterRaise [] 1 = 6 ∧
    tally afterRaise [] 2 = 7 ∧ firstLoser afterRaise = 1 ∧
    tally afterRaise [1] 0 = 11 ∧ tally afterRaise [1] 2 = 13 ∧
    irv beforeRaise = 0 ∧ irv afterRaise = 2 := by
  decide

def withdrawalProfile : Profile :=
  [(4, [0, 1, 2]), (3, [1, 0, 2]), (2, [2, 1, 0])]

/-- CI-040. False: removing a losing candidate cannot change the plurality
winner among the survivors. Candidate 0 wins 4-3-2; removing 2 makes 1 win 5-4. -/
theorem losing_candidate_changes_winner :
    tally withdrawalProfile [] 0 = 4 ∧
    tally withdrawalProfile [] 1 = 3 ∧
    tally withdrawalProfile [] 2 = 2 ∧
    tally withdrawalProfile [2] 0 = 4 ∧
    tally withdrawalProfile [2] 1 = 5 := by
  decide

end Commonsense.Voting
