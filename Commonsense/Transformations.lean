import Std

namespace Commonsense.Transformations

/-- CI-070. False: applying one strictly increasing transformation preserves
the ordering of group averages. Squaring is strictly increasing on the
admissible values 0 through 9, yet [1,9] has smaller mean than [6,6] before
squaring and larger mean afterward; both groups have the same size. -/
theorem increasing_transform_reverses_mean_ranking :
    (∀ a b : Fin 10, a < b → a.val ^ 2 < b.val ^ 2) ∧
    (1 : Nat) + 9 < 6 + 6 ∧
    (1 : Nat) ^ 2 + 9 ^ 2 > 6 ^ 2 + 6 ^ 2 := by
  decide

/-- Unweighted squared Euclidean distance from the origin, with the first
coordinate expressed in units scaled by xScale. -/
def squaredDistance (xScale : Nat) (point : Nat × Nat) : Nat :=
  (xScale * point.1) ^ 2 + point.2 ^ 2

/-- CI-071. False: changing a coordinate's units leaves raw nearest-neighbor
selection unchanged. The fixed points (1,4) and (3,2) reverse their ordering
when only the numerical unit scale of the first coordinate changes by ten. -/
theorem units_reverse_nearest_neighbor :
    squaredDistance 1 (3, 2) = 13 ∧ squaredDistance 1 (1, 4) = 17 ∧
    squaredDistance 10 (1, 4) = 116 ∧ squaredDistance 10 (3, 2) = 904 ∧
    squaredDistance 1 (3, 2) < squaredDistance 1 (1, 4) ∧
    squaredDistance 10 (1, 4) < squaredDistance 10 (3, 2) := by
  decide

def swap01 (x : Fin 3) : Fin 3 := if x = 0 then 1 else if x = 1 then 0 else 2
def swap12 (x : Fin 3) : Fin 3 := if x = 1 then 2 else if x = 2 then 1 else 0

/-- CI-072. False: individually reversible operations can be applied in
any order. Each swap is its own inverse, but the two compositions disagree. -/
theorem reversible_operations_do_not_commute :
    (∀ x : Fin 3, swap01 (swap01 x) = x) ∧
    (∀ x : Fin 3, swap12 (swap12 x) = x) ∧
    swap01 (swap12 0) ≠ swap12 (swap01 0) := by
  decide

/-- CI-073. False: a rectangle enclosing more area must have a longer
perimeter. All side lengths are positive; a 4-by-4 square has area 16 and
perimeter 16, while a 1-by-10 rectangle has area 10 and perimeter 22. -/
theorem larger_area_smaller_perimeter :
    ∃ a b c d : Nat,
      0 < a ∧ 0 < b ∧ 0 < c ∧ 0 < d ∧
      a * b > c * d ∧ 2 * (a + b) < 2 * (c + d) := by
  refine ⟨4, 4, 1, 10, ?_⟩
  decide

def volume (a b c : Nat) : Nat := a * b * c
def surfaceArea (a b c : Nat) : Nat := 2 * (a * b + a * c + b * c)

/-- CI-074. False: equal-volume rectangular boxes require equal surface
area. Positive side lengths 1,1,8 and 2,2,2 enclose equal volume but have
surface areas 34 and 24. -/
theorem same_volume_different_surface :
    ∃ a b c d e f : Nat,
      0 < a ∧ 0 < b ∧ 0 < c ∧ 0 < d ∧ 0 < e ∧ 0 < f ∧
      volume a b c = volume d e f ∧
      surfaceArea a b c > surfaceArea d e f := by
  refine ⟨1, 1, 8, 2, 2, 2, ?_⟩
  decide

end Commonsense.Transformations
