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
	"strings"
)

// Prose ...
type Prose struct {
	XMLName xml.Name
	raw     []string
	order   []string
	UL      []UL
	OL      []OL
	P       []P
	Pre     []Pre
}

// MarshalXML ...
func (p *Prose) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	raw := strings.Join(p.raw, "")

	if raw != "" {
		if err := xml.Unmarshal([]byte(raw), &p); err != nil {
			return err
		}
	}

	p.XMLName = xml.Name{Local: "ul"}
	if err := e.Encode(p.UL); err != nil {
		return err
	}
	p.XMLName = xml.Name{Local: "ol"}
	if err := e.Encode(p.OL); err != nil {
		return err
	}
	p.XMLName = xml.Name{Local: "p"}
	if err := e.Encode(p.P); err != nil {
		return err
	}
	p.XMLName = xml.Name{Local: "pre"}
	if err := e.Encode(p.Pre); err != nil {
		return err
	}

	return nil
}

// UnmarshalXML ...
func (p *Prose) UnmarshalXML(d *xml.Decoder, start xml.StartElement) error {
	switch start.Name.Local {
	case "ul":
		var ul UL
		if err := d.DecodeElement(&ul, &start); err != nil {
			return err
		}

		p.UL = append(p.UL, ul)
		p.order = append(p.order, "ul")

	case "ol":
		var ol OL
		if err := d.DecodeElement(&ol, &start); err != nil {
			return err
		}

		p.OL = append(p.OL, ol)
		p.order = append(p.order, "ol")

	case "p":
		var para P
		if err := d.DecodeElement(&para, &start); err != nil {
			return err
		}

		p.P = append(p.P, para)
		p.order = append(p.order, "p")

	case "pre":
		var pre Pre
		if err := d.DecodeElement(&pre, &start); err != nil {
			return err
		}

		p.Pre = append(p.Pre, pre)
		p.order = append(p.order, "pre")
	}

	return nil
}

// MarshalJSON ...
func (p *Prose) MarshalJSON() ([]byte, error) {
	// If prose originates from OpenControl
	if p.order == nil {
		for _, para := range p.P {
			if para.Raw != "" {
				p.raw = append(p.raw, para.Raw)
			}
		}
		for _, ul := range p.UL {
			if ul.Raw != "" {
				p.raw = append(p.raw, ul.Raw)
			}
		}
		for _, ol := range p.OL {
			if ol.Raw != "" {
				p.raw = append(p.raw, ol.Raw)
			}
		}
		for _, pre := range p.Pre {
			if pre.Raw != "" {
				p.raw = append(p.raw, pre.Raw)
			}
		}

		return json.Marshal(p.raw)
	}

	// If prose originates from XML
	var ulIndex int
	var olIndex int
	var pIndex int
	var preIndex int

	for _, element := range p.order {
		switch element {
		case "ul":
			if ulIndex < len(p.UL) {
				raw, err := xml.Marshal(p.UL[ulIndex])
				if err != nil {
					return nil, err
				}

				p.raw = append(p.raw, formatRawProse(string(raw)))

				ulIndex++
			}

		case "ol":
			if olIndex < len(p.OL) {
				raw, err := xml.Marshal(p.OL[olIndex])
				if err != nil {
					return nil, err
				}

				p.raw = append(p.raw, formatRawProse(string(raw)))

				olIndex++
			}

		case "p":
			if pIndex < len(p.P) {
				raw, err := xml.Marshal(p.P[pIndex])
				if err != nil {
					return nil, err
				}

				p.raw = append(p.raw, formatRawProse(string(raw)))

				pIndex++
			}

		case "pre":
			if preIndex < len(p.Pre) {
				raw, err := xml.Marshal(p.Pre[preIndex])
				if err != nil {
					return nil, err
				}

				p.raw = append(p.raw, formatRawProse(string(raw)))

				preIndex++
			}
		}
	}

	return json.Marshal(p.raw)
}

// MarshalYAML ...
func (p *Prose) MarshalYAML() (interface{}, error) {
	return p.raw, nil
}

// UnmarshalJSON ...
func (p *Prose) UnmarshalJSON(data []byte) error {
	return json.Unmarshal(data, &p.raw)
}

// Calc ...
type Calc struct {
	Inherit []Inherit `xml:"inherit,omitempty" json:"inheritances,omitempty" yaml:"inheritances,omitempty"`
	Autonum []string  `xml:"autonum,omitempty" json:"autonum,omitempty" yaml:"autonum,omitempty"`
	Value   string    `xml:",chardata" json:"value,omitempty" yaml:"value,omitempty"`
}

// Inherit ...
type Inherit struct {
	From string `xml:"from,attr,omitempty" json:"from,omitempty" yaml:"from,omitempty"`
}

// MarshalJSON ...
func (i *Inherit) MarshalJSON() ([]byte, error) {
	if i.From == "" {
		return json.Marshal(true)
	}

	return json.Marshal(*i)
}

// MarshalYAML ...
func (i *Inherit) MarshalYAML() (interface{}, error) {
	if i.From == "" {
		return true, nil
	}

	return *i, nil
}

// UnmarshalJSON ...
func (i *Inherit) UnmarshalJSON(data []byte) error {
	var inheritBool bool
	if err := json.Unmarshal(data, &inheritBool); err != nil {
		var inherit Inherit
		if err := json.Unmarshal(data, &inherit); err != nil {
			return err
		}
		*i = inherit
		return nil
	}

	*i = Inherit{}
	return nil
}

// P ...
type P struct {
	XMLName       xml.Name `xml:"p" json:"-" yaml:"-"`
	Raw           string   `xml:",innerxml" json:"raw,omitempty" yaml:"raw,omitempty"`
	ID            string   `xml:"id,attr,omitempty" json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string   `xml:"class,attr,omitempty" json:"class,omitempty" yaml:"class,omitempty"`

	// // rnc:semantical
	// Withdrawn []Withdrawn `xml:"withdrawn"`
	// Assign    []Assign    `xml:"insert"`
	// Select    []Select    `xml:"select"`

	// // rnc:mix
	// Q     []Q    `xml:"q"`
	// Code  []Code `xml:"code"`
	// EM    []EM   `xml:"em"`
	// I     []I    `xml:"i"`
	// B     []B    `xml:"b"`
	// Sub   []Sub  `xml:"sub"`
	// Sup   []Sup  `xml:"sup"`
	// Span  []Span `xml:"span"`
	// Value string    `xml:",chardata"`

	// Xref []Xref `xml:"a"`
}

// Pre ...
type Pre struct {
	XMLName xml.Name `xml:"pre"`
	Raw     string   `xml:",innerxml"`
	ID      string   `xml:"id,attr,omitempty"`

	// // rnc:mix
	// Q     []Q    `xml:"q"`
	// Code  []Code `xml:"code"`
	// EM    []EM   `xml:"em"`
	// I     []I    `xml:"i"`
	// B     []B    `xml:"b"`
	// Sub   []Sub  `xml:"sub"`
	// Sup   []Sup  `xml:"sup"`
	// Span  []Span `xml:"span"`
	// Value string    `xml:",chardata"`

	// Xref []Xref `xml:"a"`
}

// OL ...
type OL struct {
	XMLName xml.Name `xml:"ol"`
	Raw     string   `xml:",innerxml"`
	// LI      []LI  `xml:"li"`
}

// UL ...
type UL struct {
	XMLName xml.Name `xml:"ul"`
	Raw     string   `xml:",innerxml"`
	// LI      []LI  `xml:"li"`
}

// LI ...
type LI struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`

	// rnc:semantical
	Withdrawn []Withdrawn `xml:"withdrawn"`
	Assign    []Assign    `xml:"insert"`
	Select    []Select    `xml:"select"`

	// rnc:mix
	Q     []Q    `xml:"q"`
	Code  []Code `xml:"code"`
	EM    []EM   `xml:"em"`
	I     []I    `xml:"i"`
	B     []B    `xml:"b"`
	Sub   []Sub  `xml:"sub"`
	Sup   []Sup  `xml:"sup"`
	Span  []Span `xml:"span"`
	Value string `xml:",chardata"`

	Xref []Xref `xml:"a"`

	OL []OL `xml:"ol"`
	UL []UL `xml:"ul"`
}

