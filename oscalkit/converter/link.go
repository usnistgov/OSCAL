package converter

import "github.com/usnistgov/OSCAL/oscalkit/oscal/core"

// LinkToJSON ...
func LinkToJSON(link core.LinkXML) core.LinkJSON {
	return core.LinkJSON(link)
}
