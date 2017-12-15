package oscal

import (
	"path"

	"github.com/usnistgov/OSCAL/oscalkit/opencontrol"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/implementation"
)

func convertOC(oc opencontrol.OpenControl, ocComponents []opencontrol.Component) (OSCAL, error) {
	var ocOSCAL implementation.Implementation
	ocOSCAL.Name = oc.Name
	ocOSCAL.Description = oc.Metadata.Description
	ocOSCAL.Maintainers = oc.Metadata.Maintainers

	for _, cert := range oc.Certifications {
		ocOSCAL.Profiles = append(ocOSCAL.Profiles, implementation.Profile{
			Href: cert,
		})
	}

	if oc.Dependencies != nil {
		for _, cert := range oc.Dependencies.Certifications {
			ocOSCAL.Profiles = append(ocOSCAL.Profiles, implementation.Profile{
				Href: cert.URL,
				Name: parseOCCert(cert.URL),
			})
		}
	}

	for _, ocComponent := range ocComponents {
		var oscalComponent implementation.Component
		oscalComponent.Name = ocComponent.Name
		if ocComponent.ResponsibleRole != "" {
			oscalComponent.ResponsibleRoles = append(oscalComponent.ResponsibleRoles, ocComponent.ResponsibleRole)
		}

		for _, ocSatisfy := range ocComponent.Satisfies {
			var oscalSatisfy implementation.Satisfy
			oscalSatisfy.ControlIDs = append(oscalSatisfy.ControlIDs, ocSatisfy.ControlKey)

			for _, ocNarrative := range ocSatisfy.Narrative {
				oscalSatisfy.Narratives = append(oscalSatisfy.Narratives, implementation.Narrative{
					Value: ocNarrative.Text,
				})
			}

			oscalSatisfy.Origins = ocSatisfy.ControlOrigins
			if ocSatisfy.ControlOrigin != "" {
				oscalSatisfy.Origins = append(oscalSatisfy.Origins, ocSatisfy.ControlOrigin)
			}

			for _, ocParameter := range ocSatisfy.Parameters {
				ocOSCAL.Params = append(ocOSCAL.Params, implementation.Param{
					ParamID: ocParameter.Key,
					Value:   ocParameter.Text,
				})
			}

			oscalSatisfy.Statuses = ocSatisfy.ImplementationStatuses
			if ocSatisfy.ImplementationStatus != "" {
				oscalSatisfy.Statuses = append(oscalSatisfy.Statuses, ocSatisfy.ImplementationStatus)
			}

			oscalComponent.Satisfies = append(oscalComponent.Satisfies, oscalSatisfy)
		}

		for _, ocReference := range ocComponent.References {
			oscalComponent.References = append(oscalComponent.References, implementation.Reference{
				Name: ocReference.Name,
				URL:  ocReference.Path,
			})
		}

		ocOSCAL.Components = append(ocOSCAL.Components, oscalComponent)
	}

	return &ocOSCAL, nil
}

// Temporary mechanism for converting https://github.com/opencontrol/FedRAMP-Certifications
// to path to OSCAL JSON
func parseOCCert(url string) string {
	if path.Base(url) == "FedRAMP-Certifications" {
		return "FedRAMP-MODERATE-crude.json"
	}

	return ""
}
