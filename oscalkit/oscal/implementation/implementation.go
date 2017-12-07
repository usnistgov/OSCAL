// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package implementation

import "encoding/json"

// Implementation ...
type Implementation struct {
	Name        string      `json:"name"`
	Description string      `json:"description"`
	Maintainers []string    `json:"maintainers"`
	Profiles    []Profile   `json:"profiles"`
	Components  []Component `json:"components"`
	Policies    []Policy    `json:"policies"`
	Params      []Param     `json:"params"`
}

// Profile ...
type Profile struct {
	Name string `json:"name"`
	Href string `json:"href"`
}

// Component ...
type Component struct {
	Name             string      `json:"name"`
	Description      string      `json:"description"`
	ResponsibleRoles []string    `json:"responsibleRoles"`
	Satisfies        []Satisfy   `json:"satisfies"`
	References       []Reference `json:"references"`
}

// Policy ...
type Policy Component

// Satisfy ...
type Satisfy struct {
	ControlID    string      `json:"controlId"`
	SubcontrolID string      `json:"subcontrolId"`
	Narratives   []Narrative `json:"narratives"`
	Origins      []string    `json:"origins"`
	Statuses     []string    `json:"statuses"`
	References   []Reference `json:"references"`
}

// Narrative ...
type Narrative struct {
	Key        string      `json:"key"`
	Value      string      `json:"value"`
	References []Reference `json:"references"`
}

// Param ...
type Param struct {
	ParamID string `json:"paramId"`
	Value   string `json:"value"`
}

// Reference ...
type Reference struct {
	ID          string `json:"id"`
	Name        string `json:"name"`
	Description string `json:"description"`
	URL         string `json:"url"`
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
	}

	return nil, nil
}

// Type ...
func (i *Implementation) Type() interface{} {
	return i
}
