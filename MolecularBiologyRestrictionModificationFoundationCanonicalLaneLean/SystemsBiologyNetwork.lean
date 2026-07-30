import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationLean

structure GeneRegulatoryNetwork where
  geneSet : Type u
  regulatoryInteractions : Type v
  activationFunction : Prop
  repressionFunction : Prop
  networkDynamicsEquation : Prop

structure NetworkEvidence (N : GeneRegulatoryNetwork) where
  activationFunctionClosed : N.activationFunction
  repressionFunctionClosed : N.repressionFunction
  networkDynamicsEquationClosed : N.networkDynamicsEquation

def NetworkClosed (N : GeneRegulatoryNetwork) : Prop :=
  N.activationFunction ∧ N.repressionFunction ∧ N.networkDynamicsEquation

theorem network_closed_from_evidence (N : GeneRegulatoryNetwork)
    (E : NetworkEvidence N) : NetworkClosed N := by
  exact And.intro E.activationFunctionClosed
    (And.intro E.repressionFunctionClosed E.networkDynamicsEquationClosed)

structure RestrictionModificationNetwork (N : GeneRegulatoryNetwork) where
  restrictionModificationGenes : N.geneSet → Prop
  methyltransferaseActivity : Prop
  endonucleaseActivity : Prop
  regulatoryFeedback : Prop

structure RestrictionModificationNetworkEvidence (N : GeneRegulatoryNetwork)
    (R : RestrictionModificationNetwork N) where
  restrictionModificationGenesClosed : ∀ g : N.geneSet, R.restrictionModificationGenes g
  methyltransferaseActivityClosed : R.methyltransferaseActivity
  endonucleaseActivityClosed : R.endonucleaseActivity
  regulatoryFeedbackClosed : R.regulatoryFeedback

def RestrictionModificationNetworkClosed (N : GeneRegulatoryNetwork)
    (R : RestrictionModificationNetwork N) : Prop :=
  (∀ g : N.geneSet, R.restrictionModificationGenes g) ∧
  R.methyltransferaseActivity ∧ R.endonucleaseActivity ∧ R.regulatoryFeedback

theorem restriction_modification_network_closed_from_evidence
    (N : GeneRegulatoryNetwork) (R : RestrictionModificationNetwork N)
    (E : RestrictionModificationNetworkEvidence N R) :
    RestrictionModificationNetworkClosed N R := by
  exact And.intro E.restrictionModificationGenesClosed
    (And.intro E.methyltransferaseActivityClosed
      (And.intro E.endonucleaseActivityClosed E.regulatoryFeedbackClosed))

end MolecularBiologyRestrictionModificationFoundationLean
end HautevilleHouse
