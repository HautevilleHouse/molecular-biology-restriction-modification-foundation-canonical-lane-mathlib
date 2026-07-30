import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationLean

structure FitnessPayoffMatrix where
  hostTypes : Nat
  phageTypes : Nat
  payoffEntries : Type u
  payoffPositive : Prop
  payoffFinite : Prop

structure ReplicatorEquation (F : FitnessPayoffMatrix) where
  frequencyVector : Type v
  payoffExpected : Type w
  replicatorDynamicsEquation : Prop
  stationaryPointsCharacterized : Prop

structure ReplicatorEvidence (F : FitnessPayoffMatrix) (R : ReplicatorEquation F) where
  replicatorDynamicsEquationClosed : R.replicatorDynamicsEquation
  stationaryPointsCharacterizedClosed : R.stationaryPointsCharacterized

def ReplicatorClosed (F : FitnessPayoffMatrix) (R : ReplicatorEquation F) : Prop :=
  R.replicatorDynamicsEquation ∧ R.stationaryPointsCharacterized

theorem replicator_closed_from_evidence (F : FitnessPayoffMatrix) (R : ReplicatorEquation F)
    (E : ReplicatorEvidence F R) : ReplicatorClosed F R := by
  exact And.intro E.replicatorDynamicsEquationClosed E.stationaryPointsCharacterizedClosed

structure EvolutionaryStableState (F : FitnessPayoffMatrix) where
  frequencyVector : Type v
  invasionResistance : Prop
  stabilityUnderPerturbation : Prop
  payoffDominance : Prop

structure EvolutionaryStableEvidence (F : FitnessPayoffMatrix) (S : EvolutionaryStableState F) where
  invasionResistanceClosed : S.invasionResistance
  stabilityUnderPerturbationClosed : S.stabilityUnderPerturbation
  payoffDominanceClosed : S.payoffDominance

def EvolutionaryStableClosed (F : FitnessPayoffMatrix) (S : EvolutionaryStableState F) : Prop :=
  S.invasionResistance ∧ S.stabilityUnderPerturbation ∧ S.payoffDominance

theorem evolutionary_stable_closed_from_evidence (F : FitnessPayoffMatrix)
    (S : EvolutionaryStableState F) (E : EvolutionaryStableEvidence F S) :
    EvolutionaryStableClosed F S := by
  exact And.intro E.invasionResistanceClosed
    (And.intro E.stabilityUnderPerturbationClosed E.payoffDominanceClosed)

end MolecularBiologyRestrictionModificationFoundationLean
end HautevilleHouse
