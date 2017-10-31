package core

import (
	"encoding/json"
	"encoding/xml"

	yaml "gopkg.in/yaml.v2"
)

// Framework ...
type Framework struct {
	*FrameworkJSON
	*FrameworkXML
}

// FrameworkJSON ...
type FrameworkJSON struct {
	ID            string            `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string            `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string            `json:"title" yaml:"title"`
	Declarations  *DeclarationsJSON `json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Sections      []SectionJSON     `json:"sections,omitempty" yaml:"sections,omitempty"`
	Categories    []CategoryJSON    `json:"groups,omitempty" yaml:"groups,omitempty"`
	Items         []ItemJSON        `json:"components,omitempty" yaml:"components,omitempty"`
	References    []ReferenceJSON   `json:"references,omitempty" yaml:"references,omitempty"`
}

// FrameworkXML ...
type FrameworkXML struct {
	XMLName       xml.Name         `xml:"http://csrc.nist.gov/ns/oscal/1.0 framework"`
	ID            string           `xml:"id,attr"`
	OptionalClass string           `xml:"class,attr"`
	Title         string           `xml:"title"`
	Declarations  *DeclarationsXML `xml:"declarations,omitempty"`
	Section       []SectionXML     `xml:"section"`
	Category      []CategoryXML    `xml:"group"`
	Item          []ItemXML        `xml:"component"`
	References    *ReferencesXML   `xml:"references,omitempty"`
}

// WorksheetXML ...
type WorksheetXML FrameworkXML

// Component ...
func (f *Framework) Component() string {
	return "framework"
}

// RawJSON ...
func (f *Framework) RawJSON(prettify bool) ([]byte, error) {
	f.FrameworkJSON = frameworkToJSON(f.FrameworkXML)

	if prettify {
		return json.MarshalIndent(f.FrameworkJSON, "", "  ")
	}
	return json.Marshal(f.FrameworkJSON)
}

// RawYAML ...
func (f *Framework) RawYAML() ([]byte, error) {
	f.FrameworkJSON = frameworkToJSON(f.FrameworkXML)

	return yaml.Marshal(f.FrameworkJSON)
}

// RawXML ...
func (f *Framework) RawXML() ([]byte, error) {
	return nil, nil
}

// JSONType ...
func (f *Framework) JSONType() interface{} {
	return f.FrameworkJSON
}

// XMLType ...
func (f *Framework) XMLType() interface{} {
	return f.FrameworkXML
}

func frameworkToJSON(framework *FrameworkXML) *FrameworkJSON {
	if framework == nil {
		return nil
	}

	frameworkJSON := &FrameworkJSON{
		ID:            framework.ID,
		OptionalClass: framework.OptionalClass,
		Title:         framework.Title,
		Declarations:  declarationsToJSON(framework.Declarations),
		Sections:      make([]SectionJSON, len(framework.Section)),
		Categories:    make([]CategoryJSON, len(framework.Category)),
		Items:         make([]ItemJSON, len(framework.Item)),
		References:    referencesToJSON(framework.References),
	}

	for i, s := range framework.Section {
		frameworkJSON.Sections[i] = sectionToJSON(s)
	}
	for i, c := range framework.Category {
		frameworkJSON.Categories[i] = categoryToJSON(c)
	}
	for i, item := range framework.Item {
		frameworkJSON.Items[i] = itemToJSON(item)
	}

	return frameworkJSON
}
