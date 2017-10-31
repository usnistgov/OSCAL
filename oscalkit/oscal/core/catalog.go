package core

import (
	"encoding/json"
	"encoding/xml"

	yaml "gopkg.in/yaml.v2"
)

// Catalog ...
type Catalog struct {
	*CatalogJSON
	*CatalogXML
}

// CatalogJSON ...
type CatalogJSON struct {
	Title        string            `json:"title" yaml:"title"`
	Declarations *DeclarationsJSON `json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Sections     []SectionJSON     `json:"sections,omitempty" yaml:"sections,omitempty"`
	Groups       []GroupJSON       `json:"groups,omitempty" yaml:"groups,omitempty"`
	Controls     []ControlJSON     `json:"controls,omitempty" yaml:"controls,omitempty"`
	References   []ReferenceJSON   `json:"references,omitempty" yaml:"references,omitempty"`
}

// CatalogXML ...
type CatalogXML struct {
	XMLName      xml.Name         `xml:"http://csrc.nist.gov/ns/oscal/1.0 catalog"`
	Title        string           `xml:"title"`
	Declarations *DeclarationsXML `xml:"declarations,omitempty"`
	Section      []SectionXML     `xml:"section"`
	Group        []GroupXML       `xml:"group"`
	Control      []ControlXML     `xml:"control"`
	References   *ReferencesXML   `xml:"references,omitempty"`
}

// Component ...
func (c *Catalog) Component() string {
	return "profile"
}

// RawJSON ...
func (c *Catalog) RawJSON(prettify bool) ([]byte, error) {
	c.CatalogJSON = catalogToJSON(c.CatalogXML)

	if prettify {
		return json.MarshalIndent(c.CatalogJSON, "", "  ")
	}

	return json.Marshal(c.CatalogJSON)
}

// RawYAML ...
func (c *Catalog) RawYAML() ([]byte, error) {
	c.CatalogJSON = catalogToJSON(c.CatalogXML)

	return yaml.Marshal(c.CatalogJSON)
}

// RawXML ...
func (c *Catalog) RawXML() ([]byte, error) {
	return nil, nil
}

// JSONType ...
func (c *Catalog) JSONType() interface{} {
	return c.CatalogJSON
}

// XMLType ...
func (c *Catalog) XMLType() interface{} {
	return c.CatalogXML
}

func catalogToJSON(catalog *CatalogXML) *CatalogJSON {
	if catalog == nil {
		return nil
	}

	catalogJSON := &CatalogJSON{
		Title:        catalog.Title,
		Declarations: declarationsToJSON(catalog.Declarations),
		Sections:     make([]SectionJSON, len(catalog.Section)),
		Groups:       make([]GroupJSON, len(catalog.Group)),
		Controls:     make([]ControlJSON, len(catalog.Control)),
		References:   referencesToJSON(catalog.References),
	}

	for i, s := range catalog.Section {
		catalogJSON.Sections[i] = sectionToJSON(s)
	}
	for i, g := range catalog.Group {
		catalogJSON.Groups[i] = groupToJSON(g)
	}
	for i, c := range catalog.Control {
		catalogJSON.Controls[i] = controlToJSON(c)
	}

	return catalogJSON
}
