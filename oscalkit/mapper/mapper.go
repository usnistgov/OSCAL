package mapper

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal"
)

// Mapper ...
type Mapper interface {
	// Map returns an OSCAL-formatted mapping between two OSCAL components
	Map(to oscal.OSCAL) oscal.OSCAL
}
