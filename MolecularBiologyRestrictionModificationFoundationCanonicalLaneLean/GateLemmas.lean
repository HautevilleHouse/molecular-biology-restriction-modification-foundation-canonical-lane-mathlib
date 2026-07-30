import canonicalLaneMathlib.AdmissibleClass
import MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse