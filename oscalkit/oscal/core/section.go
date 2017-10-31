package core

// Section ...
type Section struct {
	SectionJSON
	SectionXML
}

// SectionJSON ...
type SectionJSON struct {
	ID            string          `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string          `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string          `json:"title" yaml:"title"`
	Prose         []ProseJSON     `json:"prose,omitempty" yaml:"prose,omitempty"`
	Sections      []SectionJSON   `json:"sections,omitempty" yaml:"sections,omitempty"`
	Groups        []GroupJSON     `json:"groups,omitempty" yaml:"groups,omitempty"`
	References    []ReferenceJSON `json:"references,omitempty" yaml:"references,omitempty"`
}

// SectionXML ...
type SectionXML struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`
	Title         string `xml:"title"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Section    []SectionXML   `xml:"section"`
	Group      []GroupXML     `xml:"group"`
	References *ReferencesXML `xml:"references,omitempty"`
}

func sectionToJSON(section SectionXML) SectionJSON {
	sectionJSON := SectionJSON{
		ID:            section.ID,
		OptionalClass: section.OptionalClass,
		Title:         section.Title,
		Prose:         make([]ProseJSON, len(section.P)),
		Sections:      make([]SectionJSON, len(section.Section)),
		Groups:        make([]GroupJSON, len(section.Group)),
		References:    referencesToJSON(section.References),
	}

	for i, p := range section.P {
		sectionJSON.Prose[i] = proseToJSON(p)
	}
	for i, s := range section.Section {
		sectionJSON.Sections[i] = sectionToJSON(s)
	}
	for i, g := range section.Group {
		sectionJSON.Groups[i] = groupToJSON(g)
	}

	return sectionJSON
}
