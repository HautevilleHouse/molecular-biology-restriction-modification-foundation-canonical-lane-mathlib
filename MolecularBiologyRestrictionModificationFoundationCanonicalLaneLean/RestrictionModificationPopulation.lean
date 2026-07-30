import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationLean

structure RestrictionModificationPopulation where
  bacterialCarrier : Type u
  phageModel : Type v
  restrictionEnzymes : Prop
  modificationMethylation : Prop
  populationDynamicsEquation : Prop

structure PopulationEvidence (P : RestrictionModificationPopulation) where
  restrictionEnzymesClosed : P.restrictionEnzymes
  modificationMethylationClosed : P.modificationMethylation
  populationDynamicsEquationClosed : P.populationDynamicsEquation

def PopulationClosed (P : RestrictionModificationPopulation) : Prop :=
  P.restrictionEnzymes ∧ P.modificationMethylation ∧ P.populationDynamicsEquation

theorem population_closed_from_evidence (P : RestrictionModificationPopulation)
    (E : PopulationEvidence P) : PopulationClosed P := by
  exact And.intro E.restrictionEnzymesClosed
    (And.intro E.modificationMethylationClosed E.populationDynamicsEquationClosed)

end MolecularBiologyRestrictionModificationFoundationLean
end HautevilleHouse
