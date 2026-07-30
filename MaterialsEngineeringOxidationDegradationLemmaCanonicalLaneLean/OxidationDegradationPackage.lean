import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure OxidationDegradationPackage where
  metalSurface : Type u
  oxideLayer : Type v
  diffusionCoefficient : ℝ
  oxidationRate : ℝ
  temperature : ℝ
  activationEnergy : ℝ
  parabolicConstant : ℝ
  oxideThickness : ℝ → ℝ
  degradationRate : ℝ
  initialOxideThickness : ℝ
  time : ℝ
  oxygenConcentration : ℝ
  metalIonConcentration : ℝ
  interfaceReactionRate : ℝ
  cyclicOxidationCycles : ℕ
  thermalCycleAmplitude : ℝ
  thermalCycleFrequency : ℝ
  stressStrainCoupled : Bool

structure OxidationDegradationEvidence (P : OxidationDegradationPackage) where
  diffusionCoefficientPositive : P.diffusionCoefficient > 0
  parabolicConstantPositive : P.parabolicConstant > 0
  activationEnergyPositive : P.activationEnergy > 0
  degradationRatePositive : P.degradationRate > 0
  initialOxideThicknessNonnegative : P.initialOxideThickness ≥ 0
  oxygenConcentrationPositive : P.oxygenConcentration > 0
  metalIonConcentrationPositive : P.metalIonConcentration > 0
  interfaceReactionRatePositive : P.interfaceReactionRate > 0

def OxidationDegradationClosed (P : OxidationDegradationPackage) : Prop :=
  P.diffusionCoefficient > 0 ∧
  P.parabolicConstant > 0 ∧
  P.activationEnergy > 0 ∧
  P.degradationRate > 0 ∧
  P.initialOxideThickness ≥ 0 ∧
  P.oxygenConcentration > 0 ∧
  P.metalIonConcentration > 0 ∧
  P.interfaceReactionRate > 0

theorem oxidation_degradation_closed_from_evidence (P : OxidationDegradationPackage) (E : OxidationDegradationEvidence P) :
    OxidationDegradationClosed P := by
  exact And.intro E.diffusionCoefficientPositive
    (And.intro E.parabolicConstantPositive
      (And.intro E.activationEnergyPositive
        (And.intro E.degradationRatePositive
          (And.intro E.initialOxideThicknessNonnegative
            (And.intro E.oxygenConcentrationPositive
              (And.intro E.metalIonConcentrationPositive E.interfaceReactionRatePositive))))))

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse