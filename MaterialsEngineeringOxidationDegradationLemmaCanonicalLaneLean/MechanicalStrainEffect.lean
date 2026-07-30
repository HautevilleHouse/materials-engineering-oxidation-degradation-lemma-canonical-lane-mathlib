import MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean.ThermodynamicDrivingForce

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure MechanicalStrainPackage {P : OxidationProcess} {D : DiffusionControlledOxidationPackage P} {T : ThermodynamicPackage D} where
  strainTensor : Type
  elasticModulus : ℝ
  oxideStress : ℝ
  strainEnhancedDiffusion : Prop
  stressInducedCracking : Prop

structure MechanicalStrainEvidence {P : OxidationProcess} {D : DiffusionControlledOxidationPackage P} {T : ThermodynamicPackage D} (M : MechanicalStrainPackage D T) where
  strainEnhancedDiffusionClosed : M.strainEnhancedDiffusion
  stressInducedCrackingClosed : M.stressInducedCracking

def MechanicalStrainClosed {P : OxidationProcess} {D : DiffusionControlledOxidationPackage P} {T : ThermodynamicPackage D} (M : MechanicalStrainPackage D T) : Prop :=
  M.strainEnhancedDiffusion ∧ M.stressInducedCracking

theorem mechanical_strain_closed_from_evidence {P : OxidationProcess} {D : DiffusionControlledOxidationPackage P} {T : ThermodynamicPackage D} (M : MechanicalStrainPackage D T) (E : MechanicalStrainEvidence M) : MechanicalStrainClosed M :=
  And.intro E.strainEnhancedDiffusionClosed E.stressInducedCrackingClosed

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse