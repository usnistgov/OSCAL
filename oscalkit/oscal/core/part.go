package core

// Part ...
type Part struct {
	PartJSON
	PartXML
}

// PartJSON ...
type PartJSON struct {
	ID            string      `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string      `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string      `json:"title,omitempty" yaml:"title,omitempty"`
	Props         []PropJSON  `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []PartJSON  `json:"parts,omitempty" yaml:"parts,omitempty"`
	Links         []LinkJSON  `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []ProseJSON `json:"prose,omitempty" yaml:"prose,omitempty"`
	Params        []ParamJSON `json:"params,omitempty" yaml:"params,omitempty"`
}

// PartXML ...
type PartXML struct {
	ID            string    `xml:"id,attr"`
	OptionalClass string    `xml:"class,atr"`
	Title         string    `xml:"title"`
	Prop          []PropXML `xml:"prop"`
	Part          []PartXML `xml:"part"`
	Link          []LinkXML `xml:"link"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Param []ParamXML `xml:"param"`
}

func partToJSON(part PartXML) PartJSON {
	partJSON := PartJSON{
		ID:            part.ID,
		OptionalClass: part.OptionalClass,
		Title:         part.Title,
		Params:        make([]ParamJSON, len(part.Param)),
		Props:         make([]PropJSON, len(part.Prop)),
		Parts:         make([]PartJSON, len(part.Part)),
		Links:         make([]LinkJSON, len(part.Link)),
		Prose:         make([]ProseJSON, len(part.P)),
	}

	for i, p := range part.Param {
		partJSON.Params[i] = paramToJSON(p)
	}
	for i, p := range part.Prop {
		partJSON.Props[i] = propToJSON(p)
	}
	for i, p := range part.Part {
		partJSON.Parts[i] = partToJSON(p)
	}
	for i, l := range part.Link {
		partJSON.Links[i] = linkToJSON(l)
	}
	for i, p := range part.P {
		partJSON.Prose[i] = proseToJSON(p)
	}

	return partJSON
}
