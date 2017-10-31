package core

// Group ...
type Group struct {
	GroupJSON
	GroupXML
}

// GroupJSON ...
type GroupJSON struct {
	ID            string          `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string          `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string          `json:"title" yaml:"title"`
	Props         []PropJSON      `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []PartJSON      `json:"parts,omitempty" yaml:"parts,omitempty"`
	Prose         []ProseJSON     `json:"prose,omitempty" yaml:"prose,omitempty"`
	Groups        []GroupJSON     `json:"groups,omitempty" yaml:"groups,omitempty"`
	Controls      []ControlJSON   `json:"controls,omitempty" yaml:"controls,omitempty"`
	References    []ReferenceJSON `json:"references,omitempty" yaml:"references,omitempty"`
}

// GroupXML ...
type GroupXML struct {
	ID            string    `xml:"id,attr"`
	OptionalClass string    `xml:"class,attr"`
	Title         string    `xml:"title"`
	Prop          []PropXML `xml:"prop"`
	Part          []PartXML `xml:"part"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Param      []ParamXML     `xml:"param"`
	Group      []GroupXML     `xml:"group"`
	Control    []ControlXML   `xml:"control"`
	References *ReferencesXML `xml:"references,omitempty"`
}

func groupToJSON(group GroupXML) GroupJSON {
	groupJSON := GroupJSON{
		ID:            group.ID,
		OptionalClass: group.OptionalClass,
		Title:         group.Title,
		Props:         make([]PropJSON, len(group.Prop)),
		Parts:         make([]PartJSON, len(group.Part)),
		Prose:         make([]ProseJSON, len(group.P)),
		Groups:        make([]GroupJSON, len(group.Group)),
		Controls:      make([]ControlJSON, len(group.Control)),
		References:    referencesToJSON(group.References),
	}

	for i, p := range group.Prop {
		groupJSON.Props[i] = propToJSON(p)
	}
	for i, p := range group.Part {
		groupJSON.Parts[i] = partToJSON(p)
	}
	for i, p := range group.P {
		groupJSON.Prose[i] = proseToJSON(p)
	}
	for i, g := range group.Group {
		groupJSON.Groups[i] = groupToJSON(g)
	}
	for i, c := range group.Control {
		groupJSON.Controls[i] = controlToJSON(c)
	}

	return groupJSON
}
