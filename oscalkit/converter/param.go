package converter

import "github.com/usnistgov/OSCAL/oscalkit/oscal/core"

// ParamToJSON ...
func ParamToJSON(param core.ParamXML) core.ParamJSON {
	return core.ParamJSON{
		ID:            param.ID,
		OptionalClass: param.OptionalClass,
		Description:   param.Desc,
		Value:         param.ParamValue,
	}
}
