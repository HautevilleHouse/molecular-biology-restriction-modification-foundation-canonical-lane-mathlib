import HautevilleHouse.MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.PopulationDynamics
import HautevilleHouse.MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure CompartmentParameters where
  β : ℝ
  γ : ℝ
  β_pos : β > 0
  γ_pos : γ > 0

structure SIRState where
  S : ℝ
  I : ℝ
  R : ℝ

def sirDerivative (S I R : ℝ) (β γ : ℝ) : ℝ × ℝ × ℝ :=
  ((-β * S * I, β * S * I - γ * I, γ * I))

theorem sir_solution_nonneg (S I R : ℝ) (β γ : ℝ) (hS : S ≥ 0) (hI : I ≥ 0) (hR : R ≥ 0)
  (hβ : β > 0) (hγ : γ > 0) :
  let (dS, dI, dR) := sirDerivative S I R β γ
  dS ≤ 0 ∧ dI ≥ 0 ∧ dR ≥ 0 := by
  intro d
  obtain ⟨dS, dI, dR⟩ := d
  have h1 : -β * S * I ≤ 0 := by nlinarith
  have h2 : β * S * I - γ * I ≥ 0 := by nlinarith
  have h3 : γ * I ≥ 0 := by nlinarith
  exact ⟨h1, h2, h3⟩

structure RestrictionModificationSIR extends CompartmentParameters where
  s0 : ℝ
  i0 : ℝ
  r0 : ℝ
  s0_nonneg : s0 ≥ 0
  i0_nonneg : i0 ≥ 0
  r0_nonneg : r0 ≥ 0
  total : s0 + i0 + r0 = 1

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse