import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure RMAllele where
  alleleType : Type u
  frequency : Prop
  selectionCoefficient : Prop
  dominant : Prop
  recessive : Prop

struct RMPopulationGenetics where
  allelePool : List RMAllele
  hardyWeinbergEquilibrium : Prop
  alleleFrequencyDynamics : Prop
  selectionPressure : Prop
  geneticDrift : Prop
  populationGeneticsClosure : hardyWeinbergEquilibrium ∧ alleleFrequencyDynamics ∧ selectionPressure ∧ geneticDrift

struct RMPopulationGeneticsPackage {A : AdmissibleClass} where
  genetics : RMPopulationGenetics
  evidence : genetics.populationGeneticsClosure

def RMPopulationGeneticsClosed {A : AdmissibleClass} (G : RMPopulationGeneticsPackage A) : Prop :=
  G.genetics.hardyWeinbergEquilibrium ∧ G.genetics.alleleFrequencyDynamics ∧ G.genetics.selectionPressure ∧ G.genetics.geneticDrift

theorem rm_population_genetics_closed_from_evidence
    {A : AdmissibleClass} (G : RMPopulationGeneticsPackage A) :
    RMPopulationGeneticsClosed G := by
  exact G.evidence

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse
