import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure CrystallographyPackage where
  bravaisLatticeType : String
  unitCellVolume : ℝ
  latticeParameters : ℝ × ℝ × ℝ
  spaceGroup : String
  millerIndices : ℕ × ℕ × ℕ
  interplanarSpacing : ℝ
  atomicPositions : List (ℝ × ℝ × ℝ)
  occupancyFactors : List ℝ
  structureFactorAmplitude : ℝ
  grainBoundaryMisorientation : ℝ
  grainSize : ℝ
  textureCoefficient : ℝ
  dislocationDensity : ℝ
  stackingFaultEnergy : ℝ
  twinningProbability : ℝ
  crystalAnisotropyFactor : ℝ

structure CrystallographyEvidence (C : CrystallographyPackage) where
  unitCellVolumePositive : C.unitCellVolume > 0
  latticeParametersPositive : (Prod.fst C.latticeParameters > 0) ∧ (Prod.fst (Prod.snd C.latticeParameters) > 0) ∧ (Prod.snd (Prod.snd C.latticeParameters) > 0)
  interplanarSpacingPositive : C.interplanarSpacing > 0
  occupancyFactorsPositive : ∀ f ∈ C.occupancyFactors, f > 0
  grainSizePositive : C.grainSize > 0
  textureCoefficientNonnegative : C.textureCoefficient ≥ 0
  dislocationDensityPositive : C.dislocationDensity > 0
  stackingFaultEnergyPositive : C.stackingFaultEnergy > 0
  crystalAnisotropyFactorPositive : C.crystalAnisotropyFactor > 0

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.unitCellVolume > 0 ∧
  (Prod.fst C.latticeParameters > 0 ∧ Prod.fst (Prod.snd C.latticeParameters) > 0 ∧ Prod.snd (Prod.snd C.latticeParameters) > 0) ∧
  C.interplanarSpacing > 0 ∧
  (∀ f ∈ C.occupancyFactors, f > 0) ∧
  C.grainSize > 0 ∧
  C.textureCoefficient ≥ 0 ∧
  C.dislocationDensity > 0 ∧
  C.stackingFaultEnergy > 0 ∧
  C.crystalAnisotropyFactor > 0

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) :
    CrystallographyClosed C := by
  rcases E.latticeParametersPositive with ⟨h1, h2, h3⟩
  refine And.intro E.unitCellVolumePositive (And.intro (And.intro h1 (And.intro h2 h3))
    (And.intro E.interplanarSpacingPositive
    (And.intro E.occupancyFactorsPositive
    (And.intro E.grainSizePositive
    (And.intro E.textureCoefficientNonnegative
    (And.intro E.dislocationDensityPositive
    (And.intro E.stackingFaultEnergyPositive E.crystalAnisotropyFactorPositive)))))))

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse