import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure RestrictionModificationReactionSystem where
  dnaSequence : Type u
  restrictionEnzyme : Type v
  methylationEnzyme : Type w
  recognitionSite : List (dnaSequence → Prop)
  cleavageReaction : Prop
  methylationReaction : Prop
  reactionRatesPositive : Prop
  cleavageReactionTerm : cleavageReaction
  methylationReactionTerm : methylationReaction
  reactionRatesPositiveTerm : reactionRatesPositive

structure RestrictionModificationReactionEvidence (R : RestrictionModificationReactionSystem) where
  cleavageReactionClosed : R.cleavageReaction
  methylationReactionClosed : R.methylationReaction
  reactionRatesPositiveClosed : R.reactionRatesPositive

def RestrictionModificationReactionClosed (R : RestrictionModificationReactionSystem) : Prop :=
  R.cleavageReaction ∧ R.methylationReaction ∧ R.reactionRatesPositive

theorem restriction_modification_reaction_closed_from_evidence
    (R : RestrictionModificationReactionSystem)
    (E : RestrictionModificationReactionEvidence R) :
    RestrictionModificationReactionClosed R :=
by
  exact And.intro E.cleavageReactionClosed
    (And.intro E.methylationReactionClosed E.reactionRatesPositiveClosed)

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse
