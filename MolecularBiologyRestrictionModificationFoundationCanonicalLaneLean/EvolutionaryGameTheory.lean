import HautevilleHouse.MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.RestrictionModificationCore
import HautevilleHouse.MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure GamePayoffs where
  a : ℝ
  b : ℝ
  c : ℝ
  d : ℝ
  a_nonneg : a ≥ 0
  b_nonneg : b ≥ 0
  c_nonneg : c ≥ 0
  d_nonneg : d ≥ 0

structure ReplicatorDynamics where
  x : ℝ
  y : ℝ
  fitnessPlayer1 : ℝ
  fitnessPlayer2 : ℝ

def payoffMatrix (a b c d : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  !![a, b; c, d]

theorem payoff_matrix_symmetric (a b c d : ℝ) (h : a = d ∧ b = c) : payoffMatrix a b c d = (payoffMatrix a b c d)ᵀ := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [h.1, h.2]

structure RestrictionModificationGame (P : RestrictionModificationPair) where
  payoffs : GamePayoffs
  payoffNonneg : payoffs.a_nonneg ∧ payoffs.b_nonneg ∧ payoffs.c_nonneg ∧ payoffs.d_nonneg
  fitnessFunction : ℝ → ℝ → ℝ
  fitnessNonneg : ∀ x y, x ≥ 0 → y ≥ 0 → fitnessFunction x y ≥ 0

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse