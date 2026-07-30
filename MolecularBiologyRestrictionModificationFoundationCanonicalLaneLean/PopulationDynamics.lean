import HautevilleHouse.MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.RestrictionModificationCore
import HautevilleHouse.MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure Replicon where
  copyNumber : ℕ
  generationTime : ℝ
  mutationRate : ℝ

structure PopulationDynamicsParameters where
  initialPopulation : ℕ
  growthRate : ℝ
  carryingCapacity : ℕ

def logisticGrowth (P : ℕ) (K : ℕ) (r : ℝ) : ℝ :=
  if K = 0 then 0 else r * (P : ℝ) * (1 - (P : ℝ) / (K : ℝ))

theorem logistic_growth_pos (P : ℕ) (K : ℕ) (r : ℝ) (hP : P > 0) (hK : K > 0) (hr : r > 0) (h : (P : ℝ) < (K : ℝ)) :
  logisticGrowth P K r > 0 := by
  unfold logisticGrowth
  have : (K : ℝ) > 0 := by exact_mod_cast hK
  have h' : 1 - (P : ℝ) / (K : ℝ) > 0 := by
    nlinarith
  positivity

structure RestrictionModificationPopulationParameters extends PopulationDynamicsParameters where
  epsilon : ℝ
  delta : ℝ

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse