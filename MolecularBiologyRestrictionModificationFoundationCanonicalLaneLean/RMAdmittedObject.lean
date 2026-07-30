import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure RMAdmittedObject where
  enzyme : Type
  recognitionSequence : String
  cleavageActivity : Prop
  modificationMethylation : Prop
  protection : Prop
  conclusion : protection

def RMWitnessClosed (O : RMAdmittedObject) : Prop :=
  O.protection

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse