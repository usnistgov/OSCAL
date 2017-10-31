package core

import (
	"strings"
)

// Prose ...
type Prose struct {
	ProseJSON
}

// ProseJSON ...
type ProseJSON struct {
	ID    string `json:"id,omitempty" yaml:"id,omitempty"`
	Class string `json:"class,omitempty" yaml:"class,omitempty"`
	Value string `json:"value" yaml:"value"`
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

// Only converts PXML for now
func proseToJSON(paragraph PXML) ProseJSON {
	return ProseJSON{
		ID:    paragraph.ID,
		Class: paragraph.OptionalClass,
		Value: strings.TrimSpace(paragraph.Value),
	}
}
