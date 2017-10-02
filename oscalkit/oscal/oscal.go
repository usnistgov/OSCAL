package oscal

import (
	"encoding/json"
	"encoding/xml"
	"fmt"

	"github.com/usnistgov/OSCAL/oscalkit/converter"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/jsontypes"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/xmltypes"
	yaml "gopkg.in/yaml.v2"
)

// OSCAL ...
type OSCAL interface {
	Component() string
	RawJSON() ([]byte, error)
	RawYAML() ([]byte, error)
	RawXML() ([]byte, error)
	JSONType() interface{}
	XMLType() interface{}
}

type catalog struct {
	XML  *xmltypes.Catalog
	JSON *jsontypes.Catalog
}

type declarations struct {
	XML  *xmltypes.Declarations
	JSON *jsontypes.Declarations
}

type framework struct {
	XML  *xmltypes.Framework
	JSON *jsontypes.Framework
}

type profile struct {
	XML  *xmltypes.Profile
	JSON *jsontypes.Profile
}

// NewOSCAL ...
func NewOSCAL(rawOSCAL []byte) (OSCAL, error) {
	var err error

	var catalog catalog
	var declarations declarations
	var framework framework
	var profile profile

	if err = xml.Unmarshal(rawOSCAL, &catalog.XML); err == nil {
		return &catalog, nil
	} else if err = json.Unmarshal(rawOSCAL, &catalog.JSON); err == nil {
		return &catalog, nil
	} else if err = xml.Unmarshal(rawOSCAL, &declarations.XML); err == nil {
		return &declarations, nil
	} else if err = json.Unmarshal(rawOSCAL, &declarations.JSON); err == nil {
		return &declarations, nil
	} else if err = xml.Unmarshal(rawOSCAL, &framework.XML); err == nil {
		return &framework, nil
	} else if err = json.Unmarshal(rawOSCAL, &framework.JSON); err == nil {
		return &framework, nil
	} else if err = xml.Unmarshal(rawOSCAL, &profile.XML); err == nil {
		return &profile, nil
	} else if err = json.Unmarshal(rawOSCAL, &profile.JSON); err == nil {
		return &profile, nil
	}

	return nil, fmt.Errorf("Error unmarshaling rawOSCAL: %v", err)
}

func (p *profile) Component() string {
	return "profile"
}
func (p *profile) RawJSON() ([]byte, error) {
	p.JSON = converter.ProfileToJSON(p.XML)

	return json.Marshal(p.JSON)
}
func (p *profile) RawYAML() ([]byte, error) {
	p.JSON = converter.ProfileToJSON(p.XML)

	return yaml.Marshal(p.JSON)
}
func (p *profile) RawXML() ([]byte, error) {
	return nil, nil
}
func (p *profile) JSONType() interface{} {
	return p.JSON
}
func (p *profile) XMLType() interface{} {
	return p.XML
}

func (c *catalog) Component() string {
	return "catalog"
}
func (c *catalog) RawJSON() ([]byte, error) {
	c.JSON = converter.CatalogToJSON(c.XML)

	return json.Marshal(c.JSON)
}
func (c *catalog) RawYAML() ([]byte, error) {
	c.JSON = converter.CatalogToJSON(c.XML)

	return yaml.Marshal(c.JSON)
}
func (c *catalog) RawXML() ([]byte, error) {
	return nil, nil
}
func (c *catalog) JSONType() interface{} {
	return c.JSON
}
func (c *catalog) XMLType() interface{} {
	return c.XML
}

func (d *declarations) Component() string {
	return "declarations"
}
func (d *declarations) RawJSON() ([]byte, error) {
	d.JSON = converter.DeclarationsToJSON(d.XML)

	return json.Marshal(d.JSON)
}
func (d *declarations) RawYAML() ([]byte, error) {
	d.JSON = converter.DeclarationsToJSON(d.XML)

	return yaml.Marshal(d.JSON)
}
func (d *declarations) RawXML() ([]byte, error) {
	return nil, nil
}
func (d *declarations) JSONType() interface{} {
	return d.JSON
}
func (d *declarations) XMLType() interface{} {
	return d.XML
}

func (f *framework) Component() string {
	return "framework"
}
func (f *framework) RawJSON() ([]byte, error) {
	f.JSON = converter.FrameworkToJSON(f.XML)

	return json.Marshal(f.JSON)
}
func (f *framework) RawYAML() ([]byte, error) {
	f.JSON = converter.FrameworkToJSON(f.XML)

	return yaml.Marshal(f.JSON)
}
func (f *framework) RawXML() ([]byte, error) {
	return nil, nil
}
func (f *framework) JSONType() interface{} {
	return f.JSON
}
func (f *framework) XMLType() interface{} {
	return f.XML
}
