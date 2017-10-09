package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// GroupToJSON ...
func GroupToJSON(group core.GroupXML) core.GroupJSON {
	groupJSON := core.GroupJSON{
		ID:            group.ID,
		OptionalClass: group.OptionalClass,
		Title:         group.Title,
		Props:         make([]core.PropJSON, len(group.Prop)),
		Parts:         make([]core.PartJSON, len(group.Part)),
		Prose:         make([]core.ProseJSON, len(group.P)),
		Groups:        make([]core.GroupJSON, len(group.Group)),
		Controls:      make([]core.ControlJSON, len(group.Control)),
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
