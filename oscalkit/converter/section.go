package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// SectionToJSON ...
func SectionToJSON(section core.SectionXML) core.SectionJSON {
	sectionJSON := core.SectionJSON{
		ID:            section.ID,
		OptionalClass: section.OptionalClass,
		Title:         section.Title,
		Prose:         make([]core.ProseJSON, len(section.P)),
		Sections:      make([]core.SectionJSON, len(section.Section)),
		Groups:        make([]core.GroupJSON, len(section.Group)),
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
