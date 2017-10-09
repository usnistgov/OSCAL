package core

import (
	"encoding/json"
	"encoding/xml"

	yaml "gopkg.in/yaml.v2"
)

// Declarations ...
type Declarations struct {
	*DeclarationsJSON
	*DeclarationsXML
}

// DeclarationsJSON ...
type DeclarationsJSON struct {
	Href           string              `json:"href,omitempty" yaml:"href,omitempty"`
	PropDecls      []PropDeclJSON      `json:"propertyDeclarations,omitempty" yaml:"propertyDeclarations,omitempty"`
	PartDecls      []PartDeclJSON      `json:"partDeclarations,omitempty" yaml:"partDeclarations,omitempty"`
	ParagraphDecls []ParagraphDeclJSON `json:"paragraphDeclarations,omitempty" yaml:"paragraphDeclarations,omitempty"`
	LinkDecls      []LinkDeclJSON      `json:"linkDeclarations,omitempty" yaml:"linkDeclarations,omitempty"`
}

// PropDeclJSON ...
type PropDeclJSON struct {
	RequiredClass string      `json:"class" yaml:"class"`
	Context       string      `json:"context" yaml:"context"`
	Singleton     bool        `json:"singleton" yaml:"singleton"`
	Required      bool        `json:"required" yaml:"required"`
	Identifier    bool        `json:"identifier" yaml:"identifier"`
	Regex         string      `json:"regex,omitempty" yaml:"regex,omitempty"`
	Values        []ValueJSON `json:"values,omitempty" yaml:"values,omitempty"`
}

// PartDeclJSON ...
type PartDeclJSON struct {
	RequiredClass string `json:"class" yaml:"class"`
	Context       string `json:"context" yaml:"context"`
	Singleton     bool   `json:"singleton" yaml:"singleton"`
	Required      bool   `json:"required" yaml:"required"`
}

// ParagraphDeclJSON ...
type ParagraphDeclJSON struct {
	RequiredClass string `json:"class" yaml:"class"`
	Context       string `json:"context" yaml:"context"`
	Singleton     bool   `json:"singleton" yaml:"singleton"`
	Required      bool   `json:"required" yaml:"required"`
}

// LinkDeclJSON ...
type LinkDeclJSON struct {
	Rel       string `json:"rel" yaml:"rel"`
	Context   string `json:"context" yaml:"context"`
	Singleton bool   `json:"singleton" yaml:"singleton"`
	Required  bool   `json:"required" yaml:"required"`
}

// DeclarationsXML ...
type DeclarationsXML struct {
	XMLName      xml.Name          `xml:"http://csrc.nist.gov/ns/oscal/1.0 declarations"`
	Href         string            `xml:"href,attr"`
	PropertyDecl []PropertyDeclXML `xml:"declare-prop"`
	PartDecl     []PartDeclXML     `xml:"declare-part"`
	ParaDecl     []ParaDeclXML     `xml:"declare-p"`
	LinkDecl     []LinkDeclXML     `xml:"declare-link"`
}

// PropertyDeclXML ...
type PropertyDeclXML struct {
	RequiredClass string     `xml:"class,attr"`
	Context       string     `xml:"context,attr"`
	Singleton     *struct{}  `xml:"singleton"`
	Required      *struct{}  `xml:"required"`
	Identifier    *struct{}  `xml:"identifier"`
	Regex         string     `xml:"regex"`
	Value         []ValueXML `xml:"value"`
}

// PartDeclXML ...
type PartDeclXML struct {
	RequiredClass string    `xml:"class,attr"`
	Context       string    `xml:"context,attr"`
	Singleton     *struct{} `xml:"singleton"`
	Required      *struct{} `xml:"required"`
}

// ParaDeclXML ...
type ParaDeclXML struct {
	RequiredClass string    `xml:"class,attr"`
	Context       string    `xml:"context,attr"`
	Singleton     *struct{} `xml:"singleton"`
	Required      *struct{} `xml:"required"`
}

// LinkDeclXML ...
type LinkDeclXML struct {
	Rel       string    `xml:"rel,attr"`
	Context   string    `xml:"context,attr"`
	Singleton *struct{} `xml:"singleton"`
	Required  *struct{} `xml:"required"`
}

