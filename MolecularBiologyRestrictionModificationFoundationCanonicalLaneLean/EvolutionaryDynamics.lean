import canonicalLaneMathlib.AdmissibleClass
import MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.RestrictionEnzyme
import MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.Methyltransferase
import MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.HorizontalTransfer

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure EvolutionaryDynamicsPackage
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R}
    {H : HorizontalTransferPackage R M} where
  fitnessCost : Prop
  selectivePressure : Prop
  coevolutionModel : Prop
  populationDynamicModel : Prop
  longTermStability : Prop

structure EvolutionaryDynamicsEvidence
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R}
    {H : HorizontalTransferPackage R M}
    (E : EvolutionaryDynamicsPackage R M H) where
  fitnessCostClosed : E.fitnessCost
  selectivePressureClosed : E.selectivePressure
  coevolutionModelClosed : E.coevolutionModel
  populationDynamicModelClosed : E.populationDynamicModel
  longTermStabilityClosed : E.longTermStability

def EvolutionaryDynamicsClosed
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R}
    {H : HorizontalTransferPackage R M}
    (E : EvolutionaryDynamicsPackage R M H) : Prop :=
  E.fitnessCost ∧ E.selectivePressure ∧ E.coevolutionModel ∧ E.populationDynamicModel ∧ E.longTermStability

theorem evolutionary_dynamics_closed_from_evidence
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R}
    {H : HorizontalTransferPackage R M}
    (E : EvolutionaryDynamicsPackage R M H)
    (Ev : EvolutionaryDynamicsEvidence E) : EvolutionaryDynamicsClosed E := by
  exact And.intro Ev.fitnessCostClosed
    (And.intro Ev.selectivePressureClosed
      (And.intro Ev.coevolutionModelClosed
        (And.intro Ev.populationDynamicModelClosed Ev.longTermStabilityClosed)))

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse