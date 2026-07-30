import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure RmAdmittedObject where
  restrictionEnzymeSystem : Type u
  methylationSystem : Type v
  horizontalTransferEvidence : Prop
  evolutionaryStability : Prop
  conclusion : evolutionaryStability

def RmWitnessClosed (O : RmAdmittedObject) : Prop :=
  O.evolutionaryStability

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse