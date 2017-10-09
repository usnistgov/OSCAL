package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// CatalogToJSON ...
func CatalogToJSON(catalog *core.CatalogXML) *core.CatalogJSON {
	if catalog == nil {
		return nil
	}

	catalogJSON := &core.CatalogJSON{
		Title:        catalog.Title,
		Declarations: DeclarationsToJSON(catalog.Declarations),
		Sections:     make([]core.SectionJSON, len(catalog.Section)),
		Groups:       make([]core.GroupJSON, len(catalog.Group)),
		Controls:     make([]core.ControlJSON, len(catalog.Control)),
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
