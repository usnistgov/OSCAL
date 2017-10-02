package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// FrameworkToJSON ...
func FrameworkToJSON(framework *xmltypes.Framework) *jsontypes.Framework {
	if framework == nil {
		return nil
	}

	frameworkJSON := &jsontypes.Framework{
		ID:            framework.ID,
		OptionalClass: framework.OptionalClass,
		Title:         framework.Title,
		Declarations:  DeclarationsToJSON(framework.Declarations),
		Sections:      make([]jsontypes.Section, len(framework.Section)),
		Categories:    make([]jsontypes.Category, len(framework.Category)),
		Items:         make([]jsontypes.Item, len(framework.Item)),
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
