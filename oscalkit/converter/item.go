package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// ItemToJSON ...
func ItemToJSON(item xmltypes.Item) jsontypes.Item {
	itemJSON := jsontypes.Item{
		ID:            item.ID,
		OptionalClass: item.OptionalClass,
		Title:         item.Title,
		Params:        make([]jsontypes.CoreParam, len(item.Param)),
		Props:         make([]jsontypes.Prop, len(item.Prop)),
		Parts:         make([]jsontypes.Part, len(item.Part)),
		Links:         make([]jsontypes.Link, len(item.Link)),
		Prose:         make([]jsontypes.Prose, len(item.P)),
		Items:         make([]jsontypes.Item, len(item.Item)),
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
