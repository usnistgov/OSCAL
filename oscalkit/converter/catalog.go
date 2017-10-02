package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// CatalogToJSON ...
func CatalogToJSON(catalog *xmltypes.Catalog) *jsontypes.Catalog {
	if catalog == nil {
		return nil
	}

	catalogJSON := &jsontypes.Catalog{
		Title:        catalog.Title,
		Declarations: DeclarationsToJSON(catalog.Declarations),
		Sections:     make([]jsontypes.Section, len(catalog.Section)),
		Groups:       make([]jsontypes.Group, len(catalog.Group)),
		Controls:     make([]jsontypes.Control, len(catalog.Control)),
		References:   ReferencesToJSON(catalog.References),
	}

	for i, s := range catalog.Section {
		catalogJSON.Sections[i] = SectionToJSON(s)
	}
	for i, g := range catalog.Group {
		catalogJSON.Groups[i] = GroupToJSON(g)
	}
	for i, c := range catalog.Control {
		catalogJSON.Controls[i] = ControlToJSON(c)
	}

	return catalogJSON
}
