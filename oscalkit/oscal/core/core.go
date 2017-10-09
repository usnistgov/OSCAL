package core

import "encoding/xml"

// CoreJSON ...
type CoreJSON struct {
	Catalog      *CatalogJSON      `json:"catalog,omitempty" yaml:"catalog,omitempty"`
	Declarations *DeclarationsJSON `json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Framework    *FrameworkJSON    `json:"framework,omitempty" yaml:"framework,omitempty"`
}

// CatalogJSON ...
type CatalogJSON struct {
	Title        string            `json:"title" yaml:"title"`
	Declarations *DeclarationsJSON `json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Sections     []SectionJSON     `json:"sections,omitempty" yaml:"sections,omitempty"`
	Groups       []GroupJSON       `json:"groups,omitempty" yaml:"groups,omitempty"`
	Controls     []ControlJSON     `json:"controls,omitempty" yaml:"controls,omitempty"`
	References   []ReferenceJSON   `json:"references,omitempty" yaml:"references,omitempty"`
}

// FrameworkJSON ...
type FrameworkJSON struct {
	ID            string            `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string            `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string            `json:"title" yaml:"title"`
	Declarations  *DeclarationsJSON `json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Sections      []SectionJSON     `json:"sections,omitempty" yaml:"sections,omitempty"`
	Categories    []CategoryJSON    `json:"groups,omitempty" yaml:"groups,omitempty"`
	Items         []ItemJSON        `json:"components,omitempty" yaml:"components,omitempty"`
	References    []ReferenceJSON   `json:"references,omitempty" yaml:"references,omitempty"`
}

// CategoryJSON ...
type CategoryJSON struct {
	ID            string         `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string         `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string         `json:"title" yaml:"title"`
	Props         []PropJSON     `json:"props,omitempty" yaml:"props,omitempty"`
	Links         []LinkJSON     `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []ProseJSON    `json:"prose,omitempty" yaml:"prose,omitempty"`
	Categories    []CategoryJSON `json:"groups,omitempty" yaml:"groups,omitempty"`
	Items         []ItemJSON     `json:"components,omitempty" yaml:"components,omitempty"`
}

// ItemJSON ...
type ItemJSON struct {
	ID            string      `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string      `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string      `json:"title" yaml:"title"`
	Params        []ParamJSON `json:"params,omitempty" yaml:"params,omitempty"`
	Props         []PropJSON  `json:"props,omitempty" yaml:"props,omitempty"`
	Links         []LinkJSON  `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []ProseJSON `json:"prose,omitempty" yaml:"prose,omitempty"`
	Parts         []PartJSON  `json:"parts,omitempty" yaml:"parts,omitempty"`
	Items         []ItemJSON  `json:"components,omitempty" yaml:"components,omitempty"`
}

// DeclarationsJSON ...
type DeclarationsJSON struct {
	Href           string              `json:"href,omitempty" yaml:"href,omitempty"`
	PropDecls      []PropDeclJSON      `json:"propertyDeclarations,omitempty" yaml:"propertyDeclarations,omitempty"`
	PartDecls      []PartDeclJSON      `json:"partDeclarations,omitempty" yaml:"partDeclarations,omitempty"`
	ParagraphDecls []ParagraphDeclJSON `json:"paragraphDeclarations,omitempty" yaml:"paragraphDeclarations,omitempty"`
	LinkDecls      []LinkDeclJSON      `json:"linkDeclarations,omitempty" yaml:"linkDeclarations,omitempty"`
}

// PropDeclJSON ...
type PropDeclJSON struct {
	RequiredClass string      `json:"class" yaml:"class"`
	Context       string      `json:"context" yaml:"context"`
	Singleton     bool        `json:"singleton" yaml:"singleton"`
	Required      bool        `json:"required" yaml:"required"`
	Identifier    bool        `json:"identifier" yaml:"identifier"`
	Regex         string      `json:"regex,omitempty" yaml:"regex,omitempty"`
	Values        []ValueJSON `json:"values,omitempty" yaml:"values,omitempty"`
}

// PartDeclJSON ...
type PartDeclJSON struct {
	RequiredClass string `json:"class" yaml:"class"`
	Context       string `json:"context" yaml:"context"`
	Singleton     bool   `json:"singleton" yaml:"singleton"`
	Required      bool   `json:"required" yaml:"required"`
}

// ParagraphDeclJSON ...
type ParagraphDeclJSON struct {
	RequiredClass string `json:"class" yaml:"class"`
	Context       string `json:"context" yaml:"context"`
	Singleton     bool   `json:"singleton" yaml:"singleton"`
	Required      bool   `json:"required" yaml:"required"`
}

// LinkDeclJSON ...
type LinkDeclJSON struct {
	Rel       string `json:"rel" yaml:"rel"`
	Context   string `json:"context" yaml:"context"`
	Singleton bool   `json:"singleton" yaml:"singleton"`
	Required  bool   `json:"required" yaml:"required"`
}

// ValueJSON ...
type ValueJSON struct {
	Inherit []InheritJSON `json:"inherit,omitempty" yaml:"inherit,omitempty"`
	Autonum []string      `json:"autonum,omitempty" yaml:"autonum,omitempty"`
	Value   string        `json:"value,omitempty" yaml:"value,omitempty"`
}

// InheritJSON ...
type InheritJSON struct {
	From  string `json:"from,omitempty" yaml:"from,omitempty"`
	Value string `json:"value" yaml:"value"`
}

// SectionJSON ...
type SectionJSON struct {
	ID            string          `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string          `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string          `json:"title" yaml:"title"`
	Prose         []ProseJSON     `json:"prose,omitempty" yaml:"prose,omitempty"`
	Sections      []SectionJSON   `json:"sections,omitempty" yaml:"sections,omitempty"`
	Groups        []GroupJSON     `json:"groups,omitempty" yaml:"groups,omitempty"`
	References    []ReferenceJSON `json:"references,omitempty" yaml:"references,omitempty"`
}

// GroupJSON ...
type GroupJSON struct {
	ID            string          `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string          `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string          `json:"title" yaml:"title"`
	Props         []PropJSON      `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []PartJSON      `json:"parts,omitempty" yaml:"parts,omitempty"`
	Prose         []ProseJSON     `json:"prose,omitempty" yaml:"prose,omitempty"`
	Groups        []GroupJSON     `json:"groups,omitempty" yaml:"groups,omitempty"`
	Controls      []ControlJSON   `json:"controls,omitempty" yaml:"controls,omitempty"`
	References    []ReferenceJSON `json:"references,omitempty" yaml:"references,omitempty"`
}

// ControlJSON ...
type ControlJSON struct {
	ID            string           `json:"id" yaml:"id"`
	OptionalClass string           `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string           `json:"title" yaml:"title"`
	Params        []ParamJSON      `json:"params,omitempty" yaml:"params,omitempty"`
	Props         []PropJSON       `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []PartJSON       `json:"parts,omitempty" yaml:"parts,omitempty"`
	Links         []LinkJSON       `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []ProseJSON      `json:"prose,omitempty" yaml:"prose,omitempty"`
	Subcontrols   []SubcontrolJSON `json:"subcontrols,omitempty" yaml:"subcontrols,omitempty"`
	References    []ReferenceJSON  `json:"references,omitempty" yaml:"references,omitempty"`
}

// SubcontrolJSON ...
type SubcontrolJSON struct {
	ID            string          `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string          `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string          `json:"title" yaml:"title"`
	Params        []ParamJSON     `json:"params,omitempty" yaml:"params,omitempty"`
	Props         []PropJSON      `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []PartJSON      `json:"parts,omitempty" yaml:"parts,omitempty"`
	Links         []LinkJSON      `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []ProseJSON     `json:"prose,omitempty" yaml:"prose,omitempty"`
	References    []ReferenceJSON `json:"references,omitempty" yaml:"references,omitempty"`
}

// PartJSON ...
type PartJSON struct {
	ID            string      `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string      `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string      `json:"title,omitempty" yaml:"title,omitempty"`
	Props         []PropJSON  `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []PartJSON  `json:"parts,omitempty" yaml:"parts,omitempty"`
	Links         []LinkJSON  `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []ProseJSON `json:"prose,omitempty" yaml:"prose,omitempty"`
	Params        []ParamJSON `json:"params,omitempty" yaml:"params,omitempty"`
}

// LinkJSON ...
type LinkJSON struct {
	Rel   string `json:"rel,omitempty"  yaml:"rel,omitempty"`
	Href  string `json:"href" yaml:"href"`
	Value string `json:"value,omitempty" yaml:"value,omitempty"`
}

// ParamJSON ...
type ParamJSON struct {
	ID            string `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string `json:"class,omitempty" yaml:"class,omitempty"`
	Description   string `json:"description" yaml:"description"`
	Value         string `json:"value" yaml:"value"`
}

// PropJSON ...
type PropJSON struct {
	RequiredClass string `json:"class,omitempty" yaml:"class,omitempty"`
	Value         string `json:"value,omitempty" yaml:"value,omitempty"`
}

// ReferenceJSON ...
type ReferenceJSON struct {
	ID        string         `json:"id" yaml:"id"`
	Standards []StandardJSON `json:"standards,omitempty" yaml:"standards,omitempty"`
	Citations []CitationJSON `json:"citations,omitempty" yaml:"citations,omitempty"`
	Prose     []ProseJSON    `json:"prose,omitempty" yaml:"prose,omitempty"`
}

// StandardJSON ...
type StandardJSON struct {
	Href  string `json:"href" yaml:"href"`
	Value string `json:"value" yaml:"value"`
}

// CitationJSON ...
type CitationJSON struct {
	Href  string `json:"href" yaml:"href"`
	Value string `json:"value" yaml:"value"`
}

// ProseJSON ...
type ProseJSON struct {
	ID    string `json:"id,omitempty" yaml:"id,omitempty"`
	Class string `json:"class,omitempty" yaml:"class,omitempty"`
	Value string `json:"value" yaml:"value"`
}

// CatalogXML ...
type CatalogXML struct {
	XMLName      xml.Name         `xml:"http://csrc.nist.gov/ns/oscal/1.0 catalog"`
	Title        string           `xml:"title"`
	Declarations *DeclarationsXML `xml:"declarations,omitempty"`
	Section      []SectionXML     `xml:"section"`
	Group        []GroupXML       `xml:"group"`
	Control      []ControlXML     `xml:"control"`
	References   *ReferencesXML   `xml:"references,omitempty"`
}

// FrameworkXML ...
type FrameworkXML struct {
	XMLName       xml.Name         `xml:"http://csrc.nist.gov/ns/oscal/1.0 framework"`
	ID            string           `xml:"id,attr"`
	OptionalClass string           `xml:"class,attr"`
	Title         string           `xml:"title"`
	Declarations  *DeclarationsXML `xml:"declarations,omitempty"`
	Section       []SectionXML     `xml:"section"`
	Category      []CategoryXML    `xml:"group"`
	Item          []ItemXML        `xml:"component"`
	References    *ReferencesXML   `xml:"references,omitempty"`
}

// WorksheetXML ...
type WorksheetXML FrameworkXML

// CategoryXML ...
type CategoryXML struct {
	ID            string    `xml:"id,attr"`
	OptionalClass string    `xml:"class,attr"`
	Title         string    `xml:"title"`
	Prop          []PropXML `xml:"prop"`
	Link          []LinkXML `xml:"link"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Category []CategoryXML `xml:"group"`
	Item     []ItemXML     `xml:"component"`
}

// ItemXML ...
type ItemXML struct {
	ID            string     `xml:"id,attr"`
	OptionalClass string     `xml:"class,attr"`
	Title         string     `xml:"title"`
	Param         []ParamXML `xml:"param"`
	Prop          []PropXML  `xml:"prop"`
	Link          []LinkXML  `xml:"link"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Part []PartXML `xml:"part"`
	Item []ItemXML `xml:"component"`
}

// DeclarationsXML ...
type DeclarationsXML struct {
	XMLName      xml.Name          `xml:"http://csrc.nist.gov/ns/oscal/1.0 declarations"`
	Href         string            `xml:"href,attr"`
	PropertyDecl []PropertyDeclXML `xml:"declare-prop"`
	PartDecl     []PartDeclXML     `xml:"declare-part"`
	ParaDecl     []ParaDeclXML     `xml:"declare-p"`
	LinkDecl     []LinkDeclXML     `xml:"declare-link"`
}

// PropertyDeclXML ...
type PropertyDeclXML struct {
	RequiredClass string     `xml:"class,attr"`
	Context       string     `xml:"context,attr"`
	Singleton     *struct{}  `xml:"singleton"`
	Required      *struct{}  `xml:"required"`
	Identifier    *struct{}  `xml:"identifier"`
	Regex         string     `xml:"regex"`
	Value         []ValueXML `xml:"value"`
}

// PartDeclXML ...
type PartDeclXML struct {
	RequiredClass string    `xml:"class,attr"`
	Context       string    `xml:"context,attr"`
	Singleton     *struct{} `xml:"singleton"`
	Required      *struct{} `xml:"required"`
}

// ParaDeclXML ...
type ParaDeclXML struct {
	RequiredClass string    `xml:"class,attr"`
	Context       string    `xml:"context,attr"`
	Singleton     *struct{} `xml:"singleton"`
	Required      *struct{} `xml:"required"`
}

// LinkDeclXML ...
type LinkDeclXML struct {
	Rel       string    `xml:"rel,attr"`
	Context   string    `xml:"context,attr"`
	Singleton *struct{} `xml:"singleton"`
	Required  *struct{} `xml:"required"`
}

// ValueXML ...
type ValueXML struct {
	Inherit []InheritXML `xml:"inherit,omitempty"`
	Autonum []string     `xml:"autonum"`
	Value   string       `xml:",chardata"`
}

// InheritXML ...
type InheritXML struct {
	From  string `xml:"from,attr,omitempty"`
	Value string `xml:",chardata"`
}

// SectionXML ...
type SectionXML struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`
	Title         string `xml:"title"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Section    []SectionXML   `xml:"section"`
	Group      []GroupXML     `xml:"group"`
	References *ReferencesXML `xml:"references,omitempty"`
}

// GroupXML ...
type GroupXML struct {
	ID            string    `xml:"id,attr"`
	OptionalClass string    `xml:"class,attr"`
	Title         string    `xml:"title"`
	Prop          []PropXML `xml:"prop"`
	Part          []PartXML `xml:"part"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Param      []ParamXML     `xml:"param"`
	Group      []GroupXML     `xml:"group"`
	Control    []ControlXML   `xml:"control"`
	References *ReferencesXML `xml:"references,omitempty"`
}

// ControlXML ...
type ControlXML struct {
	ID            string    `xml:"id,attr"`
	OptionalClass string    `xml:"class,atr"`
	Title         string    `xml:"title"`
	Prop          []PropXML `xml:"prop"`
	Part          []PartXML `xml:"part"`
	Link          []LinkXML `xml:"link"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Param      []ParamXML      `xml:"param"`
	Subcontrol []SubcontrolXML `xml:"subcontrol"`
	References *ReferencesXML  `xml:"references,omitempty"`
}

// SubcontrolXML ...
type SubcontrolXML struct {
	ID            string    `xml:"id,attr"`
	OptionalClass string    `xml:"class,atr"`
	Title         string    `xml:"title"`
	Prop          []PropXML `xml:"prop"`
	Part          []PartXML `xml:"part"`
	Link          []LinkXML `xml:"link"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Param      []ParamXML     `xml:"param"`
	References *ReferencesXML `xml:"references,omitempty"`
}

// PartXML ...
type PartXML struct {
	ID            string    `xml:"id,attr"`
	OptionalClass string    `xml:"class,atr"`
	Title         string    `xml:"title"`
	Prop          []PropXML `xml:"prop"`
	Part          []PartXML `xml:"part"`
	Link          []LinkXML `xml:"link"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`

	Param []ParamXML `xml:"param"`
}

// LinkXML ...
type LinkXML struct {
	Rel   string `xml:"rel,attr"`
	Href  string `xml:"href,attr"`
	Value string `xml:",chardata"`
}

// ParamXML ...
type ParamXML struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`
	Desc          string `xml:"desc"`
	ParamValue    string `xml:"value"`
}

