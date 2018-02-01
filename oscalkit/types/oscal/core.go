// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package oscal

import (
	"encoding/json"
	"encoding/xml"

	yaml "gopkg.in/yaml.v2"
)

// Core ...
type Core struct {
	XMLName      xml.Name      `json:"-" yaml:"-"`
	Catalog      *Catalog      `json:"catalog,omitempty" yaml:"catalog,omitempty"`
	Declarations *Declarations `json:"declarations,omitempty" yaml:"declarations,omitempty"`
	Framework    *Framework    `json:"framework,omitempty" yaml:"framework,omitempty"`
	Worksheet    *Worksheet    `json:"worksheet,omitempty" yaml:"worksheet,omitempty"`
}

var _ OSCAL = (*Core)(nil)

// MarshalXML ...
func (c *Core) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	if c.Catalog != nil {
		c.XMLName = c.Catalog.XMLName
		if err := e.Encode(c.Catalog); err != nil {
			return err
		}
	} else if c.Declarations != nil {
		c.XMLName = c.Declarations.XMLName
		if err := e.Encode(c.Declarations); err != nil {
			return err
		}
	} else if c.Framework != nil {
		c.XMLName = c.Framework.XMLName
		if err := e.Encode(c.Framework); err != nil {
			return err
		}
	} else if c.Worksheet != nil {
		c.XMLName = c.Worksheet.XMLName
		if err := e.Encode(c.Worksheet); err != nil {
			return err
		}
	}

	return nil
}

// UnmarshalXML ...
func (c *Core) UnmarshalXML(d *xml.Decoder, start xml.StartElement) error {
	switch start.Name.Local {
	case "catalog":
		var catalog Catalog
		if err := d.DecodeElement(&catalog, &start); err != nil {
			return err
		}

		c.Catalog = &catalog

	case "declarations":
		var declarations Declarations
		if err := d.DecodeElement(&declarations, &start); err != nil {
			return err
		}

		c.Declarations = &declarations

	case "framework":
		var framework Framework
		if err := d.DecodeElement(&framework, &start); err != nil {
			return err
		}

		c.Framework = &framework

	case "worksheet":
		var worksheet Worksheet
		if err := d.DecodeElement(&worksheet, &start); err != nil {
			return err
		}

		c.Worksheet = &worksheet
	}

	return nil
}

// Component ...
func (Core) Component() string {
	return "core"
}

// RawXML ...
func (c *Core) RawXML(prettify bool) ([]byte, error) {
	if prettify {
		return xml.MarshalIndent(c, "", "  ")
	}
	return xml.Marshal(c)
}

// RawJSON ...
func (c *Core) RawJSON(prettify bool) ([]byte, error) {
	if prettify {
		return json.MarshalIndent(c, "", "  ")
	}
	return json.Marshal(c)
}

// RawYAML ...
func (c *Core) RawYAML() ([]byte, error) {
	return yaml.Marshal(c)
}
