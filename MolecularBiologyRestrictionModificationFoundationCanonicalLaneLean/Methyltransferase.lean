import canonicalLaneMathlib.AdmissibleClass
import MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.RestrictionEnzyme

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure MethyltransferasePackage {R : RestrictionEnzymePackage} where
  methylationPattern : Type u
  sAdenosylMethionineBinding : Prop
  targetSequenceModification : Prop
  methylationEfficiency : Prop

structure MethyltransferaseEvidence {R : RestrictionEnzymePackage}
    (M : MethyltransferasePackage R) where
  sAdenosylMethionineBindingClosed : M.sAdenosylMethionineBinding
  targetSequenceModificationClosed : M.targetSequenceModification
  methylationEfficiencyClosed : M.methylationEfficiency

def MethyltransferaseClosed {R : RestrictionEnzymePackage}
    (M : MethyltransferasePackage R) : Prop :=
  M.sAdenosylMethionineBinding ∧ M.targetSequenceModification ∧ M.methylationEfficiency

theorem methyltransferase_closed_from_evidence
    {R : RestrictionEnzymePackage} (M : MethyltransferasePackage R)
    (E : MethyltransferaseEvidence M) : MethyltransferaseClosed M := by
  exact And.intro E.sAdenosylMethionineBindingClosed
    (And.intro E.targetSequenceModificationClosed E.methylationEfficiencyClosed)

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse