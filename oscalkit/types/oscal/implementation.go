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

	yaml "gopkg.in/yaml.v2"
)

// Implementation ...
type Implementation struct {
	XMLName    xml.Name   `xml:"http://csrc.nist.gov/ns/oscal/1.0 implementation" json:"-" yaml:"-"`
	ID         string     `xml:"id,attr,omitempty" json:"id,omitempty" yaml:"id,omitempty"`
	Title      string     `xml:"title" json:"title" yaml:"title"`
	Paragraphs []P        `xml:"p,omitempty" json:"paragraphs,omitempty" yaml:"paragraphs,omitempty"`
	Props      []Prop     `xml:"prop,omitempty" json:"prop,omitempty" yaml:"prop,omitempty"`
	Profiles   *Profiles  `xml:"profiles,omitempty" json:"profiles,omitempty" yaml:"profiles,omitempty"`
	Components Components `xml:"components,omitempty" json:"components" yaml:"components"`
	Policies   Policies   `xml:"policies,omitempty" json:"policies" yaml:"policies"`
	Procedures Procedures `xml:"procedures,omitempty" json:"procedures" yaml:"procedures"`
	Params     Params     `xml:"params,omitempty" json:"params" yaml:"params"`
}

// Profiles ...
type Profiles struct {
	Links []Link `xml:"link,omitempty" json:"link,omitempty" yaml:"link,omitempty"`
}

// Components ...
type Components struct {
	Items []Item `xml:"component,omitempty" json:"component,omitempty" yaml:"component,omitempty"`
}

// Policies ...
type Policies struct {
	Items []Item `xml:"component,omitempty" json:"component,omitempty" yaml:"component,omitempty"`
}

// Procedures ...
type Procedures struct {
	Items []Item `xml:"component,omitempty" json:"component,omitempty" yaml:"component,omitempty"`
}

// Params ...
type Params struct {
	SetParams []ImplementationParam `xml:"set-param,omitempty" json:"setParam,omitempty" yaml:"setParam,omitempty"`
}

// ImplementationParam ...
type ImplementationParam struct {
	ID    string `xml:"param-id,omitempty" json:"paramId" yaml:"paramId"`
	Props []Prop `xml:"prop,omitempty" json:"prop,omitempty" yaml:"prop,omitempty"`
	Desc  Desc   `xml:"desc,omitempty" json:"desc,omitempty" yaml:"desc,omitempty"`
}

// Component ...
func (Implementation) Component() string {
	return "implementation"
}

// RawXML ...
func (i *Implementation) RawXML(prettify bool) ([]byte, error) {
	if prettify {
		return xml.MarshalIndent(i, "", "  ")
	}

	return xml.Marshal(i)
}

// RawJSON ...
func (i *Implementation) RawJSON(prettify bool) ([]byte, error) {
	if prettify {
		return json.MarshalIndent(i, "", "  ")
	}

	return json.Marshal(i)
}

// RawYAML ...
func (i *Implementation) RawYAML() ([]byte, error) {
	return yaml.Marshal(i)
}
