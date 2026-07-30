import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure RMStrategy where
  type : Type u
  cost : Prop
  benefit : Prop
  fitness : Prop

struct RMPayoff where
  payoffMatrix : Type u
  nashEquilibrium : Prop
  evolutionaryStableStrategy : Prop

struct RMEvolutionaryGamePackage {A : AdmissibleClass} (S : RMStrategy) where
  payoff : RMPayoff
  evidence : payoff.evolutionaryStableStrategy

def RMEvolutionaryGameClosed {A : AdmissibleClass} {S : RMStrategy} (G : RMEvolutionaryGamePackage A S) : Prop :=
  G.payoff.evolutionaryStableStrategy

theorem rm_evolutionary_game_closed_from_evidence
    {A : AdmissibleClass} {S : RMStrategy} (G : RMEvolutionaryGamePackage A S) :
    RMEvolutionaryGameClosed G := by
  exact G.evidence

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse
