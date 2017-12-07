// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package core

import (
	"encoding/json"
	"encoding/xml"
	"fmt"

	yaml "gopkg.in/yaml.v2"
)

// Declarations ...
type Declarations struct {
	XMLName        xml.Name        `xml:"http://csrc.nist.gov/ns/oscal/1.0 declarations" json:"-" yaml:"-"`
	Href           string          `xml:"href,attr,omitempty" json:"href,omitempty" yaml:"href,omitempty"`
	ParamDecls     []ParamDecl     `xml:"-" json:"-" yaml:"-"`
	PropDecls      []PropDecl      `xml:"declare-prop,omitempty" json:"propertyDeclarations,omitempty" yaml:"propertyDeclarations,omitempty"`
	PartDecls      []PartDecl      `xml:"declare-part,omitempty" json:"partDeclarations,omitempty" yaml:"partDeclarations,omitempty"`
	ParagraphDecls []ParagraphDecl `xml:"declare-p,omitempty" json:"paragraphDeclarations,omitempty" yaml:"paragraphDeclarations,omitempty"`
	LinkDecls      []LinkDecl      `xml:"declare-link,omitempty" json:"linkDeclarations,omitempty" yaml:"linkDeclarations,omitempty"`
}

// SelfClosing ...
type SelfClosing bool

// UnmarshalXML ...
func (s *SelfClosing) UnmarshalXML(d *xml.Decoder, start xml.StartElement) error {
	var v string
	if err := d.DecodeElement(&v, &start); err != nil {
		return err
	}
	*s = true

	return nil
}

// ParamDecl ...
type ParamDecl struct{}

// PropDecl ...
type PropDecl struct {
	RequiredClass string       `xml:"class,attr" json:"class" yaml:"class"`
	Context       string       `xml:"context,attr" json:"context" yaml:"context"`
	Singleton     *SelfClosing `xml:"singleton,omitempty" json:"singleton,omitempty" yaml:"singleton,omitempty"`
	Required      *SelfClosing `xml:"required,omitempty" json:"required,omitempty" yaml:"required,omitempty"`
	Identifier    *SelfClosing `xml:"identifier,omitempty" json:"identifier,omitempty" yaml:"identifier,omitempty"`
	Regex         string       `xml:"regex,omitempty" json:"regex,omitempty" yaml:"regex,omitempty"`
	Calc          []Calc       `xml:"calc,omitempty" json:"calc,omitempty" yaml:"calc,omitempty"`
	Values        []string     `xml:"value,omitempty" json:"values,omitempty" yaml:"values,omitempty"`
}

// PartDecl ...
type PartDecl struct {
	RequiredClass string       `xml:"class,attr" json:"class" yaml:"class"`
	Context       string       `xml:"context,attr" json:"context" yaml:"context"`
	Singleton     *SelfClosing `xml:"singleton,omitempty" json:"singleton,omitempty" yaml:"singleton,omitempty"`
	Required      *SelfClosing `xml:"required,omitempty" json:"required,omitempty" yaml:"required,omitempty"`
}

// ParagraphDecl ...
type ParagraphDecl struct {
	RequiredClass string       `xml:"class,attr" json:"class" yaml:"class"`
	Context       string       `xml:"context,attr" json:"context" yaml:"context"`
	Singleton     *SelfClosing `xml:"singleton,omitempty" json:"singleton,omitempty" yaml:"singleton,omitempty"`
	Required      *SelfClosing `xml:"required,omitempty" json:"required,omitempty" yaml:"required,omitempty"`
}

// LinkDecl ...
type LinkDecl struct {
	Rel       string       `xml:"rel,attr" json:"rel" yaml:"rel"`
	Context   string       `xml:"context,attr" json:"context" yaml:"context"`
	Singleton *SelfClosing `xml:"singleton,omitempty" json:"singleton,omitempty" yaml:"singleton,omitempty"`
	Required  *SelfClosing `xml:"required,omitempty" json:"required,omitempty" yaml:"required,omitempty"`
}

// Component ...
func (d *Declarations) Component() string {
	return "declarations"
}

// Raw ...
func (d *Declarations) Raw(format string, prettify bool) ([]byte, error) {
	switch format {
	case "json":
		if prettify {
			return json.MarshalIndent(d, "", " ")
		}

		return json.Marshal(d)

	case "yaml", "yml":
		return yaml.Marshal(d)

	case "xml":
		if prettify {
			return xml.MarshalIndent(d, "", "  ")
		}

		return xml.Marshal(d)
	}

	return nil, fmt.Errorf("Unknown format: %s", format)
}

// Type ...
func (d *Declarations) Type() interface{} {
	return d
}
