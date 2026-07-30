import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean

structure ElasticityPackage where
  stressTensor : Type u
  strainTensor : Type v
  elasticModuli : Type w
  constitutiveLaw : Prop
  equilibriumEquations : Prop
  compatibilityConditions : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  constitutiveLawClosed : E.constitutiveLaw
  equilibriumEquationsClosed : E.equilibriumEquations
  compatibilityConditionsClosed : E.compatibilityConditions

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.constitutiveLaw ∧ E.equilibriumEquations ∧ E.compatibilityConditions

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.constitutiveLawClosed (And.intro Ev.equilibriumEquationsClosed Ev.compatibilityConditionsClosed)

end MaterialsEngineeringOxidationDegradationLemmaCanonicalLaneLean
end HautevilleHouse