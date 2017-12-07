// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package profile

import (
	"encoding/json"
	"encoding/xml"
	"fmt"
	"path/filepath"
	"strings"

	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
	yaml "gopkg.in/yaml.v2"
)

// Raw ...
type Raw struct {
	Value string `xml:",innerxml"`
}

// MarshalJSON ...
func (r *Raw) MarshalJSON() ([]byte, error) {
	return json.Marshal(formatRawProse(r.Value))
}

// MarshalYAML ...
func (r *Raw) MarshalYAML() (interface{}, error) {
	return r.Value, nil
}

// UnmarshalJSON ...
func (r *Raw) UnmarshalJSON(data []byte) error {
	var raw string
	if err := json.Unmarshal(data, &raw); err != nil {
		return err
	}

	r.Value = raw

	return nil
}

// Profile ...
type Profile struct {
	XMLName       xml.Name        `xml:"http://csrc.nist.gov/ns/oscal/1.0 profile" json:"-" yaml:"-"`
	ID            string          `xml:"id,attr,omitempty" json:"id,omitempty" yaml:"id,omitempty"`
	Title         *Raw            `xml:"title,omitempty" json:"title,omitempty" yaml:"title,omitempty"`
	Invocations   []Invoke        `xml:"invoke" json:"invocations" yaml:"invocations"`
	FrameworkJSON *core.Framework `xml:"framework,omitempty" json:"framework,omitempty" yaml:"framework,omitempty"`
}

// Href ...
type Href string

// MarshalJSON ...
func (h *Href) MarshalJSON() ([]byte, error) {
	return json.Marshal(fmt.Sprintf("%s.json", strings.TrimSuffix(string(*h), filepath.Ext(string(*h)))))
}

// MarshalYAML ...
func (h *Href) MarshalYAML() (interface{}, error) {
	return fmt.Sprintf("%s.yaml", strings.TrimSuffix(string(*h), filepath.Ext(string(*h)))), nil
}

// MarshalXMLAttr ...
func (h *Href) MarshalXMLAttr(name xml.Name) (xml.Attr, error) {
	return xml.Attr{Name: name, Value: fmt.Sprintf("%s.xml", strings.TrimSuffix(string(*h), filepath.Ext(string(*h))))}, nil
}

// Invoke ...
type Invoke struct {
	Href          *Href          `xml:"href,attr,omitempty" json:"href,omitempty" yaml:"href,omitempty"`
	Include       *Include       `xml:"include,omitempty" json:"include,omitempty" yaml:"include,omitempty"`
	Exclude       *Exclude       `xml:"exclude,omitempty" json:"exclude,omitempty" yaml:"exclude,omitempty"`
	ParamSettings []ParamSetting `xml:"set-param,omitempty" json:"paramSettings,omitempty" yaml:"paramSettings,omitempty"`
	Alterations   []Alteration   `xml:"alter,omitempty" json:"alterations,omitempty" yaml:"alterations,omitempty"`
}

// Include ...
type Include struct {
	All   *All   `xml:"all,omitempty" json:"all,omitempty" yaml:"all,omitempty"`
	Calls []Call `xml:"call,omitempty" json:"calls,omitempty" yaml:"calls,omitempty"`
}

// WithSubcontrols ...
type WithSubcontrols bool

// UnmarshalXMLAttr ...
func (w *WithSubcontrols) UnmarshalXMLAttr(attr xml.Attr) error {
	*w = attr.Value == "yes"

	return nil
}

// MarshalXMLAttr ...
func (w *WithSubcontrols) MarshalXMLAttr(name xml.Name) (xml.Attr, error) {
	if *w {
		return xml.Attr{Name: name, Value: "yes"}, nil
	}

	return xml.Attr{}, nil
}

// All ...
type All struct {
	WithSubcontrols WithSubcontrols `xml:"with-subcontrols,attr,omitempty"`
}

type withSubcontrolsJSON struct {
	WithSubcontrols bool `json:"withSubcontrols"`
}

// MarshalJSON ...
func (a *All) MarshalJSON() ([]byte, error) {
	if a.WithSubcontrols {
		return json.Marshal(withSubcontrolsJSON{true})
	}

	return json.Marshal(true)
}

