package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// ReferencesToJSON ...
func ReferencesToJSON(references *core.ReferencesXML) []core.ReferenceJSON {
	if references == nil {
		return nil
	}

	referencesJSON := make([]core.ReferenceJSON, len(references.Ref))

	for r, ref := range references.Ref {
		referencesJSON[r] = core.ReferenceJSON{
			ID:        ref.ID,
			Standards: make([]core.StandardJSON, len(ref.Std)),
			Citations: make([]core.CitationJSON, len(ref.Citation)),
		}

		for s, standard := range ref.Std {
			referencesJSON[r].Standards[s] = core.StandardJSON(standard)
		}

		for c, citation := range ref.Citation {
			referencesJSON[r].Citations[c] = core.CitationJSON(citation)
		}
	}

	return referencesJSON
}
