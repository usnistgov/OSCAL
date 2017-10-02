package jsontypes

// Core ...
type Core struct {
	Catalog      *Catalog      `json:"catalog,omitempty" yaml:"catalog,omitempty"`
	Declarations *Declarations `json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Framework    *Framework    `json:"framework,omitempty" yaml:"framework,omitempty"`
}

// Catalog ...
type Catalog struct {
	Title        string        `json:"title" yaml:"title"`
	Declarations *Declarations `json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Sections     []Section     `json:"sections,omitempty" yaml:"sections,omitempty"`
	Groups       []Group       `json:"groups,omitempty" yaml:"groups,omitempty"`
	Controls     []Control     `json:"controls,omitempty" yaml:"controls,omitempty"`
	References   []Reference   `json:"references,omitempty" yaml:"references,omitempty"`
}

// Framework ...
type Framework struct {
	ID            string        `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string        `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string        `json:"title" yaml:"title"`
	Declarations  *Declarations `json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Sections      []Section     `json:"sections,omitempty" yaml:"sections,omitempty"`
	Categories    []Category    `json:"groups,omitempty" yaml:"groups,omitempty"`
	Items         []Item        `json:"components,omitempty" yaml:"components,omitempty"`
	References    []Reference   `json:"references,omitempty" yaml:"references,omitempty"`
}

// Category ...
type Category struct {
	ID            string     `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string     `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string     `json:"title" yaml:"title"`
	Props         []Prop     `json:"props,omitempty" yaml:"props,omitempty"`
	Links         []Link     `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []Prose    `json:"prose,omitempty" yaml:"prose,omitempty"`
	Categories    []Category `json:"groups,omitempty" yaml:"groups,omitempty"`
	Items         []Item     `json:"components,omitempty" yaml:"components,omitempty"`
}

// Item ...
type Item struct {
	ID            string      `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string      `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string      `json:"title" yaml:"title"`
	Params        []CoreParam `json:"params,omitempty" yaml:"params,omitempty"`
	Props         []Prop      `json:"props,omitempty" yaml:"props,omitempty"`
	Links         []Link      `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []Prose     `json:"prose,omitempty" yaml:"prose,omitempty"`
	Parts         []Part      `json:"parts,omitempty" yaml:"parts,omitempty"`
	Items         []Item      `json:"components,omitempty" yaml:"components,omitempty"`
}

// Declarations ...
type Declarations struct {
	Href                  string                 `json:"href,omitempty" yaml:"href,omitempty"`
	PropertyDeclarations  []PropertyDeclaration  `json:"propertyDeclarations,omitempty" yaml:"propertyDeclarations,omitempty"`
	PartDeclarations      []PartDeclaration      `json:"partDeclarations,omitempty" yaml:"partDeclarations,omitempty"`
	ParagraphDeclarations []ParagraphDeclaration `json:"paragraphDeclarations,omitempty" yaml:"paragraphDeclarations,omitempty"`
	LinkDeclarations      []LinkDeclaration      `json:"linkDeclarations,omitempty" yaml:"linkDeclarations,omitempty"`
}

// PropertyDeclaration ...
type PropertyDeclaration struct {
	RequiredClass string  `json:"class" yaml:"class"`
	Context       string  `json:"context" yaml:"context"`
	Singleton     bool    `json:"singleton" yaml:"singleton"`
	Required      bool    `json:"required" yaml:"required"`
	Identifier    bool    `json:"identifier" yaml:"identifier"`
	Regex         string  `json:"regex,omitempty" yaml:"regex,omitempty"`
	Values        []Value `json:"values,omitempty" yaml:"values,omitempty"`
}

// PartDeclaration ...
type PartDeclaration struct {
	RequiredClass string `json:"class" yaml:"class"`
	Context       string `json:"context" yaml:"context"`
	Singleton     bool   `json:"singleton" yaml:"singleton"`
	Required      bool   `json:"required" yaml:"required"`
}

// ParagraphDeclaration ...
type ParagraphDeclaration struct {
	RequiredClass string `json:"class" yaml:"class"`
	Context       string `json:"context" yaml:"context"`
	Singleton     bool   `json:"singleton" yaml:"singleton"`
	Required      bool   `json:"required" yaml:"required"`
}

// LinkDeclaration ...
type LinkDeclaration struct {
	Rel       string `json:"rel" yaml:"rel"`
	Context   string `json:"context" yaml:"context"`
	Singleton bool   `json:"singleton" yaml:"singleton"`
	Required  bool   `json:"required" yaml:"required"`
}

// Value ...
type Value struct {
	Inherit []Inherit `json:"inherit,omitempty" yaml:"inherit,omitempty"`
	Autonum []string  `json:"autonum,omitempty" yaml:"autonum,omitempty"`
	Value   string    `json:"value,omitempty" yaml:"value,omitempty"`
}

// Inherit ...
type Inherit struct {
	From  string `json:"from,omitempty" yaml:"from,omitempty"`
	Value string `json:"value" yaml:"value"`
}

// Section ...
type Section struct {
	ID            string      `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string      `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string      `json:"title" yaml:"title"`
	Prose         []Prose     `json:"prose,omitempty" yaml:"prose,omitempty"`
	Sections      []Section   `json:"sections,omitempty" yaml:"sections,omitempty"`
	Groups        []Group     `json:"groups,omitempty" yaml:"groups,omitempty"`
	References    []Reference `json:"references,omitempty" yaml:"references,omitempty"`
}

// Group ...
type Group struct {
	ID            string      `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string      `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string      `json:"title" yaml:"title"`
	Props         []Prop      `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []Part      `json:"parts,omitempty" yaml:"parts,omitempty"`
	Prose         []Prose     `json:"prose,omitempty" yaml:"prose,omitempty"`
	Groups        []Group     `json:"groups,omitempty" yaml:"groups,omitempty"`
	Controls      []Control   `json:"controls,omitempty" yaml:"controls,omitempty"`
	References    []Reference `json:"references,omitempty" yaml:"references,omitempty"`
}

// Control ...
type Control struct {
	ID            string       `json:"id" yaml:"id"`
	OptionalClass string       `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string       `json:"title" yaml:"title"`
	Params        []CoreParam  `json:"params,omitempty" yaml:"params,omitempty"`
	Props         []Prop       `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []Part       `json:"parts,omitempty" yaml:"parts,omitempty"`
	Links         []Link       `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []Prose      `json:"prose,omitempty" yaml:"prose,omitempty"`
	Subcontrols   []Subcontrol `json:"subcontrols,omitempty" yaml:"subcontrols,omitempty"`
	References    []Reference  `json:"references,omitempty" yaml:"references,omitempty"`
}

// Subcontrol ...
type Subcontrol struct {
	ID            string      `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string      `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string      `json:"title" yaml:"title"`
	Params        []CoreParam `json:"params,omitempty" yaml:"params,omitempty"`
	Props         []Prop      `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []Part      `json:"parts,omitempty" yaml:"parts,omitempty"`
	Links         []Link      `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []Prose     `json:"prose,omitempty" yaml:"prose,omitempty"`
	References    []Reference `json:"references,omitempty" yaml:"references,omitempty"`
}

// Part ...
type Part struct {
	ID            string      `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string      `json:"class,omitempty" yaml:"class,omitempty"`
	Title         string      `json:"title,omitempty" yaml:"title,omitempty"`
	Props         []Prop      `json:"props,omitempty" yaml:"props,omitempty"`
	Parts         []Part      `json:"parts,omitempty" yaml:"parts,omitempty"`
	Links         []Link      `json:"links,omitempty" yaml:"links,omitempty"`
	Prose         []Prose     `json:"prose,omitempty" yaml:"prose,omitempty"`
	Params        []CoreParam `json:"params,omitempty" yaml:"params,omitempty"`
}

// Link ...
type Link struct {
	Rel   string `json:"rel,omitempty"  yaml:"rel,omitempty"`
	Href  string `json:"href" yaml:"href"`
	Value string `json:"value,omitempty" yaml:"value,omitempty"`
}

// CoreParam ...
type CoreParam struct {
	ID            string `json:"id,omitempty" yaml:"id,omitempty"`
	OptionalClass string `json:"class,omitempty" yaml:"class,omitempty"`
	Description   string `json:"description" yaml:"description"`
	Value         string `json:"value" yaml:"value"`
}

// Prop ...
type Prop struct {
	RequiredClass string `json:"class,omitempty" yaml:"class,omitempty"`
	Value         string `json:"value,omitempty" yaml:"value,omitempty"`
}

// Reference ...
type Reference struct {
	ID        string     `json:"id" yaml:"id"`
	Standards []Standard `json:"standards,omitempty" yaml:"standards,omitempty"`
	Citations []Citation `json:"citations,omitempty" yaml:"citations,omitempty"`
	Prose     []Prose    `json:"prose,omitempty" yaml:"prose,omitempty"`
}

// Standard ...
type Standard struct {
	Href  string `json:"href" yaml:"href"`
	Value string `json:"value" yaml:"value"`
}

// Citation ...
type Citation struct {
	Href  string `json:"href" yaml:"href"`
	Value string `json:"value" yaml:"value"`
}

// Prose ...
type Prose struct {
	ID    string `json:"id,omitempty" yaml:"id,omitempty"`
	Class string `json:"class,omitempty" yaml:"class,omitempty"`
	Value string `json:"value" yaml:"value"`
}
