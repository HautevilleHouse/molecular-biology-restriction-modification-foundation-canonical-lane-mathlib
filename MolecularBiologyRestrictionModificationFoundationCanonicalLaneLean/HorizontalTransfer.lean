import canonicalLaneMathlib.AdmissibleClass
import MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.RestrictionEnzyme
import MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.Methyltransferase

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure HorizontalTransferPackage
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R} where
  foreignDnaRecognition : Prop
  restrictionBarrier : Prop
  methylationEscape : Prop
  transferEfficiency : Prop
  populationDynamicsModel : Prop

structure HorizontalTransferEvidence
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R}
    (H : HorizontalTransferPackage R M) where
  restrictionBarrierClosed : H.restrictionBarrier
  methylationEscapeClosed : H.methylationEscape
  transferEfficiencyClosed : H.transferEfficiency
  populationDynamicsModelClosed : H.populationDynamicsModel

def HorizontalTransferClosed
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R}
    (H : HorizontalTransferPackage R M) : Prop :=
  H.restrictionBarrier ∧ H.methylationEscape ∧ H.transferEfficiency ∧ H.populationDynamicsModel

theorem horizontal_transfer_closed_from_evidence
    {R : RestrictionEnzymePackage} {M : MethyltransferasePackage R}
    (H : HorizontalTransferPackage R M) (E : HorizontalTransferEvidence H) :
    HorizontalTransferClosed H := by
  exact And.intro E.restrictionBarrierClosed
    (And.intro E.methylationEscapeClosed
      (And.intro E.transferEfficiencyClosed E.populationDynamicsModelClosed))

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse