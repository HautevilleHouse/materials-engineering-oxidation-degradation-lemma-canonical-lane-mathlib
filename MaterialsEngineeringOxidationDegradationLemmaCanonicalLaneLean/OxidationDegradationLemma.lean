import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure OxidationDegradationLemmaPackage where
  oxidationLayerThickness : Prop
  degradationRate : Prop
  criticalOxideThickness : Prop
  lifetimePrediction : Prop

structure OxidationDegradationLemmaEvidence (L : OxidationDegradationLemmaPackage) where
  oxidationLayerThicknessClosed : L.oxidationLayerThickness
  degradationRateClosed : L.degradationRate
  criticalOxideThicknessClosed : L.criticalOxideThickness
  lifetimePredictionClosed : L.lifetimePrediction

def OxidationDegradationLemmaClosed (L : OxidationDegradationLemmaPackage) : Prop :=
  L.oxidationLayerThickness ∧ L.degradationRate ∧ L.criticalOxideThickness ∧ L.lifetimePrediction

theorem oxidation_degradation_lemma_closed_from_evidence (L : OxidationDegradationLemmaPackage) (E : OxidationDegradationLemmaEvidence L) : OxidationDegradationLemmaClosed L := by
  exact And.intro E.oxidationLayerThicknessClosed (And.intro E.degradationRateClosed (And.intro E.criticalOxideThicknessClosed E.lifetimePredictionClosed))

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse