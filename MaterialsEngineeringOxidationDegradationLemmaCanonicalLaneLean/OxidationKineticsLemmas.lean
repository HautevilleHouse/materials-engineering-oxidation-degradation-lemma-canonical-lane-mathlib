import canonicalLaneMathlib.AdmissibleClass
import MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean.OxidationDegradationPackage

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure OxidationKineticsPackage (P : OxidationDegradationPackage) where
  parabolicRateLaw : P.oxideThickness = λ t => Real.sqrt (2 * P.parabolicConstant * t)
  arrheniusRelation : P.oxidationRate = P.diffusionCoefficient * Real.exp (-P.activationEnergy / (8.314 * P.temperature))
  wagnerTheorySatisfied : P.oxideThickness (0) = P.initialOxideThickness
  interfaceReactionControl : P.interfaceReactionRate ≤ P.diffusionCoefficient

structure OxidationKineticsEvidence (P : OxidationDegradationPackage) (K : OxidationKineticsPackage P) where
  parabolicRateLawValid : K.parabolicRateLaw
  arrheniusRelationValid : K.arrheniusRelation
  wagnerTheorySatisfiedValid : K.wagnerTheorySatisfied
  interfaceReactionControlValid : K.interfaceReactionControl

def OxidationKineticsClosed (P : OxidationDegradationPackage) (K : OxidationKineticsPackage P) : Prop :=
  K.parabolicRateLaw ∧
  K.arrheniusRelation ∧
  K.wagnerTheorySatisfied ∧
  K.interfaceReactionControl

theorem oxidation_kinetics_closed_from_evidence (P : OxidationDegradationPackage) (K : OxidationKineticsPackage P) (E : OxidationKineticsEvidence P K) :
    OxidationKineticsClosed P K := by
  exact And.intro E.parabolicRateLawValid
    (And.intro E.arrheniusRelationValid
    (And.intro E.wagnerTheorySatisfiedValid E.interfaceReactionControlValid))

theorem oxidation_thickness_growth_positive (P : OxidationDegradationPackage) (K : OxidationKineticsPackage P) (h : OxidationDegradationClosed P) (hK : OxidationKineticsClosed P K) :
    ∀ t, t > 0 → P.oxideThickness t > P.initialOxideThickness := by
  intro t ht
  rcases hK with ⟨hPar, _, hWag, _⟩
  have : P.oxideThickness t = Real.sqrt (2 * P.parabolicConstant * t) := by
    exact hPar
  have h1 : 2 * P.parabolicConstant * t > 0 := by nlinarith [hPar, ht]
  have h2 : Real.sqrt (2 * P.parabolicConstant * t) > 0 := Real.sqrt_pos.mpr h1
  have h0 : P.initialOxideThickness ≥ 0 := h.4
  calc
    P.oxideThickness t = Real.sqrt (2 * P.parabolicConstant * t) := hPar
    _ > 0 := h2
    _ ≥ P.initialOxideThickness := h0
    _ = P.oxideThickness 0 := by symm; exact hWag

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse