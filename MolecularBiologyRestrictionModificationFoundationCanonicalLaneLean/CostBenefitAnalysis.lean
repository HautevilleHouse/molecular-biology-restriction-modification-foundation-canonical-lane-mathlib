import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure CostBenefitAnalysis where
  modificationCost : Prop
  restrictionBenefit : Prop
  horizontalTransferFitness : Prop
  modificationCostTerm : modificationCost
  restrictionBenefitTerm : restrictionBenefit
  horizontalTransferFitnessTerm : horizontalTransferFitness

structure CostBenefitEvidence (C : CostBenefitAnalysis) where
  modificationCostClosed : C.modificationCost
  restrictionBenefitClosed : C.restrictionBenefit
  horizontalTransferFitnessClosed : C.horizontalTransferFitness

def CostBenefitClosed (C : CostBenefitAnalysis) : Prop :=
  C.modificationCost ∧ C.restrictionBenefit ∧ C.horizontalTransferFitness

theorem cost_benefit_closed_from_evidence
    (C : CostBenefitAnalysis)
    (E : CostBenefitEvidence C) :
    CostBenefitClosed C :=
by
  exact And.intro E.modificationCostClosed
    (And.intro E.restrictionBenefitClosed E.horizontalTransferFitnessClosed)

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse
