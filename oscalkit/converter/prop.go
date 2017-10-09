package converter

import "github.com/usnistgov/OSCAL/oscalkit/oscal/core"

// PropToJSON ...
func PropToJSON(prop core.PropXML) core.PropJSON {
	return core.PropJSON(prop)
}
