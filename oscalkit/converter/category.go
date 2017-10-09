package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// CategoryToJSON ...
func CategoryToJSON(category core.CategoryXML) core.CategoryJSON {
	categoryJSON := core.CategoryJSON{
		ID:            category.ID,
		OptionalClass: category.OptionalClass,
		Title:         category.Title,
		Props:         make([]core.PropJSON, len(category.Prop)),
		Links:         make([]core.LinkJSON, len(category.Link)),
		Prose:         make([]core.ProseJSON, len(category.P)),
		Categories:    make([]core.CategoryJSON, len(category.Category)),
		Items:         make([]core.ItemJSON, len(category.Item)),
	}

	for i, p := range category.Prop {
		categoryJSON.Props[i] = PropToJSON(p)
	}
	for i, l := range category.Link {
		categoryJSON.Links[i] = LinkToJSON(l)
	}
	for i, p := range category.P {
		categoryJSON.Prose[i] = ProseToJSON(p)
	}
	for i, categoryXML := range category.Category {
		categoryJSON.Categories[i] = CategoryToJSON(categoryXML)
	}

	for i, itemXML := range category.Item {
		categoryJSON.Items[i] = ItemToJSON(itemXML)
	}

	return categoryJSON
}
