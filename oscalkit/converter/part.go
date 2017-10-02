package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// PartToJSON ...
func PartToJSON(part xmltypes.Part) jsontypes.Part {
	partJSON := jsontypes.Part{
		ID:            part.ID,
		OptionalClass: part.OptionalClass,
		Title:         part.Title,
		Params:        make([]jsontypes.CoreParam, len(part.Param)),
		Props:         make([]jsontypes.Prop, len(part.Prop)),
		Parts:         make([]jsontypes.Part, len(part.Part)),
		Links:         make([]jsontypes.Link, len(part.Link)),
		Prose:         make([]jsontypes.Prose, len(part.P)),
	}

	for i, p := range part.Param {
		partJSON.Params[i] = ParamToJSON(p)
	}
	for i, p := range part.Prop {
		partJSON.Props[i] = PropToJSON(p)
	}
	for i, p := range part.Part {
		partJSON.Parts[i] = PartToJSON(p)
	}
	for i, l := range part.Link {
		partJSON.Links[i] = LinkToJSON(l)
	}
	for i, p := range part.P {
		partJSON.Prose[i] = ProseToJSON(p)
	}

	return partJSON
}
