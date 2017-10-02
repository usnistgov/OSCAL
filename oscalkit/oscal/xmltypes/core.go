package xmltypes

import "encoding/xml"

// Catalog ...
type Catalog struct {
	XMLName      xml.Name      `xml:"http://csrc.nist.gov/ns/oscal/1.0 catalog"`
	Title        string        `xml:"title"`
	Declarations *Declarations `xml:"declarations,omitempty"`
	Section      []Section     `xml:"section"`
	Group        []Group       `xml:"group"`
	Control      []Control     `xml:"control"`
	References   *References   `xml:"references,omitempty"`
}

// Framework ...
type Framework struct {
	XMLName       xml.Name      `xml:"http://csrc.nist.gov/ns/oscal/1.0 framework"`
	ID            string        `xml:"id,attr"`
	OptionalClass string        `xml:"class,attr"`
	Title         string        `xml:"title"`
	Declarations  *Declarations `xml:"declarations,omitempty"`
	Section       []Section     `xml:"section"`
	Category      []Category    `xml:"group"`
	Item          []Item        `xml:"component"`
	References    *References   `xml:"references,omitempty"`
}

// Worksheet ...
type Worksheet Framework

// Category ...
type Category struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`
	Title         string `xml:"title"`
	Prop          []Prop `xml:"prop"`
	Link          []Link `xml:"link"`

	// rnc:prose
	UL  []UL  `xml:"ul"`
	OL  []OL  `xml:"ol"`
	P   []P   `xml:"p"`
	Pre []Pre `xml:"pre"`

	Category []Category `xml:"group"`
	Item     []Item     `xml:"component"`
}

// Item ...
type Item struct {
	ID            string      `xml:"id,attr"`
	OptionalClass string      `xml:"class,attr"`
	Title         string      `xml:"title"`
	Param         []CoreParam `xml:"param"`
	Prop          []Prop      `xml:"prop"`
	Link          []Link      `xml:"link"`

	// rnc:prose
	UL  []UL  `xml:"ul"`
	OL  []OL  `xml:"ol"`
	P   []P   `xml:"p"`
	Pre []Pre `xml:"pre"`

	Part []Part `xml:"part"`
	Item []Item `xml:"component"`
}

// Declarations ...
type Declarations struct {
	XMLName      xml.Name       `xml:"http://csrc.nist.gov/ns/oscal/1.0 declarations"`
	Href         string         `xml:"href,attr"`
	PropertyDecl []PropertyDecl `xml:"declare-prop"`
	PartDecl     []PartDecl     `xml:"declare-part"`
	ParaDecl     []ParaDecl     `xml:"declare-p"`
	LinkDecl     []LinkDecl     `xml:"declare-link"`
}

// PropertyDecl ...
type PropertyDecl struct {
	RequiredClass string    `xml:"class,attr"`
	Context       string    `xml:"context,attr"`
	Singleton     *struct{} `xml:"singleton"`
	Required      *struct{} `xml:"required"`
	Identifier    *struct{} `xml:"identifier"`
	Regex         string    `xml:"regex"`
	Value         []Value   `xml:"value"`
}

// PartDecl ...
type PartDecl struct {
	RequiredClass string    `xml:"class,attr"`
	Context       string    `xml:"context,attr"`
	Singleton     *struct{} `xml:"singleton"`
	Required      *struct{} `xml:"required"`
}

// ParaDecl ...
type ParaDecl struct {
	RequiredClass string    `xml:"class,attr"`
	Context       string    `xml:"context,attr"`
	Singleton     *struct{} `xml:"singleton"`
	Required      *struct{} `xml:"required"`
}

// LinkDecl ...
type LinkDecl struct {
	Rel       string    `xml:"rel,attr"`
	Context   string    `xml:"context,attr"`
	Singleton *struct{} `xml:"singleton"`
	Required  *struct{} `xml:"required"`
}

// Value ...
type Value struct {
	Inherit []Inherit `xml:"inherit,omitempty"`
	Autonum []string  `xml:"autonum"`
	Value   string    `xml:",chardata"`
}

// Inherit ...
type Inherit struct {
	From  string `xml:"from,attr,omitempty"`
	Value string `xml:",chardata"`
}

// Section ...
type Section struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`
	Title         string `xml:"title"`

	// rnc:prose
	UL  []UL  `xml:"ul"`
	OL  []OL  `xml:"ol"`
	P   []P   `xml:"p"`
	Pre []Pre `xml:"pre"`

	Section    []Section   `xml:"section"`
	Group      []Group     `xml:"group"`
	References *References `xml:"references,omitempty"`
}

