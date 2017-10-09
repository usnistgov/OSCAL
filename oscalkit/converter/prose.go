package converter

import (
	"strings"

	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// ProseToJSON only converts xmltypes.P for now
func ProseToJSON(paragraph core.PXML) core.ProseJSON {
	return core.ProseJSON{
		ID:    paragraph.ID,
		Class: paragraph.OptionalClass,
		Value: strings.TrimSpace(paragraph.Value),
	}
}
