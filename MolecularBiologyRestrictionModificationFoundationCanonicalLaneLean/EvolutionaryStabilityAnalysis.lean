import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure EvolutionaryStabilityAnalysis where
  gamePayoffMatrix : Type u
  stableStrategy : Prop
  invasionResistance : Prop
  stableStrategyTerm : stableStrategy
  invasionResistanceTerm : invasionResistance

structure EvolutionaryStabilityEvidence (E : EvolutionaryStabilityAnalysis) where
  stableStrategyClosed : E.stableStrategy
  invasionResistanceClosed : E.invasionResistance

def EvolutionaryStabilityClosed (E : EvolutionaryStabilityAnalysis) : Prop :=
  E.stableStrategy ∧ E.invasionResistance

theorem evolutionary_stability_closed_from_evidence
    (E : EvolutionaryStabilityAnalysis)
    (Ev : EvolutionaryStabilityEvidence E) :
    EvolutionaryStabilityClosed E :=
by
  exact And.intro Ev.stableStrategyClosed Ev.invasionResistanceClosed

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse
