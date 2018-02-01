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
	yaml "gopkg.in/yaml.v2"
)

// OSCAL ...
type OSCAL interface {
	// Component returns the OSCAL component type of the parsed OSCAL text.
	Component() string

	// RawXML returns OSCAL-formatted XML
	RawXML(prettify bool) ([]byte, error)

	// RawJSON returns OSCAL-formatted JSON
	RawJSON(prettify bool) ([]byte, error)

	// RawYAML returns OSCAL-formatted YAML
	RawYAML() ([]byte, error)
}

// Options ...
type Options struct {
	Reader io.Reader
}

// OpenControlOptions ...
type OpenControlOptions struct {
	OpenControlYAMLFilepath string
	OpenControlsDir         string
}

// NewFromOC initializes an OSCAL type from raw OpenControl data
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

	ocComponentFileList := []string{}
	filepath.Walk(filepath.Join(options.OpenControlsDir, "components/"), func(path string, f os.FileInfo, err error) error {
		if !f.IsDir() && (filepath.Ext(path) == ".yaml" || filepath.Ext(path) == ".yml") {
			absPath, err := filepath.Abs(path)
			if err != nil {
				return err
			}
			ocComponentFileList = append(ocComponentFileList, absPath)
		}

		return nil
	})

	ocComponents := []opencontrol.Component{}
	for _, ocComponentFilepath := range ocComponentFileList {
		ocComponentFile, err := os.Open(ocComponentFilepath)
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

// New ...
func New(options Options) (OSCAL, error) {
	var err error

	rawOSCAL, err := ioutil.ReadAll(options.Reader)
	if err != nil {
		return nil, err
	}

	var coreOSCAL Core
	var profileOSCAL Profile
	var implementationOSCAL Implementation

	// Need a better way to identify OSCAL type from reader contents.
	// Unable to properly capture error for malformed raw OSCAL
	if err = xml.Unmarshal(rawOSCAL, &coreOSCAL); err == nil && coreOSCAL != (Core{}) {
		return &coreOSCAL, nil
	} else if err = json.Unmarshal(rawOSCAL, &coreOSCAL); err == nil && coreOSCAL != (Core{}) {
		return &coreOSCAL, nil
	} else if err = xml.Unmarshal(rawOSCAL, &profileOSCAL); err == nil && len(profileOSCAL.Invocations) > 0 {
		return &profileOSCAL, nil
	} else if err = json.Unmarshal(rawOSCAL, &profileOSCAL); err == nil && len(profileOSCAL.Invocations) > 0 {
		return &profileOSCAL, nil
	} else if err = json.Unmarshal(rawOSCAL, &implementationOSCAL); err == nil && len(implementationOSCAL.Components.Items) > 0 {
		return &implementationOSCAL, nil
	}

	return nil, errors.New("Improperly formatted OSCAL")
}
