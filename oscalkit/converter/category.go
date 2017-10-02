package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// CategoryToJSON ...
func CategoryToJSON(category xmltypes.Category) jsontypes.Category {
	categoryJSON := jsontypes.Category{
		ID:            category.ID,
		OptionalClass: category.OptionalClass,
		Title:         category.Title,
		Props:         make([]jsontypes.Prop, len(category.Prop)),
		Links:         make([]jsontypes.Link, len(category.Link)),
		Prose:         make([]jsontypes.Prose, len(category.P)),
		Categories:    make([]jsontypes.Category, len(category.Category)),
		Items:         make([]jsontypes.Item, len(category.Item)),
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
