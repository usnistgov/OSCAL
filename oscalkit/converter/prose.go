package converter

import (
	"strings"

	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// ProseToJSON only converts xmltypes.P for now
func ProseToJSON(paragraph xmltypes.P) jsontypes.Prose {
	return jsontypes.Prose{
		ID:    paragraph.ID,
		Class: paragraph.OptionalClass,
		Value: strings.TrimSpace(paragraph.Value),
	}
}
