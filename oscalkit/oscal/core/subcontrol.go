package core

// Subcontrol ...
type Subcontrol struct {
	SubcontrolJSON
	SubcontrolXML
}

// SubcontrolJSON ...
type SubcontrolJSON struct {
	ID            string          `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string          `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string          `json:"title" yaml:"title"`
	Params        []ParamJSON     `json:"params,omitempty" yaml:"params,omitempty"`
	Props         []PropJSON      `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []PartJSON      `json:"parts,omitempty" yaml:"parts,omitempty"`
	Links         []LinkJSON      `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []ProseJSON     `json:"prose,omitempty" yaml:"prose,omitempty"`
	References    []ReferenceJSON `json:"references,omitempty" yaml:"references,omitempty"`
}

// SubcontrolXML ...
type SubcontrolXML struct {
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

	Param      []ParamXML     `xml:"param"`
	References *ReferencesXML `xml:"references,omitempty"`
}

func subcontrolToJSON(subcontrol SubcontrolXML) SubcontrolJSON {
	subcontrolJSON := SubcontrolJSON{
		ID:            subcontrol.ID,
		OptionalClass: subcontrol.OptionalClass,
		Title:         subcontrol.Title,
		Params:        make([]ParamJSON, len(subcontrol.Param)),
		Props:         make([]PropJSON, len(subcontrol.Prop)),
		Parts:         make([]PartJSON, len(subcontrol.Part)),
		Links:         make([]LinkJSON, len(subcontrol.Link)),
		Prose:         make([]ProseJSON, len(subcontrol.P)),
		References:    referencesToJSON(subcontrol.References),
	}

	for i, p := range subcontrol.Param {
		subcontrolJSON.Params[i] = paramToJSON(p)
	}
	for i, p := range subcontrol.Prop {
		subcontrolJSON.Props[i] = propToJSON(p)
	}
	for i, p := range subcontrol.Part {
		subcontrolJSON.Parts[i] = partToJSON(p)
	}
	for i, l := range subcontrol.Link {
		subcontrolJSON.Links[i] = linkToJSON(l)
	}
	for i, p := range subcontrol.P {
		subcontrolJSON.Prose[i] = proseToJSON(p)
	}

	return subcontrolJSON
}
