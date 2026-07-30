import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure EpidemiologicalModel where
  susceptible : Type u
  infected : Type v
  resistant : Type w
  transmissionRate : Prop
  recoveryRate : Prop
  immunityDuration : Prop
  transmissionRateTerm : transmissionRate
  recoveryRateTerm : recoveryRate
  immunityDurationTerm : immunityDuration

structure EpidemiologicalEvidence (E : EpidemiologicalModel) where
  transmissionRateClosed : E.transmissionRate
  recoveryRateClosed : E.recoveryRate
  immunityDurationClosed : E.immunityDuration

def EpidemiologicalClosed (E : EpidemiologicalModel) : Prop :=
  E.transmissionRate ∧ E.recoveryRate ∧ E.immunityDuration

theorem epidemiological_closed_from_evidence
    (E : EpidemiologicalModel)
    (Ev : EpidemiologicalEvidence E) :
    EpidemiologicalClosed E :=
by
  exact And.intro Ev.transmissionRateClosed
    (And.intro Ev.recoveryRateClosed Ev.immunityDurationClosed)

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse
