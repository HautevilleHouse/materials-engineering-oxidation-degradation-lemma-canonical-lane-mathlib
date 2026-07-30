import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure OxidationDegradationPackage where
  oxideLayerFormation : Prop
  diffusionControlledGrowth : Prop
  parabolicRateConstant : Prop
  scaleFactor : Prop
  oxidationKineticsModeled : Prop

structure OxidationDegradationEvidence (P : OxidationDegradationPackage) where
  oxideLayerFormationClosed : P.oxideLayerFormation
  diffusionControlledGrowthClosed : P.diffusionControlledGrowth
  parabolicRateConstantClosed : P.parabolicRateConstant
  scaleFactorClosed : P.scaleFactor
  oxidationKineticsModeledClosed : P.oxidationKineticsModeled

def OxidationDegradationClosed (P : OxidationDegradationPackage) : Prop :=
  P.oxideLayerFormation ∧ P.diffusionControlledGrowth ∧
  P.parabolicRateConstant ∧ P.scaleFactor ∧ P.oxidationKineticsModeled

theorem oxidation_degradation_closed_from_evidence
    (P : OxidationDegradationPackage) (E : OxidationDegradationEvidence P) :
    OxidationDegradationClosed P := by
  exact And.intro E.oxideLayerFormationClosed
    (And.intro E.diffusionControlledGrowthClosed
      (And.intro E.parabolicRateConstantClosed
        (And.intro E.scaleFactorClosed E.oxidationKineticsModeledClosed)))

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse
