// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package implementation

import (
	"encoding/json"
	"encoding/xml"
	"fmt"

	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
	yaml "gopkg.in/yaml.v2"
)

// Implementation ...
type Implementation struct {
	XMLName    xml.Name    `xml:"http://csrc.nist.gov/ns/oscal/1.0 implementation" json:"-" yaml:"-"`
	ID         string      `xml:"id,attr,omitempty" json:"id,omitempty" yaml:"id,omitempty"`
	Title      string      `xml:"title" json:"title" yaml:"title"`
	Paragraphs []core.P    `xml:"p,omitempty" json:"paragraphs,omitempty" yaml:"paragraphs,omitempty"`
	Props      []core.Prop `xml:"prop,omitempty" json:"prop,omitempty" yaml:"prop,omitempty"`
	Profiles   *Profiles   `xml:"profiles,omitempty" json:"profiles" yaml:"profiles"`
	Components Components  `xml:"components,omitempty" json:"components" yaml:"components"`
	Policies   Policies    `xml:"policies,omitempty" json:"policies" yaml:"policies"`
	Procedures Procedures  `xml:"procedures,omitempty" json:"procedures" yaml:"procedures"`
	Params     Params      `xml:"params,omitempty" json:"params" yaml:"params"`
}

// Profiles ...
type Profiles struct {
	Links []core.Link `xml:"link,omitempty" json:"link,omitempty" yaml:"link,omitempty"`
}

// Components ...
type Components struct {
	Items []core.Item `xml:"component,omitempty" json:"component,omitempty" yaml:"component,omitempty"`
}

// Policies ...
type Policies struct {
	Items []core.Item `xml:"component,omitempty" json:"component,omitempty" yaml:"component,omitempty"`
}

// Procedures ...
type Procedures struct {
	Items []core.Item `xml:"component,omitempty" json:"component,omitempty" yaml:"component,omitempty"`
}

// Params ...
type Params struct {
	SetParams []ImplementationParam `xml:"set-param,omitempty" json:"setParam,omitempty" yaml:"setParam,omitempty"`
}

// ImplementationParam ...
type ImplementationParam struct {
	ID    string      `xml:"param-id,omitempty" json:"paramId" yaml:"paramId"`
	Props []core.Prop `xml:"prop,omitempty" json:"prop,omitempty" yaml:"prop,omitempty"`
	Desc  core.Desc   `xml:"desc,omitempty" json:"desc,omitempty" yaml:"desc,omitempty"`
}

// Component ...
func (Implementation) Component() string {
	return "implementation"
}

// Raw ...
func (i *Implementation) Raw(format string, prettify bool) ([]byte, error) {
	switch format {
	case "json":
		if prettify {
			return json.MarshalIndent(i, "", "  ")
		}

		return json.Marshal(i)

	case "yaml", "yml":
		return yaml.Marshal(i)

	case "xml":
		if prettify {
			return xml.MarshalIndent(i, "", "  ")
		}

		return xml.Marshal(i)
	}

	return nil, fmt.Errorf("Unable to generate raw data. Unknown format: %s", format)
}

// Type ...
func (i *Implementation) Type() interface{} {
	return i
}
