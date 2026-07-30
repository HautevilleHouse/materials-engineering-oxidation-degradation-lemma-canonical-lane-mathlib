import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure OxidationAdmittedObject where
  material : Type
  oxideLayerThickness : ℕ → ℝ
  boundaryConditions : Prop
  diffusionEquationSolution : Prop

structure AdmissibleClass where
  object : OxidationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  OxidationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def OxidationWitnessClosed (O : OxidationAdmittedObject) : Prop :=
  O.diffusionEquationSolution

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse