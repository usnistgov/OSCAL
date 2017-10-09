package core

// Control ...
type Control struct {
	ControlJSON
	ControlXML
}

// ControlJSON ...
type ControlJSON struct {
	ID            string           `json:"id" yaml:"id"`
	OptionalClass string           `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string           `json:"title" yaml:"title"`
	Params        []ParamJSON      `json:"params,omitempty" yaml:"params,omitempty"`
	Props         []PropJSON       `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []PartJSON       `json:"parts,omitempty" yaml:"parts,omitempty"`
	Links         []LinkJSON       `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []ProseJSON      `json:"prose,omitempty" yaml:"prose,omitempty"`
	Subcontrols   []SubcontrolJSON `json:"subcontrols,omitempty" yaml:"subcontrols,omitempty"`
	References    []ReferenceJSON  `json:"references,omitempty" yaml:"references,omitempty"`
}

// ControlXML ...
type ControlXML struct {
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

	Param      []ParamXML      `xml:"param"`
	Subcontrol []SubcontrolXML `xml:"subcontrol"`
	References *ReferencesXML  `xml:"references,omitempty"`
}

func controlToJSON(control ControlXML) ControlJSON {
	controlJSON := ControlJSON{
		ID:            control.ID,
		OptionalClass: control.OptionalClass,
		Title:         control.Title,
		Params:        make([]ParamJSON, len(control.Param)),
		Props:         make([]PropJSON, len(control.Prop)),
		Parts:         make([]PartJSON, len(control.Part)),
		Links:         make([]LinkJSON, len(control.Link)),
		Prose:         make([]ProseJSON, len(control.P)),
		Subcontrols:   make([]SubcontrolJSON, len(control.Subcontrol)),
		References:    referencesToJSON(control.References),
	}

	for i, p := range control.Param {
		controlJSON.Params[i] = paramToJSON(p)
	}
	for i, p := range control.Prop {
		controlJSON.Props[i] = propToJSON(p)
	}
	for i, p := range control.Part {
		controlJSON.Parts[i] = partToJSON(p)
	}
	for i, l := range control.Link {
		controlJSON.Links[i] = linkToJSON(l)
	}
	for i, p := range control.P {
		controlJSON.Prose[i] = proseToJSON(p)
	}
	for i, s := range control.Subcontrol {
		controlJSON.Subcontrols[i] = subcontrolToJSON(s)
	}

	return controlJSON
}
