import Std

namespace Commonsense.CodingAndLimits

def codeword (symbol : Fin 3) : List Bool :=
  if symbol = 0 then [false]
  else if symbol = 1 then [false, true]
  else [true, false]

def encode (message : List (Fin 3)) : List Bool := message.flatMap codeword

/-- CI-077. False: distinct nonempty codewords guarantee unambiguous
concatenated messages. The codewords 0,01,10 are distinct, but messages
[0,2] and [1,0] both encode to the bit sequence 010. -/
theorem distinct_codewords_ambiguous_messages :
    (∀ symbol : Fin 3, 0 < (codeword symbol).length) ∧
    (∀ a b : Fin 3, codeword a = codeword b → a = b) ∧
    ([0, 2] : List (Fin 3)) ≠ [1, 0] ∧
    encode [0, 2] = encode [1, 0] := by
  decide

def outcomes : List (Fin 4) := [0, 1, 2, 3]
def target (i : Fin 4) : Bool := decide (i.val < 3)
def evidence (i : Fin 4) : Bool := decide (2 ≤ i.val)
def count (event : Fin 4 → Bool) : Nat := (outcomes.filter event).length

/-- CI-078. False: receiving additional evidence can only increase the
posterior probability of the most likely binary outcome. On four equally
likely states, the prior best guess has probability 3/4; conditioning on
the positive-probability event {2,3} leaves both outcomes at 1/2. -/
theorem evidence_can_reduce_confidence :
    count target = 3 ∧ count (fun i => !(target i)) = 1 ∧
    count evidence = 2 ∧
    count (fun i => target i && evidence i) = 1 ∧
    count (fun i => !(target i) && evidence i) = 1 ∧
    max (count (fun i => target i && evidence i))
        (count (fun i => !(target i) && evidence i)) * 4 <
      max (count target) (count (fun i => !(target i))) * count evidence := by
  decide

/-- Exact comparison of fractions; positive denominators are part of the relation. -/
def fractionLT (a b : Nat × Nat) : Prop :=
  0 < a.2 ∧ 0 < b.2 ∧ a.1 * b.2 < b.1 * a.2

def rising (n : Nat) : Nat × Nat := (n, n + 1)

/-- CI-079. False: a strictly increasing rational sequence must be unbounded.
The fractions n/(n+1) strictly increase for every pair of increasing indices
while every term remains strictly below one. -/
theorem strictly_increasing_but_bounded :
    (∀ m n : Nat, m < n → fractionLT (rising m) (rising n)) ∧
    (∀ n : Nat, fractionLT (rising n) (1, 1)) := by
  constructor
  · intro m n h
    change 0 < m + 1 ∧ 0 < n + 1 ∧ m * (n + 1) < n * (m + 1)
    constructor
    · omega
    constructor
    · omega
    simp only [Nat.mul_add, Nat.mul_one]
    have commute : m * n = n * m := Nat.mul_comm m n
    omega
  · intro n
    change 0 < n + 1 ∧ 0 < 1 ∧ n * 1 < 1 * (n + 1)
    simp only [Nat.mul_one, Nat.one_mul]
    omega

/-- CI-080. False: arbitrarily long finite descending chains guarantee an
infinite descending chain. Natural numbers admit a countdown of every
finite length, but no function Nat -> Nat decreases strictly forever. -/
theorem arbitrarily_long_not_infinite :
    (∀ bound : Nat, ∃ f : Nat → Nat,
      ∀ n : Nat, n < bound → f (n + 1) < f n) ∧
    ¬(∃ f : Nat → Nat, ∀ n : Nat, f (n + 1) < f n) := by
  constructor
  · intro bound
    refine ⟨fun n => bound - n, ?_⟩
    intro n h
    dsimp
    omega
  · intro h
    obtain ⟨f, descends⟩ := h
    have budget : ∀ n : Nat, f n + n ≤ f 0 := by
      intro n
      induction n with
      | zero => omega
      | succ n ih =>
          have step := descends n
          omega
    have impossible := budget (f 0 + 1)
    omega

end Commonsense.CodingAndLimits
