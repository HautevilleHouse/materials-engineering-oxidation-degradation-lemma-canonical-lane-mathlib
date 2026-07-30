import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure ElasticityFracturePackage where
  stressStrainTensor : Prop
  fractureToughness : Prop
  crackPropagation : Prop
  residualStrength : Prop

structure ElasticityFractureEvidence (F : ElasticityFracturePackage) where
  stressStrainTensorClosed : F.stressStrainTensor
  fractureToughnessClosed : F.fractureToughness
  crackPropagationClosed : F.crackPropagation
  residualStrengthClosed : F.residualStrength

def ElasticityFractureClosed (F : ElasticityFracturePackage) : Prop :=
  F.stressStrainTensor ∧ F.fractureToughness ∧ F.crackPropagation ∧ F.residualStrength

theorem elasticity_fracture_closed_from_evidence (F : ElasticityFracturePackage) (E : ElasticityFractureEvidence F) : ElasticityFractureClosed F := by
  exact And.intro E.stressStrainTensorClosed (And.intro E.fractureToughnessClosed (And.intro E.crackPropagationClosed E.residualStrengthClosed))

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse