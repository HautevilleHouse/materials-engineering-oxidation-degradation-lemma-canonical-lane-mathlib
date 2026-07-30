import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure DiffusionLayerModel where
  material : Type
  diffusionCoefficient : ℝ
  layerThickness : ℕ → ℝ
  concentrationField : ℕ → ℝ
  internalVariable : ℕ → ℝ
  fickSecondLawSat : Prop
  movingBoundaryCondition : Prop

structure DiffusionLayerEvidence (D : DiffusionLayerModel) where
  fickSecondLawSatClosed : D.fickSecondLawSat
  movingBoundaryConditionClosed : D.movingBoundaryCondition

def DiffusionLayerClosed (D : DiffusionLayerModel) : Prop :=
  D.fickSecondLawSat ∧ D.movingBoundaryCondition

theorem diffusion_layer_closed_from_evidence
    (D : DiffusionLayerModel) (E : DiffusionLayerEvidence D) :
    DiffusionLayerClosed D := by
  exact And.intro E.fickSecondLawSatClosed E.movingBoundaryConditionClosed

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse