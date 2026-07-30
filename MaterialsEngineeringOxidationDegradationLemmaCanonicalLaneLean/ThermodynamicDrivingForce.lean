import MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean.DiffusionControlledOxidation

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure ThermodynamicPackage {P : OxidationProcess} {D : DiffusionControlledOxidationPackage P} where
  gibbsFreeEnergyChange : ℝ
  equilibriumConstant : ℝ
  reactionAffinity : ℝ
  spontaneityCondition : Prop
  ellinghamDiagramConsistent : Prop

structure ThermodynamicEvidence {P : OxidationProcess} {D : DiffusionControlledOxidationPackage P} (T : ThermodynamicPackage D) where
  spontaneityConditionClosed : T.spontaneityCondition
  ellinghamDiagramConsistentClosed : T.ellinghamDiagramConsistent

def ThermodynamicClosed {P : OxidationProcess} {D : DiffusionControlledOxidationPackage P} (T : ThermodynamicPackage D) : Prop :=
  T.spontaneityCondition ∧ T.ellinghamDiagramConsistent

theorem thermodynamic_closed_from_evidence {P : OxidationProcess} {D : DiffusionControlledOxidationPackage P} (T : ThermodynamicPackage D) (E : ThermodynamicEvidence T) : ThermodynamicClosed T :=
  And.intro E.spontaneityConditionClosed E.ellinghamDiagramConsistentClosed

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse