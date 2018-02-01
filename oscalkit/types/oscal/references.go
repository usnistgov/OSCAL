// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package oscal

// References ...
type References struct {
	Refs []Ref `xml:"ref" json:"refs" yaml:"refs"`
}

// Ref ...
type Ref struct {
	ID        string     `xml:"id,attr,omitempty" json:"id,omitempty" yaml:"id,omitempty"`
	Standards []Standard `xml:"std,omitempty" json:"standards,omitempty" yaml:"standards,omitempty"`
	Citations []Citation `xml:"citation,omitempty" json:"citations,omitempty" yaml:"citations,omitempty"`
	Prose     *Prose     `xml:",any" json:"prose,omitempty" yaml:"prose,omitempty"`
}

// Standard ...
type Standard struct {
	Href  string `xml:"href,attr,omitempty" json:"href,omitempty" yaml:"href,omitempty"`
	Value string `xml:",chardata" json:"value,omitempty" yaml:"value,omitempty"`
}

// Citation ...
type Citation struct {
	Href  string `xml:"href,attr,omitempty" json:"href,omitempty" yaml:"href,omitempty"`
	Value string `xml:",chardata" json:"value,omitempty" yaml:"value,omitempty"`
}
