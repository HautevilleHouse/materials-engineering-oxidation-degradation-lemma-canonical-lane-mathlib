import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure ElasticityPackage where
  youngModulus : ℝ
  poissonRatio : ℝ
  shearModulus : ℝ
  bulkModulus : ℝ
  yieldStrength : ℝ
  ultimateTensileStrength : ℝ
  fractureToughness : ℝ
  hardness : ℝ
  fatigueLimit : ℝ
  creepStrainRate : ℝ
  stressConcentrationFactor : ℝ
  residualStressDistribution : ℝ → ℝ → ℝ
  thermalExpansionCoefficient : ℝ
  elasticAnisotropyFactor : ℝ
  strainHardeningExponent : ℝ
  cyclicStressStrainCurve : ℝ → ℝ
  oxidationInducedStrain : ℝ
  oxideElasticModulus : ℝ
  interfaceAdhesionEnergy : ℝ

structure ElasticityEvidence (E : ElasticityPackage) where
  youngModulusPositive : E.youngModulus > 0
  poissonRatioBetween : -1 < E.poissonRatio ∧ E.poissonRatio < 0.5
  shearModulusPositive : E.shearModulus > 0
  bulkModulusPositive : E.bulkModulus > 0
  yieldStrengthPositive : E.yieldStrength > 0
  ultimateTensileStrengthPositive : E.ultimateTensileStrength > 0
  fractureToughnessPositive : E.fractureToughness > 0
  hardnessPositive : E.hardness > 0
  fatigueLimitNonnegative : E.fatigueLimit ≥ 0
  creepStrainRateNonnegative : E.creepStrainRate ≥ 0
  stressConcentrationFactorGe1 : E.stressConcentrationFactor ≥ 1
  thermalExpansionCoefficientPositive : E.thermalExpansionCoefficient > 0
  elasticAnisotropyFactorPositive : E.elasticAnisotropyFactor > 0
  strainHardeningExponentBetween : 0 ≤ E.strainHardeningExponent ∧ E.strainHardeningExponent ≤ 1
  oxidationInducedStrainNonnegative : E.oxidationInducedStrain ≥ 0
  oxideElasticModulusPositive : E.oxideElasticModulus > 0
  interfaceAdhesionEnergyPositive : E.interfaceAdhesionEnergy > 0

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.youngModulus > 0 ∧
  (-1 < E.poissonRatio ∧ E.poissonRatio < 0.5) ∧
  E.shearModulus > 0 ∧
  E.bulkModulus > 0 ∧
  E.yieldStrength > 0 ∧
  E.ultimateTensileStrength > 0 ∧
  E.fractureToughness > 0 ∧
  E.hardness > 0 ∧
  E.fatigueLimit ≥ 0 ∧
  E.creepStrainRate ≥ 0 ∧
  E.stressConcentrationFactor ≥ 1 ∧
  E.thermalExpansionCoefficient > 0 ∧
  E.elasticAnisotropyFactor > 0 ∧
  (0 ≤ E.strainHardeningExponent ∧ E.strainHardeningExponent ≤ 1) ∧
  E.oxidationInducedStrain ≥ 0 ∧
  E.oxideElasticModulus > 0 ∧
  E.interfaceAdhesionEnergy > 0

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) :
    ElasticityClosed E := by
  rcases Ev.poissonRatioBetween with ⟨h1, h2⟩
  rcases Ev.strainHardeningExponentBetween with ⟨h3, h4⟩
  refine And.intro Ev.youngModulusPositive
    (And.intro (And.intro h1 h2)
    (And.intro Ev.shearModulusPositive
    (And.intro Ev.bulkModulusPositive
    (And.intro Ev.yieldStrengthPositive
    (And.intro Ev.ultimateTensileStrengthPositive
    (And.intro Ev.fractureToughnessPositive
    (And.intro Ev.hardnessPositive
    (And.intro Ev.fatigueLimitNonnegative
    (And.intro Ev.creepStrainRateNonnegative
    (And.intro Ev.stressConcentrationFactorGe1
    (And.intro Ev.thermalExpansionCoefficientPositive
    (And.intro Ev.elasticAnisotropyFactorPositive
    (And.intro (And.intro h3 h4)
    (And.intro Ev.oxidationInducedStrainNonnegative
    (And.intro Ev.oxideElasticModulusPositive Ev.interfaceAdhesionEnergyPositive)))))))))))))))

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse