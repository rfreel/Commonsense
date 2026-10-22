import Std

namespace Commonsense.Networks

/-- Four drivers choose upper (0), lower (1), or the new shortcut route (2).
Upper costs upper-load+4; lower costs 4+lower-load. The shortcut traverses
both load-dependent edges and has zero connecting-edge cost. -/
abbrev Routes := Fin 4 → Fin 3

def drivers : List (Fin 4) := [0, 1, 2, 3]

def upperLoad (s : Routes) : Nat :=
  (drivers.filter (fun p => (s p == 0) || (s p == 2))).length

def lowerLoad (s : Routes) : Nat :=
  (drivers.filter (fun p => (s p == 1) || (s p == 2))).length

def travelCost (s : Routes) (p : Fin 4) : Nat :=
  if s p = 0 then upperLoad s + 4
  else if s p = 1 then 4 + lowerLoad s
  else upperLoad s + lowerLoad s

def reroute (s : Routes) (who : Fin 4) (route : Fin 3) : Routes :=
  fun p => if p = who then route else s p

def oldRoutes (p : Fin 4) : Fin 3 := if p.val < 2 then 0 else 1
def shortcutRoutes (_ : Fin 4) : Fin 3 := 2

/-- CI-041. False: adding a road cannot make every driver worse at equilibrium.
Without route 2 the displayed equilibrium costs each driver 6. Adding route 2
makes it profitable to deviate, while all choosing 2 is an equilibrium costing 8.
Every unilateral deviation is checked with the resulting loads recomputed. -/
theorem adding_road_worsens_equilibrium :
    (∀ p : Fin 4, travelCost oldRoutes p = 6) ∧
    (∀ p : Fin 4, ∀ route : Fin 3, route ≠ 2 →
      travelCost oldRoutes p ≤ travelCost (reroute oldRoutes p route) p) ∧
    travelCost (reroute oldRoutes 0 2) 0 = 5 ∧
    (∀ p : Fin 4, travelCost shortcutRoutes p = 8) ∧
    (∀ p : Fin 4, ∀ route : Fin 3,
      travelCost shortcutRoutes p ≤ travelCost (reroute shortcutRoutes p route) p) := by
  decide

/-- Edge masks of the path 0--1--2--3: bits 0,1,2 select its three edges. -/
def chosen (mask : Fin 8) (edge : Fin 3) : Bool :=
  decide (mask.val / 2 ^ edge.val % 2 = 1)

abbrev matching (mask : Fin 8) : Prop :=
  ¬ (chosen mask 0 = true ∧ chosen mask 1 = true) ∧
  ¬ (chosen mask 1 = true ∧ chosen mask 2 = true)

abbrev includes (small large : Fin 8) : Prop :=
  ∀ edge : Fin 3, chosen small edge = true → chosen large edge = true

def edgeCount (mask : Fin 8) : Nat :=
  (([0, 1, 2] : List (Fin 3)).filter (chosen mask)).length

/-- CI-042. False: a matching that cannot be extended is maximum-size.
Mask 2 selects the middle edge and is inclusion-maximal; mask 5 selects both
outer edges and is a larger matching. All eight edge subsets are covered. -/
theorem maximal_not_maximum_matching :
    matching 2 ∧
    (∀ alternative : Fin 8, includes 2 alternative → matching alternative → alternative = 2) ∧
    matching 5 ∧ edgeCount 2 = 1 ∧ edgeCount 5 = 2 := by
  decide

/-- Triangle edges 0--1 and 1--2 cost 2; edge 0--2 costs 3. -/
def linkCost (a b : Fin 3) : Nat :=
  if a = b then 0 else if (a = 0 ∧ b = 2) ∨ (a = 2 ∧ b = 0) then 3 else 2

/-- The three possible spanning trees of that triangle. -/
def treeEdges (choice : Fin 3) : List (Fin 3 × Fin 3) :=
  if choice = 0 then [(0, 1), (1, 2)]
  else if choice = 1 then [(0, 1), (0, 2)]
  else [(0, 2), (1, 2)]

def treeWeight (choice : Fin 3) : Nat :=
  ((treeEdges choice).map (fun edge => linkCost edge.1 edge.2)).sum

/-- CI-043. False: a minimum-total-weight spanning tree preserves shortest
paths. The minimum tree costs 4, but its 0-to-2 path costs 4 instead of 3. -/
theorem minimum_tree_not_shortest_paths :
    (∀ alternative : Fin 3, treeWeight 0 ≤ treeWeight alternative) ∧
    treeWeight 0 = 4 ∧
    linkCost 0 2 < linkCost 0 1 + linkCost 1 2 := by
  decide

def setA (i : Fin 3) : Bool := i != 2
def setB (i : Fin 3) : Bool := i != 0
def setC (i : Fin 3) : Bool := i != 1

/-- CI-044. False: pairwise-overlapping sets necessarily share a common element.
The sets {0,1}, {1,2}, {0,2} overlap in pairs but not all together. -/
theorem pairwise_overlap_no_common_element :
    (∃ i : Fin 3, setA i = true ∧ setB i = true) ∧
    (∃ i : Fin 3, setA i = true ∧ setC i = true) ∧
    (∃ i : Fin 3, setB i = true ∧ setC i = true) ∧
    ¬ (∃ i : Fin 3, setA i = true ∧ setB i = true ∧ setC i = true) := by
  decide

/-- A four-person friendship star, with person 0 at the center. -/
def people : List (Fin 4) := [0, 1, 2, 3]
def friends (a b : Fin 4) : Bool := decide (a ≠ b ∧ (a = 0 ∨ b = 0))
def degree (p : Fin 4) : Nat := (people.filter (friends p)).length

def directedFriendships : List (Fin 4 × Fin 4) :=
  people.flatMap (fun p => (people.filter (friends p)).map (fun q => (p, q)))

/-- CI-047. False: sampling a uniformly random friendship endpoint gives the
same mean friend-count as sampling a uniformly random person. In this star,
mean degree is 6/4 for people but 12/6 for directed friendship endpoints. -/
theorem friendship_endpoint_bias :
    people.length = 4 ∧ directedFriendships.length = 6 ∧
    (people.map degree).sum = 6 ∧
    (directedFriendships.map (fun edge => degree edge.2)).sum = 12 ∧
    (directedFriendships.map (fun edge => degree edge.2)).sum * people.length >
      (people.map degree).sum * directedFriendships.length := by
  decide

end Commonsense.Networks
