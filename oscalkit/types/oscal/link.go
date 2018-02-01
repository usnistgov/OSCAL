// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package oscal

// Link ...
type Link struct {
	Rel   string `xml:"rel,attr" json:"rel,omitempty"  yaml:"rel,omitempty"`
	Href  string `xml:"href,attr" json:"href" yaml:"href"`
	Value string `xml:",chardata" json:"value,omitempty" yaml:"value,omitempty"`
}
