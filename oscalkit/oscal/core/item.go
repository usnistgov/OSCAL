package core

// Item ...
type Item struct {
	ItemJSON
	ItemXML
}

// ItemJSON ...
type ItemJSON struct {
	ID            string      `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string      `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string      `json:"title" yaml:"title"`
	Params        []ParamJSON `json:"params,omitempty" yaml:"params,omitempty"`
	Props         []PropJSON  `json:"props,omitempty" yaml:"props,omitempty"`
	Links         []LinkJSON  `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []ProseJSON `json:"prose,omitempty" yaml:"prose,omitempty"`
	Parts         []PartJSON  `json:"parts,omitempty" yaml:"parts,omitempty"`
	Items         []ItemJSON  `json:"components,omitempty" yaml:"components,omitempty"`
}

// ItemXML ...
type ItemXML struct {
	ID            string     `xml:"id,attr"`
	OptionalClass string     `xml:"class,attr"`
	Title         string     `xml:"title"`
	Param         []ParamXML `xml:"param"`
	Prop          []PropXML  `xml:"prop"`
	Link          []LinkXML  `xml:"link"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Part []PartXML `xml:"part"`
	Item []ItemXML `xml:"component"`
}

func itemToJSON(item ItemXML) ItemJSON {
	itemJSON := ItemJSON{
		ID:            item.ID,
		OptionalClass: item.OptionalClass,
		Title:         item.Title,
		Params:        make([]ParamJSON, len(item.Param)),
		Props:         make([]PropJSON, len(item.Prop)),
		Parts:         make([]PartJSON, len(item.Part)),
		Links:         make([]LinkJSON, len(item.Link)),
		Prose:         make([]ProseJSON, len(item.P)),
		Items:         make([]ItemJSON, len(item.Item)),
	}

	for i, p := range item.Param {
		itemJSON.Params[i] = paramToJSON(p)
	}
	for i, p := range item.Prop {
		itemJSON.Props[i] = propToJSON(p)
	}
	for i, p := range item.Part {
		itemJSON.Parts[i] = partToJSON(p)
	}
	for i, l := range item.Link {
		itemJSON.Links[i] = linkToJSON(l)
	}
	for i, p := range item.P {
		itemJSON.Prose[i] = proseToJSON(p)
	}
	for ii, i := range item.Item {
		itemJSON.Items[ii] = itemToJSON(i)
	}

	return itemJSON
}
