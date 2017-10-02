package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// SectionToJSON ...
func SectionToJSON(section xmltypes.Section) jsontypes.Section {
	sectionJSON := jsontypes.Section{
		ID:            section.ID,
		OptionalClass: section.OptionalClass,
		Title:         section.Title,
		Prose:         make([]jsontypes.Prose, len(section.P)),
		Sections:      make([]jsontypes.Section, len(section.Section)),
		Groups:        make([]jsontypes.Group, len(section.Group)),
		References:    ReferencesToJSON(section.References),
	}

	for i, p := range section.P {
		sectionJSON.Prose[i] = ProseToJSON(p)
	}
	for i, s := range section.Section {
		sectionJSON.Sections[i] = SectionToJSON(s)
	}
	for i, g := range section.Group {
		sectionJSON.Groups[i] = GroupToJSON(g)
	}

	return sectionJSON
}
