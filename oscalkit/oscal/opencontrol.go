package oscal

import (
	"path"

	"github.com/usnistgov/OSCAL/oscalkit/opencontrol"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/implementation"
)

func convertOC(oc opencontrol.OpenControl, ocComponents []opencontrol.Component) (OSCAL, error) {
	ocOSCAL := implementation.Implementation{}
	ocOSCAL.Title = oc.Name

	ocOSCAL.Paragraphs = append(ocOSCAL.Paragraphs, core.P{
		OptionalClass: "description",
		Raw:           oc.Metadata.Description,
	})

	for _, maintainer := range oc.Metadata.Maintainers {
		ocOSCAL.Props = append(ocOSCAL.Props, core.Prop{
			RequiredClass: "maintainer",
			Value:         maintainer,
		})
	}

	implementationProfiles := &implementation.Profiles{}

	for _, cert := range oc.Certifications {
		implementationProfiles.Links = append(implementationProfiles.Links, core.Link{
			Rel:  "framework",
			Href: cert,
		})
	}

	if oc.Dependencies != nil {
		for _, cert := range oc.Dependencies.Certifications {
			implementationProfiles.Links = append(implementationProfiles.Links, core.Link{
				Rel:   "framework",
				Href:  cert.URL,
				Value: parseOCCert(cert.URL),
			})
		}
	}

	ocOSCAL.Profiles = implementationProfiles
	ocOSCAL.Params = implementation.Params{}
	ocOSCAL.Components = implementation.Components{}

	for _, ocComponent := range ocComponents {
		item := core.Item{}

		item.Title = ocComponent.Name
		item.Prose = &core.Prose{}

		// Outputs "null" JSON value since this is self-closing XML tag
		item.Prose.P = append(item.Prose.P, core.P{
			OptionalClass: "description",
		})

		if ocComponent.ResponsibleRole != "" {
			item.Prose.P = append(item.Prose.P, core.P{
				OptionalClass: "responsibleRoles",
				Raw:           ocComponent.ResponsibleRole,
			})
		}

		for _, ocSatisfy := range ocComponent.Satisfies {
			var part core.Part

			part.OptionalClass = "satisfies"

			part.Links = append(part.Links, core.Link{
				Rel:  "satisfies",
				Href: ocSatisfy.ControlKey,
				// TODO: Value from linked "catalog"
			})

			part.Prose = &core.Prose{}
			for _, ocNarrative := range ocSatisfy.Narrative {
				part.Prose.P = append(part.Prose.P, core.P{
					OptionalClass: "narrative",
					Raw:           ocNarrative.Text,
				})
			}

			for _, ocOrigin := range ocSatisfy.ControlOrigins {
				part.Props = append(part.Props, core.Prop{
					RequiredClass: "origin",
					Value:         ocOrigin,
				})
			}

			if ocSatisfy.ControlOrigin != "" {
				part.Props = append(part.Props, core.Prop{
					RequiredClass: "origin",
					Value:         ocSatisfy.ControlOrigin,
				})
			}

			for _, ocParameter := range ocSatisfy.Parameters {
				ocOSCAL.Params.SetParams = append(ocOSCAL.Params.SetParams, implementation.ImplementationParam{
					ID: ocParameter.Key,
					Desc: core.Desc{
						Raw: ocParameter.Text,
					},
				})
			}

			for _, ocStatus := range ocSatisfy.ImplementationStatuses {
				part.Props = append(part.Props, core.Prop{
					RequiredClass: "status",
					Value:         ocStatus,
				})
			}

			if ocSatisfy.ImplementationStatus != "" {
				part.Props = append(part.Props, core.Prop{
					RequiredClass: "status",
					Value:         ocSatisfy.ImplementationStatus,
				})
			}

			item.Parts = append(item.Parts, part)
		}

		for _, ocReference := range ocComponent.References {
			part := core.Part{
				OptionalClass: "reference",
				Title:         ocReference.Name,
			}

			part.Prose = &core.Prose{}
			part.Prose.P = append(part.Prose.P, core.P{
				OptionalClass: "description",
			})

			part.Links = append(part.Links, core.Link{
				Value: ocReference.Path,
			})

			item.Parts = append(item.Parts, part)
		}

		ocOSCAL.Components.Items = append(ocOSCAL.Components.Items, item)
	}

	ocOSCAL.Profiles = implementationProfiles

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
