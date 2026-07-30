import HautevilleHouse.MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure RestrictionEnzyme where
  recognitionSequence : String
  cutPattern : String
  methylationSensitive : Bool
  naming : String

dedup def defaultEnzymes : List RestrictionEnzyme :=
  [ { recognitionSequence := "GAATTC", cutPattern := "G^AATTC", methylationSensitive := true, naming := "EcoRI" }
  , { recognitionSequence := "AAGCTT", cutPattern := "A^AGCTT", methylationSensitive := true, naming := "HindIII" }
  , { recognitionSequence := "GGATCC", cutPattern := "G^GATCC", methylationSensitive := false, naming := "BamHI" }
  ]

structure ModificationEnzyme where
  targetMotif : String
  modificationType : String
  naming : String

dedup def defaultModificationEnzymes : List ModificationEnzyme :=
  [ { targetMotif := "CG", modificationType := "methylation", naming := "M.SssI" }
  , { targetMotif := "GATC", modificationType := "methylation", naming := "Dam" }
  ]

structure RestrictionModificationPair where
  restrictionEnzyme : RestrictionEnzyme
  modificationEnzyme : ModificationEnzyme
  pairFunctional : Prop
  pairFunctionalEvidence : pairFunctional

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse