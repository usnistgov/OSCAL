package core

// References ...
type References struct {
	ReferencesXML
	ReferencesJSON []ReferenceJSON
}

// ReferenceJSON ...
type ReferenceJSON struct {
	ID        string         `json:"id" yaml:"id"`
	Standards []StandardJSON `json:"standards,omitempty" yaml:"standards,omitempty"`
	Citations []CitationJSON `json:"citations,omitempty" yaml:"citations,omitempty"`
	Prose     []ProseJSON    `json:"prose,omitempty" yaml:"prose,omitempty"`
}

// StandardJSON ...
type StandardJSON struct {
	Href  string `json:"href" yaml:"href"`
	Value string `json:"value" yaml:"value"`
}

// CitationJSON ...
type CitationJSON struct {
	Href  string `json:"href" yaml:"href"`
	Value string `json:"value" yaml:"value"`
}

// ReferencesXML ...
type ReferencesXML struct {
	Ref []RefXML `xml:"ref"`
}

// RefXML ...
type RefXML struct {
	ID       string        `xml:"id,attr"`
	Std      []StdXML      `xml:"std"`
	Citation []CitationXML `xml:"citation"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`
}

// StdXML ...
type StdXML struct {
	Href  string `xml:"href,attr"`
	Value string `xml:",chardata"`
}

// CitationXML ...
type CitationXML struct {
	Href  string `xml:"href,attr"`
	Value string `xml:",chardata"`
}

func referencesToJSON(references *ReferencesXML) []ReferenceJSON {
	if references == nil {
		return nil
	}

	referencesJSON := make([]ReferenceJSON, len(references.Ref))

	for r, ref := range references.Ref {
		referencesJSON[r] = ReferenceJSON{
			ID:        ref.ID,
			Standards: make([]StandardJSON, len(ref.Std)),
			Citations: make([]CitationJSON, len(ref.Citation)),
		}

		for s, standard := range ref.Std {
			referencesJSON[r].Standards[s] = StandardJSON(standard)
		}

		for c, citation := range ref.Citation {
			referencesJSON[r].Citations[c] = CitationJSON(citation)
		}
	}

	return referencesJSON
}
