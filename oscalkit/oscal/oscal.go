// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package oscal

import (
	"encoding/json"
	"encoding/xml"
	"errors"
	"io"
	"io/ioutil"
	"os"
	"path/filepath"

	"github.com/usnistgov/OSCAL/oscalkit/opencontrol"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/implementation"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/profile"
	yaml "gopkg.in/yaml.v2"
)

// OSCAL ...
type OSCAL interface {
	// Component returns the OSCAL component type of the parsed OSCAL text.
	Component() string

	// Raw returns the raw OSCAL text in a chosen format.
	// Setting prettify to true returns prettified text in the given format.
	Raw(format string, prettify bool) ([]byte, error)

	// Type returns the parsed OSCAL object. The caller will
	// need to use type assertion to get the proper OSCAL type.
	// The Component() function can assist with this.
	Type() interface{}
}

// Options ...
type Options struct {
	Reader io.Reader
}

// OpenControlOptions ...
type OpenControlOptions struct {
	OpenControlYAMLFilepath string
}

// NewFromOC ...
func NewFromOC(options OpenControlOptions) (OSCAL, error) {
	ocFile, err := os.Open(options.OpenControlYAMLFilepath)
	if err != nil {
		return nil, err
	}
	defer ocFile.Close()

	rawOC, err := ioutil.ReadAll(ocFile)
	if err != nil {
		return nil, err
	}

	var oc opencontrol.OpenControl
	if err := yaml.Unmarshal(rawOC, &oc); err != nil {
		return nil, err
	}

	absPath, err := filepath.Abs(options.OpenControlYAMLFilepath)
	if err != nil {
		return nil, err
	}

	ocComponents := []opencontrol.Component{}
	for _, ocComponentFilepath := range oc.Components {
		ocComponentAbsFilepath := filepath.Join(filepath.Dir(absPath), ocComponentFilepath, "component.yaml")

		ocComponentFile, err := os.Open(ocComponentAbsFilepath)
		if err != nil {
			return nil, err
		}
		defer ocComponentFile.Close()

		rawOCComponentFile, err := ioutil.ReadAll(ocComponentFile)

		var ocComponent opencontrol.Component
		if err := yaml.Unmarshal(rawOCComponentFile, &ocComponent); err != nil {
			return nil, err
		}

		ocComponents = append(ocComponents, ocComponent)
	}

	return convertOC(oc, ocComponents)
}

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

	for _, ocComponent := range ocComponents {
		var oscalComponent implementation.Component
		oscalComponent.Name = ocComponent.Name
		if ocComponent.ResponsibleRole != "" {
			oscalComponent.ResponsibleRoles = append(oscalComponent.ResponsibleRoles, ocComponent.ResponsibleRole)
		}

		for _, ocSatisfy := range ocComponent.Satisfies {
			var oscalSatisfy implementation.Satisfy
			oscalSatisfy.ControlID = ocSatisfy.ControlKey

			for _, ocNarrative := range ocSatisfy.Narrative {
				oscalSatisfy.Narratives = append(oscalSatisfy.Narratives, implementation.Narrative{
					Key:   ocNarrative.Key,
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

// New ...
func New(options Options) (OSCAL, error) {
	var err error

	rawOSCAL, err := ioutil.ReadAll(options.Reader)
	if err != nil {
		return nil, err
	}

	var coreOSCAL core.Core
	var profileOSCAL profile.Profile

	// Need a better way to identify OSCAL type from reader contents.
	// Unable to properly capture error
	if err = xml.Unmarshal(rawOSCAL, &coreOSCAL); err == nil && coreOSCAL != (core.Core{}) {
		return &coreOSCAL, nil
	} else if err = json.Unmarshal(rawOSCAL, &coreOSCAL); err == nil && coreOSCAL != (core.Core{}) {
		return &coreOSCAL, nil
	} else if err = xml.Unmarshal(rawOSCAL, &profileOSCAL); err == nil && len(profileOSCAL.Invocations) > 0 {
		return &profileOSCAL, nil
	} else if err = json.Unmarshal(rawOSCAL, &profileOSCAL); err == nil && len(profileOSCAL.Invocations) > 0 {
		return &profileOSCAL, nil
	}

	return nil, errors.New("Improperly formatted OSCAL")
}
