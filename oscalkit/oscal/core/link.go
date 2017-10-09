package core

// Link ...
type Link struct {
	LinkJSON
	LinkXML
}

// LinkJSON ...
type LinkJSON struct {
	Rel   string `json:"rel,omitempty"  yaml:"rel,omitempty"`
	Href  string `json:"href" yaml:"href"`
	Value string `json:"value,omitempty" yaml:"value,omitempty"`
}

// LinkXML ...
type LinkXML struct {
	Rel   string `xml:"rel,attr"`
	Href  string `xml:"href,attr"`
	Value string `xml:",chardata"`
}

func linkToJSON(link LinkXML) LinkJSON {
	return LinkJSON(link)
}
