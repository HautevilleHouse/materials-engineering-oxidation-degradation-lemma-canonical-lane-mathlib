import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure MaterialSurface where
  carrier : Type
  topology : TopologicalSpace carrier

structure OxideLayer where
  thickness : ℝ
  defectDensity : ℝ
  passivationEnergy : ℝ

structure OxidationProcess where
  surface : MaterialSurface
  oxide : OxideLayer
  temperature : ℝ
  oxygenPartialPressure : ℝ
  time : ℕ
  degradationRate : ℝ

structure AdmittedOxidationObject where
  process : OxidationProcess
  layerGrowthModel : Prop
  diffusionLimited : Prop
  parabolicConstantComputed : Prop
  conclusion : Prop

def OxidationWitnessClosed (O : AdmittedOxidationObject) : Prop :=
  O.conclusion

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse