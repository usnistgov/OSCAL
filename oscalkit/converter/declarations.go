package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
)

// DeclarationsToJSON ...
func DeclarationsToJSON(declarations *core.DeclarationsXML) *core.DeclarationsJSON {
	if declarations == nil {
		return nil
	}

	declarationsJSON := &core.DeclarationsJSON{
		Href:           declarations.Href,
		PropDecls:      make([]core.PropDeclJSON, len(declarations.PropertyDecl)),
		PartDecls:      make([]core.PartDeclJSON, len(declarations.PartDecl)),
		ParagraphDecls: make([]core.ParagraphDeclJSON, len(declarations.ParaDecl)),
		LinkDecls:      make([]core.LinkDeclJSON, len(declarations.LinkDecl)),
	}

	for i, p := range declarations.PropertyDecl {
		declarationsJSON.PropDecls[i] = PropDeclToJSON(p)
	}

	for i, p := range declarations.PartDecl {
		declarationsJSON.PartDecls[i] = PartDeclToJSON(p)
	}

	for i, p := range declarations.ParaDecl {
		declarationsJSON.ParagraphDecls[i] = ParagraphDeclToJSON(p)
	}

	for i, p := range declarations.LinkDecl {
		declarationsJSON.LinkDecls[i] = LinkDeclToJSON(p)
	}

	return declarationsJSON
}

// PropDeclToJSON ...
func PropDeclToJSON(propDecl core.PropertyDeclXML) core.PropDeclJSON {
	propDeclJSON := core.PropDeclJSON{
		RequiredClass: propDecl.RequiredClass,
		Context:       propDecl.Context,
		Regex:         propDecl.Regex,
		Singleton:     propDecl.Singleton != nil,
		Required:      propDecl.Required != nil,
		Identifier:    propDecl.Identifier != nil,
		Values:        make([]core.ValueJSON, len(propDecl.Value)),
	}

	for i, value := range propDecl.Value {
		propDeclJSON.Values[i] = core.ValueJSON{
			Autonum: value.Autonum,
			Value:   value.Value,
			Inherit: make([]core.InheritJSON, len(value.Inherit)),
		}

		// Need to figure out what to do with an empty <inherit/> element

		for ii, inherit := range value.Inherit {
			propDeclJSON.Values[i].Inherit[ii] = core.InheritJSON{
				From:  inherit.From,
				Value: inherit.Value,
			}
		}
	}

	return propDeclJSON
}

// PartDeclToJSON ...
func PartDeclToJSON(partDecl core.PartDeclXML) core.PartDeclJSON {
	return core.PartDeclJSON{
		RequiredClass: partDecl.RequiredClass,
		Context:       partDecl.Context,
		Singleton:     partDecl.Singleton != nil,
		Required:      partDecl.Required != nil,
	}
}

// ParagraphDeclToJSON ...
func ParagraphDeclToJSON(paragraphDecl core.ParaDeclXML) core.ParagraphDeclJSON {
	return core.ParagraphDeclJSON{
		RequiredClass: paragraphDecl.RequiredClass,
		Context:       paragraphDecl.Context,
		Singleton:     paragraphDecl.Singleton != nil,
		Required:      paragraphDecl.Required != nil,
	}
}

// LinkDeclToJSON ...
func LinkDeclToJSON(linkDecl core.LinkDeclXML) core.LinkDeclJSON {
	return core.LinkDeclJSON{
		Rel:       linkDecl.Rel,
		Context:   linkDecl.Context,
		Singleton: linkDecl.Singleton != nil,
		Required:  linkDecl.Required != nil,
	}
}
