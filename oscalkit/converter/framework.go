package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// FrameworkToJSON ...
func FrameworkToJSON(framework *core.FrameworkXML) *core.FrameworkJSON {
	if framework == nil {
		return nil
	}

	frameworkJSON := &core.FrameworkJSON{
		ID:            framework.ID,
		OptionalClass: framework.OptionalClass,
		Title:         framework.Title,
		Declarations:  DeclarationsToJSON(framework.Declarations),
		Sections:      make([]core.SectionJSON, len(framework.Section)),
		Categories:    make([]core.CategoryJSON, len(framework.Category)),
		Items:         make([]core.ItemJSON, len(framework.Item)),
		References:    ReferencesToJSON(framework.References),
	}

	for i, s := range framework.Section {
		frameworkJSON.Sections[i] = SectionToJSON(s)
	}
	for i, c := range framework.Category {
		frameworkJSON.Categories[i] = CategoryToJSON(c)
	}
	for i, item := range framework.Item {
		frameworkJSON.Items[i] = ItemToJSON(item)
	}

	return frameworkJSON
}
