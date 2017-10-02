package xmltypes

import (
	"encoding/xml"
)

// Profile ...
type Profile struct {
	XMLName   xml.Name   `xml:"http://csrc.nist.gov/ns/oscal/1.0 profile"`
	Invoke    *Invoke    `xml:"invoke"`
	Framework *Framework `xml:"framework,omitempty"`
}

// Invoke ...
type Invoke struct {
	Href    string    `xml:"href,attr,omitempty"`
	ID      string    `xml:"id,attr,omitempty"`
	Include []Include `xml:"include,omitempty"`
	Exclude []Exclude `xml:"exclude,omitempty"`
}

// Include ...
type Include struct {
	All   *All           `xml:"all,omitempty"`
	Call  []Call         `xml:"call,omitempty"`
	Param []ProfileParam `xml:"param,omitempty"`
}

// All ...
type All struct {
	WithSubcontrols string `xml:"with-subcontrols,attr,omitempty"`
}

// Exclude ...
type Exclude struct {
	Call []Call `xml:"call"`
}

// Call ...
type Call struct {
	WithSubcontrols string `xml:"with-subcontrols,attr,omitempty"`
	ControlID       string `xml:"control-id,attr"`
	SubcontrolID    string `xml:"subcontrol-id,attr"`
}

// ProfileParam ...
type ProfileParam struct {
	ID            string   `xml:"id,attr,omitempty"`
	OptionalClass string   `xml:"class,attr,omitempty"`
	ParamValue    []string `xml:"value"`
}
