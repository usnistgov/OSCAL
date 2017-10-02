package jsontypes

// Profile ...
type Profile struct {
	ID      string    `json:"id,omitempty" yaml:"id,omitempty"`
	Invoke  string    `json:"invoke" yaml:"invoke"`
	Include []Include `json:"include,omitempty" yaml:"include,omitempty"`
	Exclude []Call    `json:"exclude,omitempty" yaml:"exclude,omitempty"`
}

// Include ...
type Include struct {
	All             bool           `json:"all" yaml:"all"`
	WithSubcontrols bool           `json:"withSubcontrols" yaml:"withSubcontrols"`
	Calls           []Call         `json:"calls" yaml:"calls"`
	Params          []ProfileParam `json:"params" yaml:"params"`
}

// ProfileParam ...
type ProfileParam struct {
	ID            string   `json:"id" yaml:"id"`
	OptionalClass string   `json:"class,omitempty" yaml:"class,omitempty"`
	ParamValues   []string `json:"values" yaml:"values"`
}

// Call ...
type Call struct {
	ControlID    string `json:"controlId,omitempty" yaml:"controlId,omitempty"`
	SubcontrolID string `json:"subcontrolId,omitempty" yaml:"subcontrolId,omitempty"`
}