// MarshalYAML ...
func (a *All) MarshalYAML() (interface{}, error) {
	if a.WithSubcontrols {
		return withSubcontrolsJSON{true}, nil
	}

	return true, nil
}

// UnmarshalJSON ...
func (a *All) UnmarshalJSON(data []byte) error {
	var withSubcontrolsObj withSubcontrolsJSON

	if err := json.Unmarshal(data, &withSubcontrolsObj); err != nil {
		var all bool
		if err := json.Unmarshal(data, &all); err != nil {
			return err
		}

		// Go lacks support for marshaling of self-closing tags
		*a = All{}
		return nil
	}

	a.WithSubcontrols = WithSubcontrols(withSubcontrolsObj.WithSubcontrols)
	return nil
}

// Exclude ...
type Exclude struct {
	Calls []ExcludeCall `xml:"call" json:"calls,omitempty" yaml:"calls,omitempty"`
}

// ExcludeCall ...
type ExcludeCall struct {
	ControlID    string `xml:"control-id,attr,omitempty" json:"controlId,omitempty" yaml:"controlId,omitempty"`
	SubcontrolID string `xml:"subcontrol-id,attr,omitempty" json:"subcontrolId,omitempty" yaml:"subcontrolId,omitempty"`
}

// Call ...
type Call struct {
	WithSubcontrols *WithSubcontrols `xml:"with-subcontrols,attr,omitempty" json:"withSubcontrols,omitempty" yaml:"withSubcontrols,omitempty"`
	ControlID       string           `xml:"control-id,attr,omitempty" json:"controlId,omitempty" yaml:"controlId,omitempty"`
	SubcontrolID    string           `xml:"subcontrol-id,attr,omitempty" json:"subcontrolId,omitempty" yaml:"subcontrolId,omitempty"`
}

// ParamSetting ...
type ParamSetting struct {
	ParamID       string `xml:"param-id,attr,omitempty" json:"paramId,omitempty" yaml:"paramId,omitempty"`
	OptionalClass string `xml:"class,attr,omitempty" json:"class,omitempty" yaml:"class,omitempty"`
	Desc          *Raw   `xml:"desc,omitempty" json:"desc,omitempty" yaml:"desc,omitempty"`
	ParamValue    string `xml:"value,omitempty" json:"value,omitempty" yaml:"value,omitempty"`
}

// Alteration ...
type Alteration struct {
	ControlID    string   `xml:"control-id,attr,omitempty" json:"controlId,omitempty" yaml:"controlId,omitempty"`
	SubcontrolID string   `xml:"subcontrol-id,attr,omitempty" json:"subcontrolId,omitempty" yaml:"subcontrolId,omitempty"`
	Remove       *Remove  `xml:"remove,omitempty" json:"remove,omitempty" yaml:"remove,omitempty"`
	Augment      *Augment `xml:"augment,omitempty" json:"augment,omitempty" yaml:"augment,omitempty"`
}

// Remove ...
type Remove struct {
	Targets []string `xml:"targets,attr,omitempty" json:"targets,omitempty" yaml:"targets,omitempty"`
}

// Augment ...
type Augment struct {
	Props []core.Prop `xml:"prop,omitempty" json:"props,omitempty" yaml:"props,omitempty"`
	Parts []core.Part `xml:"part,omitempty" json:"parts,omitempty" yaml:"parts,omitempty"`
}

// Component ...
func (p *Profile) Component() string {
	return "profile"
}

// Raw ...
func (p *Profile) Raw(format string, prettify bool) ([]byte, error) {
	switch format {
	case "json":
		if prettify {
			return json.MarshalIndent(p, "", "  ")
		}
		return json.Marshal(p)

	case "yaml", "yml":
		return yaml.Marshal(p)

	case "xml":
		if prettify {
			return xml.MarshalIndent(p, "", "  ")
		}
		return xml.Marshal(p)
	}

	return nil, fmt.Errorf("Unknown format: %s", format)
}

// Type ...
func (p *Profile) Type() interface{} {
	return p
}

func formatRawProse(raw string) string {
	lines := strings.Split(raw, "\n")

	value := []string{}

	for _, line := range lines {
		value = append(value, strings.TrimSpace(line))
	}

	return strings.Join(value, "")
}
