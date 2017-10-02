package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// ParamToJSON ...
func ParamToJSON(param xmltypes.CoreParam) jsontypes.CoreParam {
	return jsontypes.CoreParam{
		ID:            param.ID,
		OptionalClass: param.OptionalClass,
		Description:   param.Desc,
		Value:         param.ParamValue,
	}
}
