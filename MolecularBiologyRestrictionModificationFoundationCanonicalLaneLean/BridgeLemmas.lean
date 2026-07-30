import canonicalLaneMathlib.AdmissibleClass
import MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  RmWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse