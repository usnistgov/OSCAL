// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package cmd

import (
	"path/filepath"

	"github.com/Sirupsen/logrus"
	"github.com/urfave/cli"
	"github.com/usnistgov/OSCAL/oscalkit/validator"
)

var schemaFile string

// Validate ...
var Validate = cli.Command{
	Name:  "validate",
	Usage: "validate files against OSCAL XML and JSON schemas",
	Description: `Validate OSCAL-formatted XML files against a specific XML schema (.xsd)
	 or OSCAL-formatted JSON files against a specific JSON schema`,
	ArgsUsage: "[files...]",
	Flags: []cli.Flag{
		cli.StringFlag{
			Name:        "schema, s",
			Usage:       "schema file to validate against",
			Destination: &schemaFile,
		},
	},
	Before: func(c *cli.Context) error {
		if c.NArg() < 1 {
			return cli.NewExitError("oscalkit validate requires at least one argument", 1)
		}

		if schemaFile == "" {
			return cli.NewExitError("missing schema file (-s) flag", 1)
		}

		for _, f := range c.Args() {
			if filepath.Ext(f) == ".xml" && filepath.Ext(schemaFile) != ".xsd" {
				return cli.NewExitError("Schema file should be .xsd", 1)
			}

			if filepath.Ext(f) == ".json" && filepath.Ext(schemaFile) != ".json" {
				return cli.NewExitError("Schema file should be .json", 1)
			}
		}

		return nil
	},
	Action: func(c *cli.Context) error {
		schemaValidator := validator.New(schemaFile)

		if err := schemaValidator.Validate(c.Args()...); err != nil {
			logrus.Error(err)
			return nil
		}

		logrus.Debug("Validation complete")

		return nil
	},
}
