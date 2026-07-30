import canonicalLaneMathlib.AdmissibleClass
import RestrictionModificationReaction
import PopulationDynamicsModel
import CostBenefitAnalysis
import EvolutionaryStabilityAnalysis
import EpidemiologicalModel

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure SystemsBiologyIntegration where
  reactionSystem : RestrictionModificationReactionSystem
  populationModel : PopulationDynamicsModel
  costBenefit : CostBenefitAnalysis
  evolutionaryStability : EvolutionaryStabilityAnalysis
  epidemiologicalModel : EpidemiologicalModel
  integrationConsistent : Prop
  integrationConsistentTerm : integrationConsistent

structure SystemsBiologyEvidence (S : SystemsBiologyIntegration) where
  reactionClosed : RestrictionModificationReactionClosed S.reactionSystem
  populationClosed : PopulationDynamicsClosed S.populationModel
  costBenefitClosed : CostBenefitClosed S.costBenefit
  evolutionaryStabilityClosed : EvolutionaryStabilityClosed S.evolutionaryStability
  epidemiologicalClosed : EpidemiologicalClosed S.epidemiologicalModel
  integrationConsistentClosed : S.integrationConsistent

def SystemsBiologyClosed (S : SystemsBiologyIntegration) : Prop :=
  RestrictionModificationReactionClosed S.reactionSystem ∧
  PopulationDynamicsClosed S.populationModel ∧
  CostBenefitClosed S.costBenefit ∧
  EvolutionaryStabilityClosed S.evolutionaryStability ∧
  EpidemiologicalClosed S.epidemiologicalModel ∧
  S.integrationConsistent

theorem systems_biology_closed_from_evidence
    (S : SystemsBiologyIntegration)
    (E : SystemsBiologyEvidence S) :
    SystemsBiologyClosed S :=
by
  exact And.intro E.reactionClosed
    (And.intro E.populationClosed
      (And.intro E.costBenefitClosed
        (And.intro E.evolutionaryStabilityClosed
          (And.intro E.epidemiologicalClosed E.integrationConsistentClosed))))

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse
