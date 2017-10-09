package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// SubcontrolToJSON ...
func SubcontrolToJSON(subcontrol core.SubcontrolXML) core.SubcontrolJSON {
	subcontrolJSON := core.SubcontrolJSON{
		ID:            subcontrol.ID,
		OptionalClass: subcontrol.OptionalClass,
		Title:         subcontrol.Title,
		Params:        make([]core.ParamJSON, len(subcontrol.Param)),
		Props:         make([]core.PropJSON, len(subcontrol.Prop)),
		Parts:         make([]core.PartJSON, len(subcontrol.Part)),
		Links:         make([]core.LinkJSON, len(subcontrol.Link)),
		Prose:         make([]core.ProseJSON, len(subcontrol.P)),
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
