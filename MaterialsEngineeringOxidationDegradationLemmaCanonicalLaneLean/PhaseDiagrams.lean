import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  phases : Type u
  phaseBoundaries : Type v
  eutecticPoints : Type w
  solidSolubility : Prop
  phaseTransitionTemperatures : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  solidSolubilityClosed : P.solidSolubility
  phaseTransitionTemperaturesClosed : P.phaseTransitionTemperatures

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.solidSolubility ∧ P.phaseTransitionTemperatures

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.solidSolubilityClosed E.phaseTransitionTemperaturesClosed

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse