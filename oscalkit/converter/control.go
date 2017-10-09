package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// ControlToJSON ...
func ControlToJSON(control core.ControlXML) core.ControlJSON {
	controlJSON := core.ControlJSON{
		ID:            control.ID,
		OptionalClass: control.OptionalClass,
		Title:         control.Title,
		Params:        make([]core.ParamJSON, len(control.Param)),
		Props:         make([]core.PropJSON, len(control.Prop)),
		Parts:         make([]core.PartJSON, len(control.Part)),
		Links:         make([]core.LinkJSON, len(control.Link)),
		Prose:         make([]core.ProseJSON, len(control.P)),
		Subcontrols:   make([]core.SubcontrolJSON, len(control.Subcontrol)),
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
