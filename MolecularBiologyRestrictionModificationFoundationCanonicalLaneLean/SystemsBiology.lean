import HautevilleHouse.MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.RestrictionModificationCore
import HautevilleHouse.MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean

structure BiochemicalReaction where
  substrate : String
  product : String
  rateConstant : ℝ
  reactionOrder : ℕ
  rateConstantPos : rateConstant > 0

structure MetabolicPathway where
  reactions : List BiochemicalReaction
  species : List String
  connectivityMatrix : Matrix ℕ ℕ ℕ

structure RegulatoryNetwork where
  nodes : List String
  edges : List (String × String × ℝ)
  edgeRegulation : ∀ (u v : String) (w : ℝ), (u, v, w) ∈ edges → w > 0

structure RestrictionModificationRegulatoryNetwork extends RegulatoryNetwork where
  restrictionEnzymes : List RestrictionEnzyme
  modificationEnzymes : List ModificationEnzyme
  expressionLevels : ℕ → ℝ
  expressionPos : ∀ n, expressionLevels n > 0

end MolecularBiologyRestrictionModificationFoundationCanonicalLaneLean
end HautevilleHouse