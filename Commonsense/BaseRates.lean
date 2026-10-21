/-! A fully specified population showing a low positive predictive value. -/
namespace Commonsense

def population : Nat := 10000
def affected : Nat := 100
def truePositiveTests : Nat := 99
def falsePositiveTests : Nat := (population - affected) * 5 / 100

theorem positive_test_one_sixth :
    falsePositiveTests = 495 ∧
    6 * truePositiveTests =
      truePositiveTests + falsePositiveTests := by
  decide

end Commonsense
