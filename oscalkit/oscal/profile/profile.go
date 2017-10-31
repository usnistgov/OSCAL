package profile

import (
	"encoding/json"
	"encoding/xml"
	"strings"

	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
	yaml "gopkg.in/yaml.v2"
)

// Profile ...
type Profile struct {
	*ProfileJSON
	*ProfileXML
}

// ProfileJSON ...
type ProfileJSON struct {
	ID      string        `json:"id,omitempty" yaml:"id,omitempty"`
	Invoke  string        `json:"invoke" yaml:"invoke"`
	Include []IncludeJSON `json:"include,omitempty" yaml:"include,omitempty"`
	Exclude []CallJSON    `json:"exclude,omitempty" yaml:"exclude,omitempty"`
}

// IncludeJSON ...
type IncludeJSON struct {
	All             bool        `json:"all" yaml:"all"`
	WithSubcontrols bool        `json:"withSubcontrols" yaml:"withSubcontrols"`
	Calls           []CallJSON  `json:"calls" yaml:"calls"`
	Params          []ParamJSON `json:"params" yaml:"params"`
}

// ParamJSON ...
type ParamJSON struct {
	ID            string   `json:"id" yaml:"id"`
	OptionalClass string   `json:"class,omitempty" yaml:"class,omitempty"`
	ParamValues   []string `json:"values" yaml:"values"`
}

// CallJSON ...
type CallJSON struct {
	ControlID    string `json:"controlId,omitempty" yaml:"controlId,omitempty"`
	SubcontrolID string `json:"subcontrolId,omitempty" yaml:"subcontrolId,omitempty"`
}

// ProfileXML ...
type ProfileXML struct {
	XMLName   xml.Name           `xml:"http://csrc.nist.gov/ns/oscal/1.0 profile"`
	Invoke    *InvokeXML         `xml:"invoke"`
	Framework *core.FrameworkXML `xml:"framework,omitempty"`
}

// InvokeXML ...
type InvokeXML struct {
	Href    string       `xml:"href,attr,omitempty"`
	ID      string       `xml:"id,attr,omitempty"`
	Include []IncludeXML `xml:"include,omitempty"`
	Exclude []ExcludeXML `xml:"exclude,omitempty"`
}

// IncludeXML ...
type IncludeXML struct {
	All   *AllXML    `xml:"all,omitempty"`
	Call  []CallXML  `xml:"call,omitempty"`
	Param []ParamXML `xml:"param,omitempty"`
}

// AllXML ...
type AllXML struct {
	WithSubcontrols string `xml:"with-subcontrols,attr,omitempty"`
}

// ExcludeXML ...
type ExcludeXML struct {
	Call []CallXML `xml:"call"`
}

// CallXML ...
type CallXML struct {
	WithSubcontrols string `xml:"with-subcontrols,attr,omitempty"`
	ControlID       string `xml:"control-id,attr"`
	SubcontrolID    string `xml:"subcontrol-id,attr"`
}

// ParamXML ...
type ParamXML struct {
	ID            string   `xml:"id,attr,omitempty"`
	OptionalClass string   `xml:"class,attr,omitempty"`
	ParamValue    []string `xml:"value"`
}

// Component ...
func (p *Profile) Component() string {
	return "profile"
}

// RawJSON ...
func (p *Profile) RawJSON(prettify bool) ([]byte, error) {
	p.ProfileJSON = toJSON(p.ProfileXML)

	if prettify {
		return json.MarshalIndent(p.ProfileJSON, "", "  ")
	}
	return json.Marshal(p.ProfileJSON)
}

// RawYAML ...
func (p *Profile) RawYAML() ([]byte, error) {
	p.ProfileJSON = toJSON(p.ProfileXML)

	return yaml.Marshal(p.ProfileJSON)
}

// RawXML ...
func (p *Profile) RawXML() ([]byte, error) {
	return nil, nil
}

// JSONType ...
func (p *Profile) JSONType() interface{} {
	return p.ProfileJSON
}

// XMLType ...
func (p *Profile) XMLType() interface{} {
	return p.ProfileXML
}

func toJSON(p *ProfileXML) *ProfileJSON {
	profileJSON := &ProfileJSON{
		ID:      p.Invoke.ID,
		Invoke:  p.Invoke.Href,
		Include: make([]IncludeJSON, len(p.Invoke.Include)),
	}

	for i, include := range p.Invoke.Include {
		profileJSON.Include[i] = IncludeJSON{
			All:             include.All != nil,
			WithSubcontrols: include.All != nil && include.All.WithSubcontrols == "yes",
			Calls:           make([]CallJSON, len(include.Call)),
			Params:          make([]ParamJSON, len(include.Param)),
		}

		for c, call := range include.Call {
			profileJSON.Include[i].Calls[c] = CallJSON{
				ControlID:    call.ControlID,
				SubcontrolID: call.SubcontrolID,
			}
		}

		for p, param := range include.Param {
			profileJSON.Include[i].Params[p] = ParamJSON{
				ID:            param.ID,
				OptionalClass: param.OptionalClass,
				ParamValues:   make([]string, len(param.ParamValue)),
			}

			for pv, paramValue := range param.ParamValue {
				lines := strings.Split(paramValue, "\n")
				for li, line := range lines {
					lines[li] = strings.TrimSpace(line)
				}

				profileJSON.Include[i].Params[p].ParamValues[pv] = strings.Join(lines, " ")
			}
		}
	}

	for _, exclude := range p.Invoke.Exclude {
		for c, call := range exclude.Call {
			profileJSON.Exclude[c].ControlID = call.ControlID
			profileJSON.Exclude[c].SubcontrolID = call.SubcontrolID
		}
	}

	return profileJSON
}
