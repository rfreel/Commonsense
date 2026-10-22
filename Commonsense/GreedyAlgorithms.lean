import Std

namespace Commonsense.GreedyAlgorithms

def landscape (i : Fin 4) : Nat := if i = 1 then 1 else if i = 3 then 0 else 2

/-- CI-029. False: being better than both neighboring choices guarantees a
global minimum on a line. Position 1 beats neighbors 0 and 2 but loses to 3. -/
theorem local_not_global :
    landscape 1 < landscape 0 ∧ landscape 1 < landscape 2 ∧
    landscape 3 < landscape 1 := by
  decide

/-- Items are (weight, value); each list occurrence is one indivisible item. -/
abbrev Item := Nat × Nat

def pack : Nat → List Item → List Item
  | _, [] => []
  | capacity, item :: items =>
      if item.1 ≤ capacity then item :: pack (capacity - item.1) items
      else pack capacity items

def weight (items : List Item) : Nat := (items.map Prod.fst).sum
def value (items : List Item) : Nat := (items.map Prod.snd).sum

/-- CI-030. False: packing highest-value items first maximizes total value.
At capacity 10, the value-12 item blocks two value-10 items. -/
theorem largest_value_greedy_fails :
    12 > 10 ∧
    pack 10 [(6, 12), (5, 10), (5, 10)] = [(6, 12)] ∧
    weight [(5, 10), (5, 10)] ≤ 10 ∧
    value (pack 10 [(6, 12), (5, 10), (5, 10)]) <
      value [(5, 10), (5, 10)] := by
  decide

/-- CI-031. False: highest value per unit weight solves indivisible knapsack.
Ratios are strictly 6,5,4. Greedy gets 160, while a feasible alternative gets 220. -/
theorem density_greedy_fails :
    60 * 20 > 100 * 10 ∧ 100 * 30 > 120 * 20 ∧
    value (pack 50 [(10, 60), (20, 100), (30, 120)]) = 160 ∧
    weight [(20, 100), (30, 120)] = 50 ∧
    value [(20, 100), (30, 120)] = 220 := by
  decide

/-- FIFO cache: hits preserve insertion order; a full cache evicts its oldest page. -/
def fifoFaults (capacity : Nat) : List Nat → List Nat → Nat
  | [], _ => 0
  | page :: requests, queue =>
      if page ∈ queue then fifoFaults capacity requests queue
      else 1 + fifoFaults capacity requests
        ((if queue.length < capacity then queue else queue.drop 1) ++ [page])

def requests : List Nat := [1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5]

/-- CI-032. False: more cache slots cannot increase misses for a fixed policy.
On exactly the same requests, FIFO has 9 misses with three slots and 10 with four. -/
theorem more_memory_more_fifo_misses :
    fifoFaults 3 requests [] = 9 ∧ fifoFaults 4 requests [] = 10 := by
  decide

def distance (a b : Int) : Nat := (a - b).natAbs

def tourLength : List Int → Nat
  | [] => 0
  | [_] => 0
  | a :: b :: rest => distance a b + tourLength (b :: rest)

/-- CI-033. False: always visiting the nearest unvisited point gives the shortest
tour, even on a line. Every nontrivial greedy choice is strict; its tour costs
38 instead of the feasible tour's 34. Both visit the same five points once. -/
theorem nearest_neighbor_tour_fails :
    distance 0 2 < distance 0 (-3) ∧
    distance 0 2 < distance 0 (-9) ∧
    distance 0 2 < distance 0 8 ∧
    distance 2 (-3) < distance 2 (-9) ∧
    distance 2 (-3) < distance 2 8 ∧
    distance (-3) (-9) < distance (-3) 8 ∧
    tourLength [0, 2, -3, -9, 8, 0] = 38 ∧
    tourLength [0, -9, -3, 2, 8, 0] = 34 := by
  decide

/-- Jobs are (processing time, deadline), run without preemption or idle time. -/
def lateJobs : Nat → List (Nat × Nat) → Nat
  | _, [] => 0
  | time, (duration, deadline) :: jobs =>
      (if time + duration > deadline then 1 else 0) +
        lateJobs (time + duration) jobs

/-- CI-034. False: earliest-deadline-first always minimizes the number of late
jobs. Deadlines 4<5<6 give two late jobs, while another ordering gives only one. -/
theorem earliest_deadline_not_fewest_late :
    4 < 5 ∧ 5 < 6 ∧
    lateJobs 0 [(4, 4), (2, 5), (2, 6)] = 2 ∧
    lateJobs 0 [(2, 5), (2, 6), (4, 4)] = 1 := by
  decide

end Commonsense.GreedyAlgorithms
