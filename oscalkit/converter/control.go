package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// ControlToJSON ...
func ControlToJSON(control xmltypes.Control) jsontypes.Control {
	controlJSON := jsontypes.Control{
		ID:            control.ID,
		OptionalClass: control.OptionalClass,
		Title:         control.Title,
		Params:        make([]jsontypes.CoreParam, len(control.Param)),
		Props:         make([]jsontypes.Prop, len(control.Prop)),
		Parts:         make([]jsontypes.Part, len(control.Part)),
		Links:         make([]jsontypes.Link, len(control.Link)),
		Prose:         make([]jsontypes.Prose, len(control.P)),
		Subcontrols:   make([]jsontypes.Subcontrol, len(control.Subcontrol)),
		References:    ReferencesToJSON(control.References),
	}

	for i, p := range control.Param {
		controlJSON.Params[i] = ParamToJSON(p)
	}
	for i, p := range control.Prop {
		controlJSON.Props[i] = PropToJSON(p)
	}
	for i, p := range control.Part {
		controlJSON.Parts[i] = PartToJSON(p)
	}
	for i, l := range control.Link {
		controlJSON.Links[i] = LinkToJSON(l)
	}
	for i, p := range control.P {
		controlJSON.Prose[i] = ProseToJSON(p)
	}
	for i, s := range control.Subcontrol {
		controlJSON.Subcontrols[i] = SubcontrolToJSON(s)
	}

	return controlJSON
}
