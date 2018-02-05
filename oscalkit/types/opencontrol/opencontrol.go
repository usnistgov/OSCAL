package opencontrol

// OpenControl ...
type OpenControl struct {
	Name           string        `yaml:"name"`
	SchemaVersion  string        `yaml:"schema_version"`
	Metadata       *Metadata     `yaml:"metadata"`
	Components     []string      `yaml:"components"`
	Certifications []string      `yaml:"certifications"`
	Standards      []string      `yaml:"standards"`
	Dependencies   *Dependencies `yaml:"dependencies"`
}

// Metadata ...
type Metadata struct {
	Description string   `yaml:"description"`
	Maintainers []string `yaml:"maintainers"`
}

// Dependencies ...
type Dependencies struct {
	Certifications []Certification `yaml:"certifications"`
	Standards      []Standard      `yaml:"standards"`
	Systems        []System        `yaml:"systems"`
}

// Certification ...
type Certification struct {
	URL      string `yaml:"url"`
	Revision string `yaml:"revision"`
}

// Standard ...
type Standard struct {
	URL      string `yaml:"url"`
	Revision string `yaml:"revision"`
}

// System ...
type System struct {
	URL      string `yaml:"url"`
	Revision string `yaml:"revision"`
}
