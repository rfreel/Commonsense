/-! Simpson's paradox with exact integer cross-products. -/
namespace Commonsense

theorem simpsons_paradox :
    81 * 270 > 234 * 87 ∧
    192 * 80 > 55 * 263 ∧
    (81 + 192) * (270 + 80) <
      (234 + 55) * (87 + 263) := by
  decide

end Commonsense
