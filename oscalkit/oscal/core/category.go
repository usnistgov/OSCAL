package core

// Category ...
type Category struct {
	CategoryJSON
	CategoryXML
}

// CategoryJSON ...
type CategoryJSON struct {
	ID            string         `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string         `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string         `json:"title" yaml:"title"`
	Props         []PropJSON     `json:"props,omitempty" yaml:"props,omitempty"`
	Links         []LinkJSON     `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []ProseJSON    `json:"prose,omitempty" yaml:"prose,omitempty"`
	Categories    []CategoryJSON `json:"groups,omitempty" yaml:"groups,omitempty"`
	Items         []ItemJSON     `json:"components,omitempty" yaml:"components,omitempty"`
}

// CategoryXML ...
type CategoryXML struct {
	ID            string    `xml:"id,attr"`
	OptionalClass string    `xml:"class,attr"`
	Title         string    `xml:"title"`
	Prop          []PropXML `xml:"prop"`
	Link          []LinkXML `xml:"link"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Category []CategoryXML `xml:"group"`
	Item     []ItemXML     `xml:"component"`
}

// CategoryToJSON ...
func categoryToJSON(category CategoryXML) CategoryJSON {
	categoryJSON := CategoryJSON{
		ID:            category.ID,
		OptionalClass: category.OptionalClass,
		Title:         category.Title,
		Props:         make([]PropJSON, len(category.Prop)),
		Links:         make([]LinkJSON, len(category.Link)),
		Prose:         make([]ProseJSON, len(category.P)),
		Categories:    make([]CategoryJSON, len(category.Category)),
		Items:         make([]ItemJSON, len(category.Item)),
	}

	for i, p := range category.Prop {
		categoryJSON.Props[i] = propToJSON(p)
	}
	for i, l := range category.Link {
		categoryJSON.Links[i] = linkToJSON(l)
	}
	for i, p := range category.P {
		categoryJSON.Prose[i] = proseToJSON(p)
	}
	for i, categoryXML := range category.Category {
		categoryJSON.Categories[i] = categoryToJSON(categoryXML)
	}

	for i, itemXML := range category.Item {
		categoryJSON.Items[i] = itemToJSON(itemXML)
	}

	return categoryJSON
}
