import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  components : List String
  phases : List String
  temperatureRange : ℝ × ℝ
  compositionRange : ℝ × ℝ
  solidusTemperature : ℝ → ℝ
  liquidusTemperature : ℝ → ℝ
  eutecticPoints : List (ℝ × ℝ × String)
  peritecticPoints : List (ℝ × ℝ × String)
  solubilityLimit : ℝ → ℝ
  phaseFractions : ℝ → ℝ → List ℝ
  gibbsFreeEnergy : ℝ → ℝ → ℝ
  chemicalPotential : ℝ → ℝ → ℝ
  activityCoefficient : ℝ → ℝ → ℝ
  diffusionMobility : ℝ → ℝ
  tieLineEndpoints : ℝ → ℝ → (ℝ × ℝ)

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  temperatureRangeNonempty : Prod.fst P.temperatureRange < Prod.snd P.temperatureRange
  compositionRangeNonempty : Prod.fst P.compositionRange < Prod.snd P.compositionRange
  solidusBelowLiquidus : ∀ x, P.solidusTemperature x ≤ P.liquidusTemperature x
  eutecticPointsDefined : ∀ (t, c, _) ∈ P.eutecticPoints, t ∈ Ioo (Prod.fst P.temperatureRange) (Prod.snd P.temperatureRange) ∧ c ∈ Ioo (Prod.fst P.compositionRange) (Prod.snd P.compositionRange)
  peritecticPointsDefined : ∀ (t, c, _) ∈ P.peritecticPoints, t ∈ Ioo (Prod.fst P.temperatureRange) (Prod.snd P.temperatureRange) ∧ c ∈ Ioo (Prod.fst P.compositionRange) (Prod.snd P.compositionRange)
  solubilityLimitNonnegative : ∀ x, P.solubilityLimit x ≥ 0
  phaseFractionsNonnegative : ∀ T x, ∀ f ∈ P.phaseFractions T x, f ≥ 0
  phaseFractionsSumToOne : ∀ T x, ∑ f in P.phaseFractions T x, f = 1
  chemicalPotentialDefined : ∀ T x, P.chemicalPotential T x ≠ 0
  activityCoefficientPositive : ∀ T x, P.activityCoefficient T x > 0
  diffusionMobilityPositive : ∀ x, P.diffusionMobility x > 0

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  Prod.fst P.temperatureRange < Prod.snd P.temperatureRange ∧
  Prod.fst P.compositionRange < Prod.snd P.compositionRange ∧
  (∀ x, P.solidusTemperature x ≤ P.liquidusTemperature x) ∧
  (∀ (t, c, _) ∈ P.eutecticPoints, t ∈ Ioo (Prod.fst P.temperatureRange) (Prod.snd P.temperatureRange) ∧ c ∈ Ioo (Prod.fst P.compositionRange) (Prod.snd P.compositionRange)) ∧
  (∀ (t, c, _) ∈ P.peritecticPoints, t ∈ Ioo (Prod.fst P.temperatureRange) (Prod.snd P.temperatureRange) ∧ c ∈ Ioo (Prod.fst P.compositionRange) (Prod.snd P.compositionRange)) ∧
  (∀ x, P.solubilityLimit x ≥ 0) ∧
  (∀ T x, ∀ f ∈ P.phaseFractions T x, f ≥ 0) ∧
  (∀ T x, ∑ f in P.phaseFractions T x, f = 1) ∧
  (∀ T x, P.chemicalPotential T x ≠ 0) ∧
  (∀ T x, P.activityCoefficient T x > 0) ∧
  (∀ x, P.diffusionMobility x > 0)

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  refine And.intro E.temperatureRangeNonempty
    (And.intro E.compositionRangeNonempty
    (And.intro E.solidusBelowLiquidus
    (And.intro E.eutecticPointsDefined
    (And.intro E.peritecticPointsDefined
    (And.intro E.solubilityLimitNonnegative
    (And.intro E.phaseFractionsNonnegative
    (And.intro E.phaseFractionsSumToOne
    (And.intro E.chemicalPotentialDefined
    (And.intro E.activityCoefficientPositive E.diffusionMobilityPositive)))))))))

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse