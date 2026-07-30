import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure CrystallographyPackage where
  crystalStructure : Type u
  latticeParameters : Type v
  symmetryGroup : Type w
  bravaisLattice : Prop
  millerIndices : Prop
  xrayDiffractionPattern : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  bravaisLatticeClosed : C.bravaisLattice
  millerIndicesClosed : C.millerIndices
  xrayDiffractionPatternClosed : C.xrayDiffractionPattern

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.bravaisLattice ∧ C.millerIndices ∧ C.xrayDiffractionPattern

theorem crystallography_closed_from_evidence
    (C : CrystallographyPackage) (E : CrystallographyEvidence C) :
    CrystallographyClosed C := by
  exact And.intro E.bravaisLatticeClosed
    (And.intro E.millerIndicesClosed E.xrayDiffractionPatternClosed)

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse
