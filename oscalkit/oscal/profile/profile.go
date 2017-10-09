package profile

import (
	"encoding/xml"

	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

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
