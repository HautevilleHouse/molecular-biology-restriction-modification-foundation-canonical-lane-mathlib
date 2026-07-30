import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure PopulationDynamicsModel where
  bacterialPopulation : Type u
  phagePopulation : Type v
  growthRate : Prop
  lysisRate : Prop
  immunityAcquisition : Prop
  growthRateTerm : growthRate
  lysisRateTerm : lysisRate
  immunityAcquisitionTerm : immunityAcquisition

structure PopulationDynamicsEvidence (M : PopulationDynamicsModel) where
  growthRateClosed : M.growthRate
  lysisRateClosed : M.lysisRate
  immunityAcquisitionClosed : M.immunityAcquisition

def PopulationDynamicsClosed (M : PopulationDynamicsModel) : Prop :=
  M.growthRate ∧ M.lysisRate ∧ M.immunityAcquisition

theorem population_dynamics_closed_from_evidence
    (M : PopulationDynamicsModel)
    (E : PopulationDynamicsEvidence M) :
    PopulationDynamicsClosed M :=
by
  exact And.intro E.growthRateClosed
    (And.intro E.lysisRateClosed E.immunityAcquisitionClosed)

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse
