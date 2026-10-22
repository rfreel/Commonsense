import Std

namespace Commonsense.GraphShapes

def star (a b : Fin 4) : Bool :=
  decide ((a = 0 ∧ b ≠ 0) ∨ (b = 0 ∧ a ≠ 0))

/-- CI-075. False: a connected undirected graph always has a route visiting
every vertex exactly once. A three-leaf star connects every pair by at
most two edges, but no ordering of its four distinct vertices forms a path. -/
theorem connected_without_hamilton_path :
    (∀ u v : Fin 4, u = v ∨ star u v = true ∨
      (star u 0 = true ∧ star 0 v = true)) ∧
    (∀ a b c d : Fin 4,
      ¬(List.Pairwise (fun x y : Fin 4 => x ≠ y) [a, b, c, d] ∧
        star a b = true ∧ star b c = true ∧ star c d = true)) := by
  decide

def vertices : List (Fin 6) := [0, 1, 2, 3, 4, 5]

def cycle6 (a b : Fin 6) : Bool :=
  decide ((a.val + 1) % 6 = b.val ∨ (b.val + 1) % 6 = a.val)

def twoTriangles (a b : Fin 6) : Bool :=
  decide (a ≠ b ∧ a.val / 3 = b.val / 3)

def degree (adjacent : Fin 6 → Fin 6 → Bool) (a : Fin 6) : Nat :=
  (vertices.filter (adjacent a)).length

/-- CI-076. False: a graph's degree sequence determines its shape up to
relabeling. A six-cycle and two disjoint triangles both have degree two
at every vertex, yet no adjacency-preserving map from the triangles to
the cycle exists, so in particular no graph isomorphism exists. -/
theorem same_degrees_different_graphs :
    (∀ v : Fin 6, degree cycle6 v = 2 ∧ degree twoTriangles v = 2) ∧
    ¬(∃ f : Fin 6 → Fin 6, ∀ u v : Fin 6,
      twoTriangles u v = true → cycle6 (f u) (f v) = true) := by
  constructor
  · decide
  · intro h
    obtain ⟨f, preserves⟩ := h
    have noTriangle : ∀ a b c : Fin 6,
        ¬(cycle6 a b = true ∧ cycle6 b c = true ∧ cycle6 c a = true) := by
      decide
    exact noTriangle (f 0) (f 1) (f 2)
      ⟨preserves 0 1 (by decide), preserves 1 2 (by decide),
        preserves 2 0 (by decide)⟩

end Commonsense.GraphShapes