// Component ...
func (d *Declarations) Component() string {
	return "declarations"
}

// RawJSON ...
func (d *Declarations) RawJSON(prettify bool) ([]byte, error) {
	d.DeclarationsJSON = declarationsToJSON(d.DeclarationsXML)

	if prettify {
		return json.MarshalIndent(d.DeclarationsJSON, "", " ")
	}

	return json.Marshal(d.DeclarationsJSON)
}

// RawYAML ...
func (d *Declarations) RawYAML() ([]byte, error) {
	d.DeclarationsJSON = declarationsToJSON(d.DeclarationsXML)

	return yaml.Marshal(d.DeclarationsJSON)
}

// RawXML ...
func (d *Declarations) RawXML() ([]byte, error) {
	return nil, nil
}

// JSONType ...
func (d *Declarations) JSONType() interface{} {
	return d.DeclarationsJSON
}

// XMLType ...
func (d *Declarations) XMLType() interface{} {
	return d.DeclarationsXML
}

// DeclarationsToJSON ...
func declarationsToJSON(declarations *DeclarationsXML) *DeclarationsJSON {
	if declarations == nil {
		return nil
	}

	declarationsJSON := &DeclarationsJSON{
		Href:           declarations.Href,
		PropDecls:      make([]PropDeclJSON, len(declarations.PropertyDecl)),
		PartDecls:      make([]PartDeclJSON, len(declarations.PartDecl)),
		ParagraphDecls: make([]ParagraphDeclJSON, len(declarations.ParaDecl)),
		LinkDecls:      make([]LinkDeclJSON, len(declarations.LinkDecl)),
	}

	for i, p := range declarations.PropertyDecl {
		declarationsJSON.PropDecls[i] = propDeclToJSON(p)
	}

	for i, p := range declarations.PartDecl {
		declarationsJSON.PartDecls[i] = partDeclToJSON(p)
	}

	for i, p := range declarations.ParaDecl {
		declarationsJSON.ParagraphDecls[i] = paragraphDeclToJSON(p)
	}

	for i, p := range declarations.LinkDecl {
		declarationsJSON.LinkDecls[i] = linkDeclToJSON(p)
	}

	return declarationsJSON
}

func propDeclToJSON(propDecl PropertyDeclXML) PropDeclJSON {
	propDeclJSON := PropDeclJSON{
		RequiredClass: propDecl.RequiredClass,
		Context:       propDecl.Context,
		Regex:         propDecl.Regex,
		Singleton:     propDecl.Singleton != nil,
		Required:      propDecl.Required != nil,
		Identifier:    propDecl.Identifier != nil,
		Values:        make([]ValueJSON, len(propDecl.Value)),
	}

	for i, value := range propDecl.Value {
		propDeclJSON.Values[i] = ValueJSON{
			Autonum: value.Autonum,
			Value:   value.Value,
			Inherit: make([]InheritJSON, len(value.Inherit)),
		}

		// Need to figure out what to do with an empty <inherit/> element

		for ii, inherit := range value.Inherit {
			propDeclJSON.Values[i].Inherit[ii] = InheritJSON{
				From:  inherit.From,
				Value: inherit.Value,
			}
		}
	}

	return propDeclJSON
}

func partDeclToJSON(partDecl PartDeclXML) PartDeclJSON {
	return PartDeclJSON{
		RequiredClass: partDecl.RequiredClass,
		Context:       partDecl.Context,
		Singleton:     partDecl.Singleton != nil,
		Required:      partDecl.Required != nil,
	}
}

func paragraphDeclToJSON(paragraphDecl ParaDeclXML) ParagraphDeclJSON {
	return ParagraphDeclJSON{
		RequiredClass: paragraphDecl.RequiredClass,
		Context:       paragraphDecl.Context,
		Singleton:     paragraphDecl.Singleton != nil,
		Required:      paragraphDecl.Required != nil,
	}
}

func linkDeclToJSON(linkDecl LinkDeclXML) LinkDeclJSON {
	return LinkDeclJSON{
		Rel:       linkDecl.Rel,
		Context:   linkDecl.Context,
		Singleton: linkDecl.Singleton != nil,
		Required:  linkDecl.Required != nil,
	}
}
