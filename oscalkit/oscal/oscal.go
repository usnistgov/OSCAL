package oscal

import (
	"encoding/json"
	"encoding/xml"
	"errors"
	"io"
	"io/ioutil"

	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/profile"
)

// OSCAL ...
type OSCAL interface {
	Component() string
	RawJSON(prettify bool) ([]byte, error)
	RawYAML() ([]byte, error)
	RawXML() ([]byte, error)
	JSONType() interface{}
	XMLType() interface{}
}

// Options ...
type Options struct {
	Reader io.Reader
}

// New ...
func New(options Options) (OSCAL, error) {
	var err error

	rawOSCAL, err := ioutil.ReadAll(options.Reader)
	if err != nil {
		return nil, err
	}

	var catalog core.Catalog
	var declarations core.Declarations
	var framework core.Framework
	var oscalprofile profile.Profile

	if err = xml.Unmarshal(rawOSCAL, &catalog.CatalogXML); err == nil {
		return &catalog, nil
	} else if err = json.Unmarshal(rawOSCAL, &catalog.CatalogJSON); err == nil {
		return &catalog, nil
	} else if err = xml.Unmarshal(rawOSCAL, &declarations.DeclarationsXML); err == nil {
		return &declarations, nil
	} else if err = json.Unmarshal(rawOSCAL, &declarations.DeclarationsJSON); err == nil {
		return &declarations, nil
	} else if err = xml.Unmarshal(rawOSCAL, &framework.FrameworkXML); err == nil {
		return &framework, nil
	} else if err = json.Unmarshal(rawOSCAL, &framework.FrameworkJSON); err == nil {
		return &framework, nil
	} else if err = xml.Unmarshal(rawOSCAL, &oscalprofile.ProfileXML); err == nil {
		return &oscalprofile, nil
	} else if err = json.Unmarshal(rawOSCAL, &oscalprofile.ProfileJSON); err == nil {
		return &oscalprofile, nil
	}

	return nil, errors.New("Improperly formatted OSCAL")
}
