import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationLean

structure CompartmentEpidemiologyModel where
  susceptible : Type u
  infected : Type v
  recovered : Type w
  transmissionRate : Prop
  recoveryRate : Prop
  basicReproductiveNumber : Prop

structure CompartmentEvidence (M : CompartmentEpidemiologyModel) where
  transmissionRateClosed : M.transmissionRate
  recoveryRateClosed : M.recoveryRate
  basicReproductiveNumberClosed : M.basicReproductiveNumber

def CompartmentEpidemiologyClosed (M : CompartmentEpidemiologyModel) : Prop :=
  M.transmissionRate ∧ M.recoveryRate ∧ M.basicReproductiveNumber

theorem compartment_epidemiology_closed_from_evidence (M : CompartmentEpidemiologyModel)
    (E : CompartmentEvidence M) : CompartmentEpidemiologyClosed M := by
  exact And.intro E.transmissionRateClosed
    (And.intro E.recoveryRateClosed E.basicReproductiveNumberClosed)

structure EndemicEquilibrium (M : CompartmentEpidemiologyModel) where
  equilibriumExists : Prop
  stabilityCondition : Prop
  endemicThreshold : Prop

structure EndemicEvidence (M : CompartmentEpidemiologyModel) (E : EndemicEquilibrium M) where
  equilibriumExistsClosed : E.equilibriumExists
  stabilityConditionClosed : E.stabilityCondition
  endemicThresholdClosed : E.endemicThreshold

def EndemicClosed (M : CompartmentEpidemiologyModel) (E : EndemicEquilibrium M) : Prop :=
  E.equilibriumExists ∧ E.stabilityCondition ∧ E.endemicThreshold

theorem endemic_closed_from_evidence (M : CompartmentEpidemiologyModel)
    (E : EndemicEquilibrium M) (Ev : EndemicEvidence M E) : EndemicClosed M E := by
  exact And.intro Ev.equilibriumExistsClosed
    (And.intro Ev.stabilityConditionClosed Ev.endemicThresholdClosed)

end MolecularBiologyRestrictionModificationFoundationLean
end HautevilleHouse
