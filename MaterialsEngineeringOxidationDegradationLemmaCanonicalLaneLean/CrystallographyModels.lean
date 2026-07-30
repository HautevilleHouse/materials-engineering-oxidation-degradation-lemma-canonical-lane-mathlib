import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure CrystallographyPackage where
  unitCell : Type u
  latticeVectors : Type v
  symmetryGroup : Type w
  coordinationNumber : Nat
  packingFraction : ℝ
  structureFactor : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  unitCellClosed : UnitCellDescription C.unitCell
  latticeVectorsClosed : LatticeVectorsIndependent C.latticeVectors
  symmetryGroupClosed : SymmetryGroupClosed C.symmetryGroup
  coordinationNumberClosed : CoordinationNumberValid C.coordinationNumber
  packingFractionClosed : PackingFractionValid C.packingFraction
  structureFactorClosed : C.structureFactor

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  UnitCellDescription C.unitCell ∧ LatticeVectorsIndependent C.latticeVectors ∧
  SymmetryGroupClosed C.symmetryGroup ∧ CoordinationNumberValid C.coordinationNumber ∧
  PackingFractionValid C.packingFraction ∧ C.structureFactor

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.unitCellClosed (And.intro E.latticeVectorsClosed (And.intro E.symmetryGroupClosed (And.intro E.coordinationNumberClosed (And.intro E.packingFractionClosed E.structureFactorClosed))))

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse