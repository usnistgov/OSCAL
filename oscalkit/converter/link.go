package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// LinkToJSON ...
func LinkToJSON(link xmltypes.Link) jsontypes.Link {
	return jsontypes.Link(link)
}
