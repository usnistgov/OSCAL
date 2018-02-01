package oscal

import (
	"fmt"
	"path"
	"strings"

	"github.com/usnistgov/OSCAL/oscalkit/opencontrol"
)

func convertOC(oc opencontrol.OpenControl, ocComponents []opencontrol.Component) (OSCAL, error) {
	ocOSCAL := Implementation{}
	ocOSCAL.Title = oc.Name

	ocOSCAL.Paragraphs = append(ocOSCAL.Paragraphs, P{
		OptionalClass: "description",
		Raw:           oc.Metadata.Description,
	})

	for _, maintainer := range oc.Metadata.Maintainers {
		ocOSCAL.Props = append(ocOSCAL.Props, Prop{
			RequiredClass: "maintainer",
			Value:         maintainer,
		})
	}

	implementationProfiles := &Profiles{}

	for _, cert := range oc.Certifications {
		implementationProfiles.Links = append(implementationProfiles.Links, Link{
			Rel:  "profile",
			Href: cert,
		})
	}

	if oc.Dependencies != nil {
		for _, cert := range oc.Dependencies.Certifications {
			implementationProfiles.Links = append(implementationProfiles.Links, Link{
				Rel:   "profile",
				Href:  "../../FedRAMP/FedRAMP-MODERATE-crude",
				Value: parseOCCert(cert.URL),
			})
		}
	}

	ocOSCAL.Profiles = implementationProfiles
	ocOSCAL.Params = Params{}
	ocOSCAL.Components = Components{}

	for _, ocComponent := range ocComponents {
		item := Item{}

		item.Title = ocComponent.Name
		item.Prose = &Prose{}

		// Outputs "null" JSON value since this is self-closing XML tag
		item.Prose.P = append(item.Prose.P, P{
			OptionalClass: "description",
		})

		if ocComponent.ResponsibleRole != "" {
			item.Prose.P = append(item.Prose.P, P{
				OptionalClass: "responsibleRoles",
				Raw:           ocComponent.ResponsibleRole,
			})
		}

		for _, ocSatisfy := range ocComponent.Satisfies {
			var part Part

			part.OptionalClass = "satisfies"

			key := strings.ToLower(ocSatisfy.ControlKey)
			r := strings.NewReplacer(
				" ", "",
				"-", ".",
				"(", ".",
				")", "",
			)
			key = fmt.Sprintf("#%s", r.Replace(key))
			part.Links = append(part.Links, Link{
				Rel:  "satisfies",
				Href: key,
				// TODO: Value from linked "catalog"
			})

			part.Prose = &Prose{}
			for _, ocNarrative := range ocSatisfy.Narrative {
				raw := ocNarrative.Text
				if strings.HasSuffix(raw, "\n") {
					raw = strings.TrimSuffix(raw, "\n")
				}
				part.Prose.P = append(part.Prose.P, P{
					OptionalClass: "narrative",
					Raw:           raw,
				})
			}

			for _, ocOrigin := range ocSatisfy.ControlOrigins {
				part.Props = append(part.Props, Prop{
					RequiredClass: "origin",
					Value:         ocOrigin,
				})
			}

			if ocSatisfy.ControlOrigin != "" {
				part.Props = append(part.Props, Prop{
					RequiredClass: "origin",
					Value:         ocSatisfy.ControlOrigin,
				})
			}

			for _, ocParameter := range ocSatisfy.Parameters {
				ocOSCAL.Params.SetParams = append(ocOSCAL.Params.SetParams, ImplementationParam{
					ID: ocParameter.Key,
					Desc: Desc{
						Raw: ocParameter.Text,
					},
				})
			}

			for _, ocStatus := range ocSatisfy.ImplementationStatuses {
				part.Props = append(part.Props, Prop{
					RequiredClass: "status",
					Value:         ocStatus,
				})
			}

			if ocSatisfy.ImplementationStatus != "" {
				part.Props = append(part.Props, Prop{
					RequiredClass: "status",
					Value:         ocSatisfy.ImplementationStatus,
				})
			}

			item.Parts = append(item.Parts, part)
		}

		for _, ocReference := range ocComponent.References {
			part := Part{
				OptionalClass: "reference",
				Title:         ocReference.Name,
			}

			part.Prose = &Prose{}
			part.Prose.P = append(part.Prose.P, P{
				OptionalClass: "description",
			})

			part.Links = append(part.Links, Link{
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
		return "FedRAMP MODERATE Baseline PROFILE"
	}

	return ""
}