// Group ...
type Group struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`
	Title         string `xml:"title"`
	Prop          []Prop `xml:"prop"`
	Part          []Part `xml:"part"`

	// rnc:prose
	UL  []UL  `xml:"ul"`
	OL  []OL  `xml:"ol"`
	P   []P   `xml:"p"`
	Pre []Pre `xml:"pre"`

	Param      []CoreParam `xml:"param"`
	Group      []Group     `xml:"group"`
	Control    []Control   `xml:"control"`
	References *References `xml:"references,omitempty"`
}

// Control ...
type Control struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,atr"`
	Title         string `xml:"title"`
	Prop          []Prop `xml:"prop"`
	Part          []Part `xml:"part"`
	Link          []Link `xml:"link"`

	// rnc:prose
	UL  []UL  `xml:"ul"`
	OL  []OL  `xml:"ol"`
	P   []P   `xml:"p"`
	Pre []Pre `xml:"pre"`

	Param      []CoreParam  `xml:"param"`
	Subcontrol []Subcontrol `xml:"subcontrol"`
	References *References  `xml:"references,omitempty"`
}

// Subcontrol ...
type Subcontrol struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,atr"`
	Title         string `xml:"title"`
	Prop          []Prop `xml:"prop"`
	Part          []Part `xml:"part"`
	Link          []Link `xml:"link"`

	// rnc:prose
	UL  []UL  `xml:"ul"`
	OL  []OL  `xml:"ol"`
	P   []P   `xml:"p"`
	Pre []Pre `xml:"pre"`

	Param      []CoreParam `xml:"param"`
	References *References `xml:"references,omitempty"`
}

// Part ...
type Part struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,atr"`
	Title         string `xml:"title"`
	Prop          []Prop `xml:"prop"`
	Part          []Part `xml:"part"`
	Link          []Link `xml:"link"`

	// rnc:prose
	UL  []UL  `xml:"ul"`
	OL  []OL  `xml:"ol"`
	P   []P   `xml:"p"`
	Pre []Pre `xml:"pre"`

	Param []CoreParam `xml:"param"`
}

// Link ...
type Link struct {
	Rel   string `xml:"rel,attr"`
	Href  string `xml:"href,attr"`
	Value string `xml:",chardata"`
}

// CoreParam ...
type CoreParam struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`
	Desc          string `xml:"desc"`
	ParamValue    string `xml:"value"`
}

// Prop ...
type Prop struct {
	RequiredClass string `xml:"class,attr"`
	Value         string `xml:",chardata"`
}

// References ...
type References struct {
	Ref []Ref `xml:"ref"`
}

// Ref ...
type Ref struct {
	ID       string     `xml:"id,attr"`
	Std      []Std      `xml:"std"`
	Citation []Citation `xml:"citation"`

	// rnc:prose
	UL  []UL  `xml:"ul"`
	OL  []OL  `xml:"ol"`
	P   []P   `xml:"p"`
	Pre []Pre `xml:"pre"`
}

// Std ...
type Std struct {
	Href  string `xml:"href,attr"`
	Value string `xml:",chardata"`
}

// Citation ...
type Citation struct {
	Href  string `xml:"href,attr"`
	Value string `xml:",chardata"`
}

// P ...
type P struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`

	// rnc:semantical
	Withdrawn []Withdrawn `xml:"withdrawn"`
	Assign    []Assign    `xml:"insert"`
	Select    []Select    `xml:"select"`

	// rnc:mix
	Q     []Q    `xml:"q"`
	Code  []Code `xml:"code"`
	EM    []EM   `xml:"em"`
	I     []I    `xml:"i"`
	B     []B    `xml:"b"`
	Sub   []Sub  `xml:"sub"`
	Sup   []Sup  `xml:"sup"`
	Span  []Span `xml:"span"`
	Value string `xml:",chardata"`

	Xref []Xref `xml:"a"`
}

// Pre ...
type Pre struct {
	ID string `xml:"id,attr"`

	// rnc:mix
	Q     []Q    `xml:"q"`
	Code  []Code `xml:"code"`
	EM    []EM   `xml:"em"`
	I     []I    `xml:"i"`
	B     []B    `xml:"b"`
	Sub   []Sub  `xml:"sub"`
	Sup   []Sup  `xml:"sup"`
	Span  []Span `xml:"span"`
	Value string `xml:",chardata"`

	Xref []Xref `xml:"a"`
}

// OL ...
type OL struct {
	LI []LI `xml:"li"`
}

// UL ...
type UL struct {
	LI []LI `xml:"li"`
}

// LI ...
type LI struct {
	ID            string `xml:"id,attr"`
	OptionalClass string `xml:"class,attr"`

	// rnc:semantical
	Withdrawn []Withdrawn `xml:"withdrawn"`
	Assign    []Assign    `xml:"insert"`
	Select    []Select    `xml:"select"`

	// rnc:mix
	Q     []Q    `xml:"q"`
	Code  []Code `xml:"code"`
	EM    []EM   `xml:"em"`
	I     []I    `xml:"i"`
	B     []B    `xml:"b"`
	Sub   []Sub  `xml:"sub"`
	Sup   []Sup  `xml:"sup"`
	Span  []Span `xml:"span"`
	Value string `xml:",chardata"`

	Xref []Xref `xml:"a"`

	OL []OL `xml:"ol"`
	UL []UL `xml:"ul"`
}

// Q ...
type Q struct {
	I     []I    `xml:"i"`
	B     []B    `xml:"b"`
	Sub   []Sub  `xml:"sub"`
	Sup   []Sup  `xml:"sup"`
	Value string `xml:",chardata"`
}

// Code ...
type Code struct {
	OptionalClass string `xml:"class,attr"`
	Q             []Q    `xml:"q"`
	Code          []Code `xml:"code"`
	EM            []EM   `xml:"em"`
	I             []I    `xml:"i"`
	B             []B    `xml:"b"`
	Sub           []Sub  `xml:"sub"`
	Sup           []Sup  `xml:"sup"`
	Span          []Span `xml:"span"`
	Value         string `xml:",chardata"`
}

// EM ...
type EM struct {
	OptionalClass string `xml:"class,attr"`
	Q             []Q    `xml:"q"`
	Code          []Code `xml:"code"`
	EM            []EM   `xml:"em"`
	I             []I    `xml:"i"`
	B             []B    `xml:"b"`
	Sub           []Sub  `xml:"sub"`
	Sup           []Sup  `xml:"sup"`
	Span          []Span `xml:"span"`
	Value         string `xml:",chardata"`
	Xref          []Xref `xml:"a"`
}

// I ...
type I struct {
	OptionalClass string `xml:"class,attr"`
	Q             []Q    `xml:"q"`
	Code          []Code `xml:"code"`
	EM            []EM   `xml:"em"`
	I             []I    `xml:"i"`
	B             []B    `xml:"b"`
	Sub           []Sub  `xml:"sub"`
	Sup           []Sup  `xml:"sup"`
	Span          []Span `xml:"span"`
	Value         string `xml:",chardata"`
	Xref          []Xref `xml:"a"`
}

// B ...
type B struct {
	OptionalClass string `xml:"class,attr"`
	Q             []Q    `xml:"q"`
	Code          []Code `xml:"code"`
	EM            []EM   `xml:"em"`
	I             []I    `xml:"i"`
	B             []B    `xml:"b"`
	Sub           []Sub  `xml:"sub"`
	Sup           []Sup  `xml:"sup"`
	Span          []Span `xml:"span"`
	Value         string `xml:",chardata"`
	Xref          []Xref `xml:"a"`
}

// Sub ...
type Sub struct {
	OptionalClass string `xml:"class,attr"`
	Value         string `xml:",chardata"`
}

// Sup ...
type Sup struct {
	OptionalClass string `xml:"class,attr"`
	Value         string `xml:",chardata"`
}

// Span ...
type Span struct {
	OptionalClass string `xml:"class,attr"`
	Q             []Q    `xml:"q"`
	Code          []Code `xml:"code"`
	EM            []EM   `xml:"em"`
	I             []I    `xml:"i"`
	B             []B    `xml:"b"`
	Sub           []Sub  `xml:"sub"`
	Sup           []Sup  `xml:"sup"`
	Span          []Span `xml:"span"`
	Value         string `xml:",chardata"`
	Xref          []Xref `xml:"a"`
}

// Xref ...
type Xref struct {
	Href string `xml:"href,attr"`
	Q    []Q    `xml:"q"`
	Code []Code `xml:"code"`
	EM   []struct {
		OptionalClass string `xml:"class,attr"`
		Value         string `xml:",chardata"`
	} `xml:"em"`
	Value string `xml:",chardata"`
}

// Withdrawn ...
type Withdrawn struct {
	Q     []Q    `xml:"q"`
	Code  []Code `xml:"code"`
	EM    []EM   `xml:"em"`
	I     []I    `xml:"i"`
	B     []B    `xml:"b"`
	Sub   []Sub  `xml:"sub"`
	Sup   []Sup  `xml:"sup"`
	Span  []Span `xml:"span"`
	Value string `xml:",chardata"`
}

// Assign ...
type Assign struct {
	ID      string `xml:"id,attr"`
	ParamID string `xml:"param-id"`
}

// Select ...
type Select struct{}
