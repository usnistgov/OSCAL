package core

// CoreJSON ...
type CoreJSON struct {
	Catalog      *CatalogJSON      `json:"catalog,omitempty" yaml:"catalog,omitempty"`
	Declarations *DeclarationsJSON `json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Framework    *FrameworkJSON    `json:"framework,omitempty" yaml:"framework,omitempty"`
}
