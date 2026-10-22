import Std

namespace Commonsense.Scheduling

/-- Jobs (release,duration); starts are indexed by job, not execution order. -/
def releases : Fin 2 → Nat := fun i => if i = 0 then 0 else 1
def durations : Fin 2 → Nat := fun i => if i = 0 then 10 else 1

abbrev feasible (starts : Fin 2 → Nat) : Prop :=
  (∀ i : Fin 2, releases i ≤ starts i) ∧
  (starts 0 + durations 0 ≤ starts 1 ∨ starts 1 + durations 1 ≤ starts 0)

def completionSum (starts : Fin 2 → Nat) : Nat :=
  starts 0 + durations 0 + starts 1 + durations 1

def immediateStarts (i : Fin 2) : Nat := if i = 0 then 0 else 10
def delayedStarts (i : Fin 2) : Nat := if i = 0 then 2 else 1

/-- CI-060. False: avoiding idle time whenever work is available minimizes
total completion time on one nonpreemptive machine. Starting the available
10-unit job immediately gives total 21; idling until time 1, doing the new
one-unit job, then the long job gives 14. Both schedules are feasible. -/
theorem useful_idle_time :
    feasible immediateStarts ∧ feasible delayedStarts ∧
    immediateStarts 0 = 0 ∧ delayedStarts 1 = 1 ∧
    completionSum immediateStarts = 21 ∧ completionSum delayedStarts = 14 := by
  decide

/-- CI-061. False: shortest-processing-time first minimizes maximum tardiness.
Jobs have (duration,due-date) (1,10) and (4,4); the shortest-first order is
one unit late, while the opposite order meets both due dates. -/
theorem shortest_first_not_least_tardy :
    (1 : Nat) < 4 ∧
    max (1 - 10) ((1 + 4) - 4) = 1 ∧
    max (4 - 4) ((4 + 1) - 10) = 0 := by
  decide

/-- CI-062. False: shortest-processing-time first minimizes weighted total
completion time. Durations 1,2 and weights 1,100 give 301 in that order,
but only 203 when the longer high-weight job goes first. -/
theorem shortest_first_not_weighted_best :
    (1 : Nat) < 2 ∧
    1 * 1 + 100 * (1 + 2) = 301 ∧
    100 * 2 + 1 * (2 + 1) = 203 ∧ (203 : Nat) < 301 := by
  decide

def intervals : Fin 3 → Nat × Nat :=
  fun i => if i = 0 then (0, 3) else if i = 1 then (2, 4) else (3, 6)

def length (i : Fin 3) : Nat := (intervals i).2 - (intervals i).1
abbrev compatible (i j : Fin 3) : Prop :=
  (intervals i).2 ≤ (intervals j).1 ∨ (intervals j).2 ≤ (intervals i).1

/-- CI-063. False: repeatedly choosing the shortest remaining interval gives
as many nonoverlapping intervals as possible. The unique shortest interval
(2,4) blocks both (0,3) and (3,6), whereas those two are compatible. -/
theorem shortest_interval_blocks_two :
    (∀ i : Fin 3, (intervals i).1 < (intervals i).2) ∧
    length 1 < length 0 ∧ length 1 < length 2 ∧
    ¬compatible 1 0 ∧ ¬compatible 1 2 ∧ compatible 0 2 := by
  decide

def processingTime (machine : Fin 2) : Nat := if machine = 0 then 1 else 2

def machineLoad (assignment : Fin 3 → Fin 2) (machine : Fin 2) : Nat :=
  (([0, 1, 2] : List (Fin 3)).filter (fun job => assignment job == machine)).length *
    processingTime machine

def makespan (assignment : Fin 3 → Fin 2) : Nat :=
  max (machineLoad assignment 0) (machineLoad assignment 1)

def allFast (_ : Fin 3) : Fin 2 := 0
def split (i : Fin 3) : Fin 2 := if i = 2 then 1 else 0

/-- CI-064. False: assigning every job to the machine where it runs fastest
minimizes completion of the whole batch. Three independent jobs each take
1 on machine 0 and 2 on machine 1; all-fast takes 3, but splitting takes 2. -/
theorem individually_fastest_collectively_slower :
    processingTime 0 < processingTime 1 ∧
    makespan allFast = 3 ∧ makespan split = 2 := by
  decide

end Commonsense.Scheduling
