package converter

import (
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
)

// DeclarationsToJSON ...
func DeclarationsToJSON(declarations *xmltypes.Declarations) *jsontypes.Declarations {
	if declarations == nil {
		return nil
	}

	declarationsJSON := &jsontypes.Declarations{
		Href:                  declarations.Href,
		PropertyDeclarations:  make([]jsontypes.PropertyDeclaration, len(declarations.PropertyDecl)),
		PartDeclarations:      make([]jsontypes.PartDeclaration, len(declarations.PartDecl)),
		ParagraphDeclarations: make([]jsontypes.ParagraphDeclaration, len(declarations.ParaDecl)),
		LinkDeclarations:      make([]jsontypes.LinkDeclaration, len(declarations.LinkDecl)),
	}

	for i, p := range declarations.PropertyDecl {
		declarationsJSON.PropertyDeclarations[i] = PropertyDeclToJSON(p)
	}

	for i, p := range declarations.PartDecl {
		declarationsJSON.PartDeclarations[i] = PartDeclToJSON(p)
	}

	for i, p := range declarations.ParaDecl {
		declarationsJSON.ParagraphDeclarations[i] = ParaDeclToJSON(p)
	}

	for i, p := range declarations.LinkDecl {
		declarationsJSON.LinkDeclarations[i] = LinkDeclToJSON(p)
	}

	return declarationsJSON
}

// PropertyDeclToJSON ...
func PropertyDeclToJSON(propertyDecl xmltypes.PropertyDecl) jsontypes.PropertyDeclaration {
	propertyDeclJSON := jsontypes.PropertyDeclaration{
		RequiredClass: propertyDecl.RequiredClass,
		Context:       propertyDecl.Context,
		Regex:         propertyDecl.Regex,
		Singleton:     propertyDecl.Singleton != nil,
		Required:      propertyDecl.Required != nil,
		Identifier:    propertyDecl.Identifier != nil,
		Values:        make([]jsontypes.Value, len(propertyDecl.Value)),
	}

	for i, value := range propertyDecl.Value {
		propertyDeclJSON.Values[i] = jsontypes.Value{
			Autonum: value.Autonum,
			Value:   value.Value,
			Inherit: make([]jsontypes.Inherit, len(value.Inherit)),
		}

		// Need to figure out what to do with an empty <inherit/> element

		for ii, inherit := range value.Inherit {
			propertyDeclJSON.Values[i].Inherit[ii] = jsontypes.Inherit{
				From:  inherit.From,
				Value: inherit.Value,
			}
		}
	}

	return propertyDeclJSON
}

// PartDeclToJSON ...
func PartDeclToJSON(partDecl xmltypes.PartDecl) jsontypes.PartDeclaration {
	return jsontypes.PartDeclaration{
		RequiredClass: partDecl.RequiredClass,
		Context:       partDecl.Context,
		Singleton:     partDecl.Singleton != nil,
		Required:      partDecl.Required != nil,
	}
}

// ParaDeclToJSON ...
func ParaDeclToJSON(paraDecl xmltypes.ParaDecl) jsontypes.ParagraphDeclaration {
	return jsontypes.ParagraphDeclaration{
		RequiredClass: paraDecl.RequiredClass,
		Context:       paraDecl.Context,
		Singleton:     paraDecl.Singleton != nil,
		Required:      paraDecl.Required != nil,
	}
}

// LinkDeclToJSON ...
func LinkDeclToJSON(linkDecl xmltypes.LinkDecl) jsontypes.LinkDeclaration {
	return jsontypes.LinkDeclaration{
		Rel:       linkDecl.Rel,
		Context:   linkDecl.Context,
		Singleton: linkDecl.Singleton != nil,
		Required:  linkDecl.Required != nil,
	}
}
