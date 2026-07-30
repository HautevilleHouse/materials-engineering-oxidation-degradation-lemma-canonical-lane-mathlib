import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure OxidationKineticsPackage where
  oxidationRate : Prop
  activationEnergy : Prop
  diffusionCoefficient : Prop
  scaleLaw : Prop

structure OxidationKineticsEvidence (K : OxidationKineticsPackage) where
  oxidationRateClosed : K.oxidationRate
  activationEnergyClosed : K.activationEnergy
  diffusionCoefficientClosed : K.diffusionCoefficient
  scaleLawClosed : K.scaleLaw

def OxidationKineticsClosed (K : OxidationKineticsPackage) : Prop :=
  K.oxidationRate ∧ K.activationEnergy ∧ K.diffusionCoefficient ∧ K.scaleLaw

theorem oxidation_kinetics_closed_from_evidence (K : OxidationKineticsPackage) (E : OxidationKineticsEvidence K) : OxidationKineticsClosed K := by
  exact And.intro E.oxidationRateClosed (And.intro E.activationEnergyClosed (And.intro E.diffusionCoefficientClosed E.scaleLawClosed))

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse