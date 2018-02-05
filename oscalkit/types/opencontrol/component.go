package opencontrol

// Component ...
type Component struct {
	Name                  string         `yaml:"name"`
	Key                   string         `yaml:"key"`
	System                string         `yaml:"system"`
	SchemaVersion         string         `yaml:"schema_version"`
	DocumentationComplete string         `yaml:"documentation_complete"`
	ResponsibleRole       string         `yaml:"responsible_role"`
	References            []Reference    `yaml:"references"`
	Verifications         []Verification `yaml:"verifications"`
	Satisfies             []Satisfy      `yaml:"satisfies"`
}

// Reference ...
type Reference struct {
	Name string `yaml:"name"`
	Path string `yaml:"path"`
	Type string `yaml:"type"`
}

// Verification ...
type Verification struct {
	Key         string      `yaml:"key"`
	Name        string      `yaml:"name"`
	Path        string      `yaml:"path"`
	Type        string      `yaml:"type"`
	Description string      `yaml:"description"`
	TestPassed  bool        `yaml:"test_passed"`
	LastRun     interface{} `yaml:"last_run"`
}

// Satisfy ...
type Satisfy struct {
	StandardKey            string      `yaml:"standard_key"`
	ControlKey             string      `yaml:"control_key"`
	Narrative              []Narrative `yaml:"narrative"`
	ControlOrigin          string      `yaml:"control_origin"`
	ControlOrigins         []string    `yaml:"control_origins"`
	Parameters             []Parameter `yaml:"parameters"`
	ImplementationStatus   string      `yaml:"implementation_status"`
	ImplementationStatuses []string    `yaml:"implementation_statuses"`
	CoveredBy              []CoveredBy `yaml:"covered_by"`
}

// Narrative ...
type Narrative struct {
	Key  string `yaml:"key"`
	Text string `yaml:"text"`
}

// Parameter ...
type Parameter struct {
	Key  string `yaml:"key"`
	Text string `yaml:"text"`
}

// CoveredBy ...
type CoveredBy struct {
	SystemKey       string `yaml:"system_key"`
	ComponentKey    string `yaml:"component_key"`
	VerificationKey string `yaml:"verification_key"`
}
