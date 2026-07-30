import canonicalLaneMathlib.AdmissibleClass
import MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.RestrictionEnzyme
import MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.Methyltransferase

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure RestrictionModificationKineticsPackage
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R} where
  cleavageRateConstant : Type u
  methylationRateConstant : Type v
  competitionModel : Prop
  steadyStateAnalysis : Prop
  reactionDiffusionCoupling : Prop

structure RestrictionModificationKineticsEvidence
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R}
    (K : RestrictionModificationKineticsPackage R M) where
  competitionModelClosed : K.competitionModel
  steadyStateAnalysisClosed : K.steadyStateAnalysis
  reactionDiffusionCouplingClosed : K.reactionDiffusionCoupling

def RestrictionModificationKineticsClosed
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R}
    (K : RestrictionModificationKineticsPackage R M) : Prop :=
  K.competitionModel ∧ K.steadyStateAnalysis ∧ K.reactionDiffusionCoupling

theorem restriction_modification_kinetics_closed_from_evidence
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R}
    (K : RestrictionModificationKineticsPackage R M)
    (E : RestrictionModificationKineticsEvidence K) :
    RestrictionModificationKineticsClosed K := by
  exact And.intro E.competitionModelClosed
    (And.intro E.steadyStateAnalysisClosed E.reactionDiffusionCouplingClosed)

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse