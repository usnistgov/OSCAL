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
	"fmt"
	"strconv"

	yaml "gopkg.in/yaml.v2"
)

// Implementation ...
type Implementation struct {
	Name        string      `json:"name" yaml:"name"`
	Description string      `json:"description" yaml:"description"`
	Maintainers []string    `json:"maintainers" yaml:"maintainers"`
	Profiles    []Profile   `json:"profiles" yaml:"profiles"`
	Components  []Component `json:"components" yaml:"components"`
	Policies    []Policy    `json:"policies" yaml:"policies"`
	Procedures  []Procedure `json:"procedures" yaml:"procedures"`
	Params      []Param     `json:"params" yaml:"params"`
}

// Profile ...
type Profile struct {
	Name string `json:"name" yaml:"name"`
	Href string `json:"href" yaml:"href"`
}

// Component ...
type Component struct {
	Name             string      `json:"name" yaml:"name"`
	Description      string      `json:"description" yaml:"description"`
	ResponsibleRoles []string    `json:"responsibleRoles" yaml:"responsible_roles"`
	Satisfies        []Satisfy   `json:"satisfies" yaml:"satisfies"`
	References       []Reference `json:"references" yaml:"references"`
}

// Policy ...
type Policy Component

// Procedure ...
type Procedure Component

// Satisfy ...
type Satisfy struct {
	ControlIDs    []string    `json:"controlIds" yaml:"control_ids"`
	SubcontrolIDs []string    `json:"subcontrolIds" yaml:"subcontrol_ids"`
	Narratives    []Narrative `json:"narratives" yaml:"narratives"`
	Origins       []string    `json:"origins" yaml:"origins"`
	Statuses      []string    `json:"statuses" yaml:"statuses"`
	References    []Reference `json:"references" yaml:"references"`
}

// Narrative ...
type Narrative struct {
	Value      string      `json:"value" yaml:"value"`
	References []Reference `json:"references" yaml:"references"`
}

// MarshalJSON ...
func (n *Narrative) MarshalJSON() ([]byte, error) {
	value, err := strconv.Unquote(n.Value)
	if err != nil {
		return nil, err
	}

	n.Value = value

	return json.Marshal(*n)
}

// Param ...
type Param struct {
	ParamID string `json:"paramId" yaml:"param_id"`
	Value   string `json:"value" yaml:"value"`
}

// Reference ...
type Reference struct {
	ID          string `json:"id" yaml:"id"`
	Name        string `json:"name" yaml:"name"`
	Description string `json:"description" yaml:"description"`
	URL         string `json:"url" yaml:"url"`
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
	}

	return nil, fmt.Errorf("Unable to generate raw data. Unknown format: %s", format)
}

// Type ...
func (i *Implementation) Type() interface{} {
	return i
}
