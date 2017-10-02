package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// PropToJSON ...
func PropToJSON(prop xmltypes.Prop) jsontypes.Prop {
	return jsontypes.Prop(prop)
}
