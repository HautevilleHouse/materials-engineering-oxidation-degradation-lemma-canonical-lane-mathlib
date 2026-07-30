import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  OxidationWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.diffusionEquationSolution

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse