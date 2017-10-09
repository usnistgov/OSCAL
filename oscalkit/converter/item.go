package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// ItemToJSON ...
func ItemToJSON(item core.ItemXML) core.ItemJSON {
	itemJSON := core.ItemJSON{
		ID:            item.ID,
		OptionalClass: item.OptionalClass,
		Title:         item.Title,
		Params:        make([]core.ParamJSON, len(item.Param)),
		Props:         make([]core.PropJSON, len(item.Prop)),
		Parts:         make([]core.PartJSON, len(item.Part)),
		Links:         make([]core.LinkJSON, len(item.Link)),
		Prose:         make([]core.ProseJSON, len(item.P)),
		Items:         make([]core.ItemJSON, len(item.Item)),
	}

	for i, p := range item.Param {
		itemJSON.Params[i] = ParamToJSON(p)
	}
	for i, p := range item.Prop {
		itemJSON.Props[i] = PropToJSON(p)
	}
	for i, p := range item.Part {
		itemJSON.Parts[i] = PartToJSON(p)
	}
	for i, l := range item.Link {
		itemJSON.Links[i] = LinkToJSON(l)
	}
	for i, p := range item.P {
		itemJSON.Prose[i] = ProseToJSON(p)
	}
	for ii, i := range item.Item {
		itemJSON.Items[ii] = ItemToJSON(i)
	}

	return itemJSON
}