// PropXML ...
type PropXML struct {
	RequiredClass string `xml:"class,attr"`
	Value         string `xml:",chardata"`
}

// ReferencesXML ...
type ReferencesXML struct {
	Ref []RefXML `xml:"ref"`
}

// RefXML ...
type RefXML struct {
	ID       string        `xml:"id,attr"`
	Std      []StdXML      `xml:"std"`
	Citation []CitationXML `xml:"citation"`

	// rnc:prose
	UL  []ULXML  `xml:"ul"`
	OL  []OLXML  `xml:"ol"`
	P   []PXML   `xml:"p"`
	Pre []PreXML `xml:"pre"`
}

// StdXML ...
type StdXML struct {
	Href  string `xml:"href,attr"`
	Value string `xml:",chardata"`
}

// CitationXML ...
type CitationXML struct {
	Href  string `xml:"href,attr"`
	Value string `xml:",chardata"`
}

// PXML ...
type PXML struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`

	// rnc:semantical
	Withdrawn []WithdrawnXML `xml:"withdrawn"`
	Assign    []AssignXML    `xml:"insert"`
	Select    []SelectXML    `xml:"select"`

	// rnc:mix
	Q     []QXML    `xml:"q"`
	Code  []CodeXML `xml:"code"`
	EM    []EMXML   `xml:"em"`
	I     []IXML    `xml:"i"`
	B     []BXML    `xml:"b"`
	Sub   []SubXML  `xml:"sub"`
	Sup   []SupXML  `xml:"sup"`
	Span  []SpanXML `xml:"span"`
	Value string    `xml:",chardata"`

	Xref []XrefXML `xml:"a"`
}

// PreXML ...
type PreXML struct {
	ID string `xml:"id,attr"`

	// rnc:mix
	Q     []QXML    `xml:"q"`
	Code  []CodeXML `xml:"code"`
	EM    []EMXML   `xml:"em"`
	I     []IXML    `xml:"i"`
	B     []BXML    `xml:"b"`
	Sub   []SubXML  `xml:"sub"`
	Sup   []SupXML  `xml:"sup"`
	Span  []SpanXML `xml:"span"`
	Value string    `xml:",chardata"`

	Xref []XrefXML `xml:"a"`
}

// OLXML ...
type OLXML struct {
	LI []LIXML `xml:"li"`
}

// ULXML ...
type ULXML struct {
	LI []LIXML `xml:"li"`
}

// LIXML ...
type LIXML struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`

	// rnc:semantical
	Withdrawn []WithdrawnXML `xml:"withdrawn"`
	Assign    []AssignXML    `xml:"insert"`
	Select    []SelectXML    `xml:"select"`

	// rnc:mix
	Q     []QXML    `xml:"q"`
	Code  []CodeXML `xml:"code"`
	EM    []EMXML   `xml:"em"`
	I     []IXML    `xml:"i"`
	B     []BXML    `xml:"b"`
	Sub   []SubXML  `xml:"sub"`
	Sup   []SupXML  `xml:"sup"`
	Span  []SpanXML `xml:"span"`
	Value string    `xml:",chardata"`

	Xref []XrefXML `xml:"a"`

	OL []OLXML `xml:"ol"`
	UL []ULXML `xml:"ul"`
}

// QXML ...
type QXML struct {
	I     []IXML   `xml:"i"`
	B     []BXML   `xml:"b"`
	Sub   []SubXML `xml:"sub"`
	Sup   []SupXML `xml:"sup"`
	Value string   `xml:",chardata"`
}

// CodeXML ...
type CodeXML struct {
	OptionalClass string    `xml:"class,attr"`
	Q             []QXML    `xml:"q"`
	Code          []CodeXML `xml:"code"`
	EM            []EMXML   `xml:"em"`
	I             []IXML    `xml:"i"`
	B             []BXML    `xml:"b"`
	Sub           []SubXML  `xml:"sub"`
	Sup           []SupXML  `xml:"sup"`
	Span          []SpanXML `xml:"span"`
	Value         string    `xml:",chardata"`
}

// EMXML ...
type EMXML struct {
	OptionalClass string    `xml:"class,attr"`
	Q             []QXML    `xml:"q"`
	Code          []CodeXML `xml:"code"`
	EM            []EMXML   `xml:"em"`
	I             []IXML    `xml:"i"`
	B             []BXML    `xml:"b"`
	Sub           []SubXML  `xml:"sub"`
	Sup           []SupXML  `xml:"sup"`
	Span          []SpanXML `xml:"span"`
	Value         string    `xml:",chardata"`
	Xref          []XrefXML `xml:"a"`
}

// IXML ...
type IXML struct {
	OptionalClass string    `xml:"class,attr"`
	Q             []QXML    `xml:"q"`
	Code          []CodeXML `xml:"code"`
	EM            []EMXML   `xml:"em"`
	I             []IXML    `xml:"i"`
	B             []BXML    `xml:"b"`
	Sub           []SubXML  `xml:"sub"`
	Sup           []SupXML  `xml:"sup"`
	Span          []SpanXML `xml:"span"`
	Value         string    `xml:",chardata"`
	Xref          []XrefXML `xml:"a"`
}

// BXML ...
type BXML struct {
	OptionalClass string    `xml:"class,attr"`
	Q             []QXML    `xml:"q"`
	Code          []CodeXML `xml:"code"`
	EM            []EMXML   `xml:"em"`
	I             []IXML    `xml:"i"`
	B             []BXML    `xml:"b"`
	Sub           []SubXML  `xml:"sub"`
	Sup           []SupXML  `xml:"sup"`
	Span          []SpanXML `xml:"span"`
	Value         string    `xml:",chardata"`
	Xref          []XrefXML `xml:"a"`
}

// SubXML ...
type SubXML struct {
	OptionalClass string `xml:"class,attr"`
	Value         string `xml:",chardata"`
}

// SupXML ...
type SupXML struct {
	OptionalClass string `xml:"class,attr"`
	Value         string `xml:",chardata"`
}

// SpanXML ...
type SpanXML struct {
	OptionalClass string    `xml:"class,attr"`
	Q             []QXML    `xml:"q"`
	Code          []CodeXML `xml:"code"`
	EM            []EMXML   `xml:"em"`
	I             []IXML    `xml:"i"`
	B             []BXML    `xml:"b"`
	Sub           []SubXML  `xml:"sub"`
	Sup           []SupXML  `xml:"sup"`
	Span          []SpanXML `xml:"span"`
	Value         string    `xml:",chardata"`
	Xref          []XrefXML `xml:"a"`
}

// XrefXML ...
type XrefXML struct {
	Href string    `xml:"href,attr"`
	Q    []QXML    `xml:"q"`
	Code []CodeXML `xml:"code"`
	EM   []struct {
		OptionalClass string `xml:"class,attr"`
		Value         string `xml:",chardata"`
	} `xml:"em"`
	Value string `xml:",chardata"`
}

// WithdrawnXML ...
type WithdrawnXML struct {
	Q     []QXML    `xml:"q"`
	Code  []CodeXML `xml:"code"`
	EM    []EMXML   `xml:"em"`
	I     []IXML    `xml:"i"`
	B     []BXML    `xml:"b"`
	Sub   []SubXML  `xml:"sub"`
	Sup   []SupXML  `xml:"sup"`
	Span  []SpanXML `xml:"span"`
	Value string    `xml:",chardata"`
}

// AssignXML ...
type AssignXML struct {
	ID      string `xml:"id,attr"`
	ParamID string `xml:"param-id"`
}

// SelectXML ...
type SelectXML struct{}
