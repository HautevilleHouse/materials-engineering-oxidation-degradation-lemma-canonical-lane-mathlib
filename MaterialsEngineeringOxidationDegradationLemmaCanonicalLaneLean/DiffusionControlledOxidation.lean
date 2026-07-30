import MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean.OxidationDegradationDomain

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure DiffusionControlledOxidationPackage {P : OxidationProcess} where
  diffusionCoefficient : ℝ
  parabolicRateConstant : ℝ
  activationEnergy : ℝ
  oxideThicknessEvolution : Prop
  parabolicLawHolds : Prop

structure DiffusionControlledOxidationEvidence {P : OxidationProcess} (D : DiffusionControlledOxidationPackage P) where
  oxideThicknessEvolutionClosed : D.oxideThicknessEvolution
  parabolicLawHoldsClosed : D.parabolicLawHolds

def DiffusionControlledOxidationClosed {P : OxidationProcess} (D : DiffusionControlledOxidationPackage P) : Prop :=
  D.oxideThicknessEvolution ∧ D.parabolicLawHolds

theorem diffusion_controlled_oxidation_closed_from_evidence {P : OxidationProcess} (D : DiffusionControlledOxidationPackage P) (E : DiffusionControlledOxidationEvidence D) : DiffusionControlledOxidationClosed D :=
  And.intro E.oxideThicknessEvolutionClosed E.parabolicLawHoldsClosed

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse