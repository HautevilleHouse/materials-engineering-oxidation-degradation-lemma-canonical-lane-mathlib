import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure FractureMechanicsPackage where
  crackLength : ℝ
  stressIntensityFactor : ℝ
  fractureToughness : ℝ
  parisLawExponent : ℝ
  parisLawConstant : ℝ
  crackGrowthRate : ℝ
  thresholdStressIntensity : ℝ
  maximumStressIntensity : ℝ
  loadingCycles : ℕ
  stressRatio : ℝ
  overloadRatio : ℝ
  crackClosureLevel : ℝ
  oxideInducedCrackBridging : Bool
  oxidationEnhancedCrackGrowth : Bool
  stressCorrosionCrackingThreshold : ℝ
  creepCrackGrowthRate : ℝ

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  crackLengthNonnegative : F.crackLength ≥ 0
  stressIntensityFactorNonnegative : F.stressIntensityFactor ≥ 0
  fractureToughnessPositive : F.fractureToughness > 0
  parisLawExponentPositive : F.parisLawExponent > 0
  parisLawConstantPositive : F.parisLawConstant > 0
  crackGrowthRateNonnegative : F.crackGrowthRate ≥ 0
  thresholdStressIntensityNonnegative : F.thresholdStressIntensity ≥ 0
  maximumStressIntensityPositive : F.maximumStressIntensity > 0
  stressRatioBetween : -1 ≤ F.stressRatio ∧ F.stressRatio ≤ 1
  overloadRatioGe1 : F.overloadRatio ≥ 1
  crackClosureLevelBetween : 0 ≤ F.crackClosureLevel ∧ F.crackClosureLevel ≤ 1
  stressCorrosionCrackingThresholdNonnegative : F.stressCorrosionCrackingThreshold ≥ 0
  creepCrackGrowthRateNonnegative : F.creepCrackGrowthRate ≥ 0

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.crackLength ≥ 0 ∧
  F.stressIntensityFactor ≥ 0 ∧
  F.fractureToughness > 0 ∧
  F.parisLawExponent > 0 ∧
  F.parisLawConstant > 0 ∧
  F.crackGrowthRate ≥ 0 ∧
  F.thresholdStressIntensity ≥ 0 ∧
  F.maximumStressIntensity > 0 ∧
  (-1 ≤ F.stressRatio ∧ F.stressRatio ≤ 1) ∧
  F.overloadRatio ≥ 1 ∧
  (0 ≤ F.crackClosureLevel ∧ F.crackClosureLevel ≤ 1) ∧
  F.stressCorrosionCrackingThreshold ≥ 0 ∧
  F.creepCrackGrowthRate ≥ 0

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage) (E : FractureMechanicsEvidence F) :
    FractureMechanicsClosed F := by
  rcases E.stressRatioBetween with ⟨h1, h2⟩
  rcases E.crackClosureLevelBetween with ⟨h3, h4⟩
  refine And.intro E.crackLengthNonnegative
    (And.intro E.stressIntensityFactorNonnegative
    (And.intro E.fractureToughnessPositive
    (And.intro E.parisLawExponentPositive
    (And.intro E.parisLawConstantPositive
    (And.intro E.crackGrowthRateNonnegative
    (And.intro E.thresholdStressIntensityNonnegative
    (And.intro E.maximumStressIntensityPositive
    (And.intro (And.intro h1 h2)
    (And.intro E.overloadRatioGe1
    (And.intro (And.intro h3 h4)
    (And.intro E.stressCorrosionCrackingThresholdNonnegative E.creepCrackGrowthRateNonnegative)))))))))))

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse