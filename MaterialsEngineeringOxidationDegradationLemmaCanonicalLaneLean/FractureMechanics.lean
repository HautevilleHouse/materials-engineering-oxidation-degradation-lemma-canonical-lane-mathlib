import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure FracturePackage where
  stressIntensityFactor : Type u
  crackGrowthRate : Type v
  fractureToughness : Type w
  parisLaw : Prop
  fatigueLimit : Prop
  criticalStressCondition : Prop

structure FractureEvidence (F : FracturePackage) where
  parisLawClosed : F.parisLaw
  fatigueLimitClosed : F.fatigueLimit
  criticalStressConditionClosed : F.criticalStressCondition

def FractureClosed (F : FracturePackage) : Prop :=
  F.parisLaw ∧ F.fatigueLimit ∧ F.criticalStressCondition

theorem fracture_closed_from_evidence (F : FracturePackage) (E : FractureEvidence F) : FractureClosed F := by
  exact And.intro E.parisLawClosed (And.intro E.fatigueLimitClosed E.criticalStressConditionClosed)

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse