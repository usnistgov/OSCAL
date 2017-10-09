package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// PartToJSON ...
func PartToJSON(part core.PartXML) core.PartJSON {
	partJSON := core.PartJSON{
		ID:            part.ID,
		OptionalClass: part.OptionalClass,
		Title:         part.Title,
		Params:        make([]core.ParamJSON, len(part.Param)),
		Props:         make([]core.PropJSON, len(part.Prop)),
		Parts:         make([]core.PartJSON, len(part.Part)),
		Links:         make([]core.LinkJSON, len(part.Link)),
		Prose:         make([]core.ProseJSON, len(part.P)),
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
