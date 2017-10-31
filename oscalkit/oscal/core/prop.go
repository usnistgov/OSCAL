package core

// Prop ...
type Prop struct {
	PropJSON
	PropXML
}

// PropJSON ...
type PropJSON struct {
	RequiredClass string `json:"class,omitempty" yaml:"class,omitempty"`
	Value         string `json:"value,omitempty" yaml:"value,omitempty"`
}

// PropXML ...
type PropXML struct {
	RequiredClass string `xml:"class,attr"`
	Value         string `xml:",chardata"`
}

func propToJSON(prop PropXML) PropJSON {
	return PropJSON(prop)
}
