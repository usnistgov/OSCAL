package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// GroupToJSON ...
func GroupToJSON(group xmltypes.Group) jsontypes.Group {
	groupJSON := jsontypes.Group{
		ID:            group.ID,
		OptionalClass: group.OptionalClass,
		Title:         group.Title,
		Props:         make([]jsontypes.Prop, len(group.Prop)),
		Parts:         make([]jsontypes.Part, len(group.Part)),
		Prose:         make([]jsontypes.Prose, len(group.P)),
		Groups:        make([]jsontypes.Group, len(group.Group)),
		Controls:      make([]jsontypes.Control, len(group.Control)),
		References:    ReferencesToJSON(group.References),
	}

	for i, p := range group.Prop {
		groupJSON.Props[i] = PropToJSON(p)
	}
	for i, p := range group.Part {
		groupJSON.Parts[i] = PartToJSON(p)
	}
	for i, p := range group.P {
		groupJSON.Prose[i] = ProseToJSON(p)
	}
	for i, g := range group.Group {
		groupJSON.Groups[i] = GroupToJSON(g)
	}
	for i, c := range group.Control {
		groupJSON.Controls[i] = ControlToJSON(c)
	}

	return groupJSON
}
