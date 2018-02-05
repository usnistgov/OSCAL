// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package oscal

import (
	"bytes"
	"encoding/json"
	"encoding/xml"
	"errors"
	"io"
	"io/ioutil"
	"os"
	"path/filepath"

	"github.com/usnistgov/OSCAL/oscalkit/types/opencontrol"
	yaml "gopkg.in/yaml.v2"
)

// OSCAL ...
type OSCAL struct {
	XMLName        xml.Name        `json:"-" yaml:"-"`
	Catalog        *Catalog        `json:"catalog,omitempty" yaml:"catalog,omitempty"`
	Framework      *Framework      `json:"framework,omitempty" yaml:"framework,omitempty"`
	Worksheet      *Worksheet      `json:"worksheet,omitempty" yaml:"worksheet,omitempty"`
	Declarations   *Declarations   `json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Profile        *Profile        `json:"profile,omitempty" yaml:"profile,omitempty"`
	Implementation *Implementation `json:"implementation,omitempty" yaml:"implementation,omitempty"`
}

// MarshalXML ...
func (o *OSCAL) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	if o.Catalog != nil {
		o.XMLName = o.Catalog.XMLName
		if err := e.Encode(o.Catalog); err != nil {
			return err
		}
	} else if o.Declarations != nil {
		o.XMLName = o.Declarations.XMLName
		if err := e.Encode(o.Declarations); err != nil {
			return err
		}
	} else if o.Framework != nil {
		o.XMLName = o.Framework.XMLName
		if err := e.Encode(o.Framework); err != nil {
			return err
		}
	} else if o.Worksheet != nil {
		o.XMLName = o.Worksheet.XMLName
		if err := e.Encode(o.Worksheet); err != nil {
			return err
		}
	} else if o.Profile != nil {
		o.XMLName = o.Profile.XMLName
		if err := e.Encode(o.Profile); err != nil {
			return err
		}
	} else if o.Implementation != nil {
		o.XMLName = o.Implementation.XMLName
		if err := e.Encode(o.Implementation); err != nil {
			return err
		}
	}

	return nil
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
func NewFromOC(options OpenControlOptions) (*OSCAL, error) {
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
func New(r io.Reader) (*OSCAL, error) {
	var err error

	rawOSCAL, err := ioutil.ReadAll(r)
	if err != nil {
		return nil, err
	}

	d := xml.NewDecoder(bytes.NewReader(rawOSCAL))
	for {
		token, err := d.Token()
		if err != nil || token == nil {
			break
		}
		switch startElement := token.(type) {
		case xml.StartElement:
			switch startElement.Name.Local {
			case "catalog":
				var catalog Catalog
				if err := xml.Unmarshal(rawOSCAL, &catalog); err != nil {
					return nil, err
				}
				return &OSCAL{Catalog: &catalog}, nil

			case "framework":
				var framework Framework
				if err := xml.Unmarshal(rawOSCAL, &framework); err != nil {
					return nil, err
				}
				return &OSCAL{Framework: &framework}, nil

			case "worksheet":
				var worksheet Worksheet
				if err := xml.Unmarshal(rawOSCAL, &worksheet); err != nil {
					return nil, err
				}
				return &OSCAL{Worksheet: &worksheet}, nil

			case "declarations":
				var declarations Declarations
				if err := xml.Unmarshal(rawOSCAL, &declarations); err != nil {
					return nil, err
				}
				return &OSCAL{Declarations: &declarations}, nil

			case "profile":
				var profile Profile
				if err := xml.Unmarshal(rawOSCAL, &profile); err != nil {
					return nil, err
				}
				return &OSCAL{Profile: &profile}, nil

			case "implementation":
				var implementation Implementation
				if err := xml.Unmarshal(rawOSCAL, &implementation); err != nil {
					return nil, err
				}
				return &OSCAL{Implementation: &implementation}, nil
			}

		}
	}

	var oscalT map[string]json.RawMessage
	if err := json.Unmarshal(rawOSCAL, &oscalT); err != nil {
		return nil, err
	}
	if err = json.Unmarshal(rawOSCAL, &oscalT); err == nil {
		for k, v := range oscalT {
			switch k {
			case "catalog":
				var catalog Catalog
				if err := json.Unmarshal(v, &catalog); err != nil {
					return nil, err
				}
				return &OSCAL{Catalog: &catalog}, nil

			case "framework":
				var framework Framework
				if err := json.Unmarshal(v, &framework); err != nil {
					return nil, err
				}
				return &OSCAL{Framework: &framework}, nil

			case "worksheet":
				var worksheet Worksheet
				if err := json.Unmarshal(v, &worksheet); err != nil {
					return nil, err
				}
				return &OSCAL{Worksheet: &worksheet}, nil

			case "declarations":
				var declarations Declarations
				if err := json.Unmarshal(v, &declarations); err != nil {
					return nil, err
				}
				return &OSCAL{Declarations: &declarations}, nil

			case "profile":
				var profile Profile
				if err := json.Unmarshal(v, &profile); err != nil {
					return nil, err
				}
				return &OSCAL{Profile: &profile}, nil

			case "implementation":
				var implementation Implementation
				if err := json.Unmarshal(v, &implementation); err != nil {
					return nil, err
				}
				return &OSCAL{Implementation: &implementation}, nil
			}
		}

		return nil, errors.New("Malformed OSCAL")
	}

	return nil, errors.New("Malformed OSCAL. Must be XML or JSON")
}

// RawXML ...
func (o *OSCAL) RawXML(prettify bool) ([]byte, error) {
	if prettify {
		return xml.MarshalIndent(o, "", "  ")
	}
	return xml.Marshal(o)
}

// RawJSON ...
func (o *OSCAL) RawJSON(prettify bool) ([]byte, error) {
	if prettify {
		return json.MarshalIndent(o, "", "  ")
	}
	return json.Marshal(o)
}

// RawYAML ...
func (o *OSCAL) RawYAML() ([]byte, error) {
	return yaml.Marshal(o)
}
