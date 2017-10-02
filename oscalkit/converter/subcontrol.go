package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// SubcontrolToJSON ...
func SubcontrolToJSON(subcontrol xmltypes.Subcontrol) jsontypes.Subcontrol {
	subcontrolJSON := jsontypes.Subcontrol{
		ID:            subcontrol.ID,
		OptionalClass: subcontrol.OptionalClass,
		Title:         subcontrol.Title,
		Params:        make([]jsontypes.CoreParam, len(subcontrol.Param)),
		Props:         make([]jsontypes.Prop, len(subcontrol.Prop)),
		Parts:         make([]jsontypes.Part, len(subcontrol.Part)),
		Links:         make([]jsontypes.Link, len(subcontrol.Link)),
		Prose:         make([]jsontypes.Prose, len(subcontrol.P)),
		References:    ReferencesToJSON(subcontrol.References),
	}

	for i, p := range subcontrol.Param {
		subcontrolJSON.Params[i] = ParamToJSON(p)
	}
	for i, p := range subcontrol.Prop {
		subcontrolJSON.Props[i] = PropToJSON(p)
	}
	for i, p := range subcontrol.Part {
		subcontrolJSON.Parts[i] = PartToJSON(p)
	}
	for i, l := range subcontrol.Link {
		subcontrolJSON.Links[i] = LinkToJSON(l)
	}
	for i, p := range subcontrol.P {
		subcontrolJSON.Prose[i] = ProseToJSON(p)
	}

	return subcontrolJSON
}
