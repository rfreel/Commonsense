import Std

namespace Commonsense.Packing

/-- Place an item in the earliest bin with sufficient remaining capacity. -/
def place (capacity item : Nat) : List Nat → List Nat
  | [] => [item]
  | load :: rest =>
      if load + item ≤ capacity then (load + item) :: rest
      else load :: place capacity item rest

def firstFit (capacity : Nat) (items : List Nat) : List Nat :=
  items.foldl (fun bins item => place capacity item bins) []

def capacityExample : List Nat := [44, 24, 24, 22, 21, 17, 8, 8, 6, 6]

/-- CI-056. False: larger bins cannot increase the number used by first-fit.
The identical positive items need three bins at capacity 60 and four at 61. -/
theorem larger_bins_more_bins :
    capacityExample.all (fun x => decide (0 < x ∧ x ≤ 60)) = true ∧
    firstFit 60 capacityExample = [60, 60, 60] ∧
    firstFit 61 capacityExample = [61, 56, 57, 6] ∧
    (firstFit 60 capacityExample).length < (firstFit 61 capacityExample).length := by
  decide

def shrinkTail : List Nat := [6, 8, 10, 1, 7, 4, 4, 2, 3]

/-- CI-057. False: shrinking one item cannot worsen first-fit packing.
Only the first item changes, from 5 to 4; capacity stays 10 and five bins
become six. All items are positive and individually fit. -/
theorem smaller_item_more_bins :
    (5 :: shrinkTail).all (fun x => decide (0 < x ∧ x ≤ 10)) = true ∧
    (4 :: shrinkTail).all (fun x => decide (0 < x ∧ x ≤ 10)) = true ∧
    firstFit 10 (5 :: shrinkTail) = [10, 10, 10, 10, 10] ∧
    firstFit 10 (4 :: shrinkTail) = [10, 9, 10, 9, 8, 3] := by
  decide

/-- The examples only use item sizes 0 through 10; compare each multiplicity. -/
abbrev sameItems (xs ys : List Nat) : Prop :=
  ∀ size : Fin 11, xs.count size.val = ys.count size.val

/-- CI-058. False: putting each item in the first available bin minimizes
bin count. Items 4,4,6,6 use three bins, while two bins [4,6] each suffice. -/
theorem first_fit_not_minimum :
    firstFit 10 [4, 4, 6, 6] = [8, 6, 6] ∧
    sameItems [4, 4, 6, 6] ([4, 6] ++ [4, 6]) ∧
    ([4, 6] : List Nat).sum ≤ 10 ∧
    2 < (firstFit 10 [4, 4, 6, 6]).length := by
  decide

/-- CI-059. False: sorting largest-first makes first-fit exact.
The input is already nonincreasing; it uses three bins while the same items
fit into [6,2,2] and [5,3,2], both with load 10. -/
theorem decreasing_first_fit_not_minimum :
    List.Pairwise (fun a b : Nat => b ≤ a) [6, 5, 3, 2, 2, 2] ∧
    firstFit 10 [6, 5, 3, 2, 2, 2] = [9, 9, 2] ∧
    sameItems [6, 5, 3, 2, 2, 2] ([6, 2, 2] ++ [5, 3, 2]) ∧
    ([6, 2, 2] : List Nat).sum = 10 ∧
    ([5, 3, 2] : List Nat).sum = 10 := by
  decide

end Commonsense.Packing
