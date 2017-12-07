// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package core

// Control ...
type Control struct {
	OptionalClass string       `xml:"class,attr" json:"class,omitempty" yaml:"class,omitempty"`
	ID            string       `xml:"id,attr" json:"id" yaml:"id"`
	Title         string       `xml:"title" json:"title" yaml:"title"`
	Params        []Param      `xml:"param" json:"params,omitempty" yaml:"params,omitempty"`
	Props         []Prop       `xml:"prop" json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []Part       `xml:"part" json:"parts,omitempty" yaml:"parts,omitempty"`
	Links         []Link       `xml:"link" json:"links,omitempty" yaml:"links,omitempty"`
	Prose         *Prose       `xml:",any" json:"prose,omitempty" yaml:"prose,omitempty"`
	Subcontrols   []Subcontrol `xml:"subcontrol,omitempty" json:"subcontrols,omitempty" yaml:"subcontrols,omitempty"`
	References    *References  `xml:"references,omitempty" json:"references,omitempty" yaml:"references,omitempty"`
}
