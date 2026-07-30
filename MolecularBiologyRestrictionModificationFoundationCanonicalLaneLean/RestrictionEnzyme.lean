import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure RestrictionEnzymePackage where
  recognitionSequence : Type u
  cutPattern : Type v
  methylationSensitivity : Prop
  restrictionActivity : Prop
  dnaBindingDomain : Prop

structure RestrictionEnzymeEvidence (R : RestrictionEnzymePackage) where
  methylationSensitivityClosed : R.methylationSensitivity
  restrictionActivityClosed : R.restrictionActivity
  dnaBindingDomainClosed : R.dnaBindingDomain

def RestrictionEnzymeClosed (R : RestrictionEnzymePackage) : Prop :=
  R.methylationSensitivity ∧ R.restrictionActivity ∧ R.dnaBindingDomain

theorem restriction_enzyme_closed_from_evidence
    (R : RestrictionEnzymePackage) (E : RestrictionEnzymeEvidence R) :
    RestrictionEnzymeClosed R := by
  exact And.intro E.methylationSensitivityClosed
    (And.intro E.restrictionActivityClosed E.dnaBindingDomainClosed)

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse