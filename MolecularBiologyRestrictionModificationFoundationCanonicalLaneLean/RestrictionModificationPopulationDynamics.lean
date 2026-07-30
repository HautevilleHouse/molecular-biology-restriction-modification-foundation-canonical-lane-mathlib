import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure RMEnzymeSystem where
  restrictase : Type u
  methylase  : Type v
  recognitionSite : Prop
  cleavageActivity : Prop
  methylationActivity : Prop
  restrictionModificationBalance : Prop

structure RMPopulationDynamics where
  hostPopulation : Type u
  generationTime : Prop
  infectionRate : Prop
  immuneEscapeRate : Prop
  populationStability : Prop
  system : RMEnzymeSystem
  populationClosure : system.restrictionModificationBalance ∧ generationTime ∧ infectionRate ∧ immuneEscapeRate → populationStability

structure RMPopulationDynamicsPackage {A : AdmissibleClass} (sys : RMEnzymeSystem) where
  dynamics : RMPopulationDynamics
  evidence : dynamics.populationClosure

def RMPopulationDynamicsClosed {A : AdmissibleClass} {sys : RMEnzymeSystem} (P : RMPopulationDynamicsPackage A sys) : Prop :=
  P.dynamics.populationStability

theorem rm_population_dynamics_closed_from_evidence
    {A : AdmissibleClass} {sys : RMEnzymeSystem} (P : RMPopulationDynamicsPackage A sys) :
    RMPopulationDynamicsClosed P := by
  exact P.evidence

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse
