package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// ReferencesToJSON ...
func ReferencesToJSON(references *xmltypes.References) []jsontypes.Reference {
	if references == nil {
		return nil
	}

	referencesJSON := make([]jsontypes.Reference, len(references.Ref))

	for r, ref := range references.Ref {
		referencesJSON[r] = jsontypes.Reference{
			ID:        ref.ID,
			Standards: make([]jsontypes.Standard, len(ref.Std)),
			Citations: make([]jsontypes.Citation, len(ref.Citation)),
		}

		for s, standard := range ref.Std {
			referencesJSON[r].Standards[s] = jsontypes.Standard{
				Href:  standard.Href,
				Value: standard.Value,
			}
		}

		for c, citation := range ref.Citation {
			referencesJSON[r].Citations[c] = jsontypes.Citation{
				Href:  citation.Href,
				Value: citation.Value,
			}
		}
	}

	return referencesJSON
}