// Q ...
type Q struct {
	I     []I    `xml:"i"`
	B     []B    `xml:"b"`
	Sub   []Sub  `xml:"sub"`
	Sup   []Sup  `xml:"sup"`
	Value string `xml:",chardata"`
}

// Code ...
type Code struct {
	OptionalClass string `xml:"class,attr"`
	Q             []Q    `xml:"q"`
	Code          []Code `xml:"code"`
	EM            []EM   `xml:"em"`
	I             []I    `xml:"i"`
	B             []B    `xml:"b"`
	Sub           []Sub  `xml:"sub"`
	Sup           []Sup  `xml:"sup"`
	Span          []Span `xml:"span"`
	Value         string `xml:",chardata"`
}

// EM ...
type EM struct {
	OptionalClass string `xml:"class,attr"`
	Q             []Q    `xml:"q"`
	Code          []Code `xml:"code"`
	EM            []EM   `xml:"em"`
	I             []I    `xml:"i"`
	B             []B    `xml:"b"`
	Sub           []Sub  `xml:"sub"`
	Sup           []Sup  `xml:"sup"`
	Span          []Span `xml:"span"`
	Value         string `xml:",chardata"`
	Xref          []Xref `xml:"a"`
}

// I ...
type I struct {
	OptionalClass string `xml:"class,attr"`
	Q             []Q    `xml:"q"`
	Code          []Code `xml:"code"`
	EM            []EM   `xml:"em"`
	I             []I    `xml:"i"`
	B             []B    `xml:"b"`
	Sub           []Sub  `xml:"sub"`
	Sup           []Sup  `xml:"sup"`
	Span          []Span `xml:"span"`
	Value         string `xml:",chardata"`
	Xref          []Xref `xml:"a"`
}

// B ...
type B struct {
	OptionalClass string `xml:"class,attr"`
	Q             []Q    `xml:"q"`
	Code          []Code `xml:"code"`
	EM            []EM   `xml:"em"`
	I             []I    `xml:"i"`
	B             []B    `xml:"b"`
	Sub           []Sub  `xml:"sub"`
	Sup           []Sup  `xml:"sup"`
	Span          []Span `xml:"span"`
	Value         string `xml:",chardata"`
	Xref          []Xref `xml:"a"`
}

// Sub ...
type Sub struct {
	OptionalClass string `xml:"class,attr"`
	Value         string `xml:",chardata"`
}

// Sup ...
type Sup struct {
	OptionalClass string `xml:"class,attr"`
	Value         string `xml:",chardata"`
}

// Span ...
type Span struct {
	OptionalClass string `xml:"class,attr"`
	Q             []Q    `xml:"q"`
	Code          []Code `xml:"code"`
	EM            []EM   `xml:"em"`
	I             []I    `xml:"i"`
	B             []B    `xml:"b"`
	Sub           []Sub  `xml:"sub"`
	Sup           []Sup  `xml:"sup"`
	Span          []Span `xml:"span"`
	Value         string `xml:",chardata"`
	Xref          []Xref `xml:"a"`
}

// Xref ...
type Xref struct {
	Href string `xml:"href,attr"`
	Q    []Q    `xml:"q"`
	Code []Code `xml:"code"`
	EM   []struct {
		OptionalClass string `xml:"class,attr"`
		Value         string `xml:",chardata"`
	} `xml:"em"`
	Value string `xml:",chardata"`
}

// Withdrawn ...
type Withdrawn struct {
	Q     []Q    `xml:"q"`
	Code  []Code `xml:"code"`
	EM    []EM   `xml:"em"`
	I     []I    `xml:"i"`
	B     []B    `xml:"b"`
	Sub   []Sub  `xml:"sub"`
	Sup   []Sup  `xml:"sup"`
	Span  []Span `xml:"span"`
	Value string `xml:",chardata"`
}

// Assign ...
type Assign struct {
	ID      string `xml:"id,attr"`
	ParamID string `xml:"param-id"`
}

// Select ...
type Select struct{}

func formatRawProse(raw string) string {
	lines := strings.Split(raw, "\n")

	value := []string{}

	for _, line := range lines {
		value = append(value, strings.TrimSpace(line))
	}

	return strings.Join(value, " ")
}
