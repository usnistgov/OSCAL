package core

// Param ...
type Param struct {
	ParamJSON
	ParamXML
}

// ParamJSON ...
type ParamJSON struct {
	ID            string `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string `json:"class,omitempty" yaml:"class,omitempty"`
	Description   string `json:"description" yaml:"description"`
	Value         string `json:"value" yaml:"value"`
}

// ParamXML ...
type ParamXML struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`
	Desc          string `xml:"desc"`
	ParamValue    string `xml:"value"`
}

func paramToJSON(param ParamXML) ParamJSON {
	return ParamJSON{
		ID:            param.ID,
		OptionalClass: param.OptionalClass,
		Description:   param.Desc,
		Value:         param.ParamValue,
	}
}
