// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package core

import "encoding/xml"

// Catalog ...
type Catalog struct {
	XMLName      xml.Name      `xml:"http://csrc.nist.gov/ns/oscal/1.0 catalog" json:"-" yaml:"-"`
	Title        string        `xml:"title" json:"title" yaml:"title"`
	Declarations *Declarations `xml:"declarations,omitempty" json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Sections     []Section     `xml:"section" json:"sections,omitempty" yaml:"sections,omitempty"`
	Groups       []Group       `xml:"group" json:"groups,omitempty" yaml:"groups,omitempty"`
	Controls     []Control     `xml:"control" json:"controls,omitempty" yaml:"controls,omitempty"`
	References   *References   `xml:"references,omitempty" json:"references,omitempty" yaml:"references,omitempty"`
}
