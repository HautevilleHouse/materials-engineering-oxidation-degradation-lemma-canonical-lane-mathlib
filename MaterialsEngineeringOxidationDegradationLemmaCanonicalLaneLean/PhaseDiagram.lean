import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  temperatureAxis : Prop
  compositionAxis : Prop
  phaseBoundaries : Prop
  eutecticPoint : Prop
  eutectoidPoint : Prop
  phaseRegionsIdentified : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  temperatureAxisClosed : P.temperatureAxis
  compositionAxisClosed : P.compositionAxis
  phaseBoundariesClosed : P.phaseBoundaries
  eutecticPointClosed : P.eutecticPoint
  eutectoidPointClosed : P.eutectoidPoint
  phaseRegionsIdentifiedClosed : P.phaseRegionsIdentified

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.temperatureAxis ∧ P.compositionAxis ∧
  P.phaseBoundaries ∧ P.eutecticPoint ∧
  P.eutectoidPoint ∧ P.phaseRegionsIdentified

theorem phase_diagram_closed_from_evidence
    (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.temperatureAxisClosed
    (And.intro E.compositionAxisClosed
      (And.intro E.phaseBoundariesClosed
        (And.intro E.eutecticPointClosed
          (And.intro E.eutectoidPointClosed E.phaseRegionsIdentifiedClosed))))

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse
