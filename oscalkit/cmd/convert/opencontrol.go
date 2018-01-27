// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package convert

import (
	"fmt"
	"io/ioutil"

	"github.com/urfave/cli"
	"github.com/usnistgov/OSCAL/oscalkit/oscal"
)

var includeXML bool

// ConvertOpenControl ...
var ConvertOpenControl = cli.Command{
	Name:  "opencontrol",
	Usage: `convert from OpenControl format to OSCAL "implementation" format`,
	Description: `Convert OpenControl-formatted "component" and "opencontrol" YAML into
	 OSCAL-formatted "implementation" layer JSON`,
	ArgsUsage: "[opencontrol.yaml-filepath] [opencontrols-dir-path]",
	Flags: []cli.Flag{
		cli.BoolFlag{
			Name:        "yaml, y",
			Usage:       "Generate YAML in addition to JSON",
			Destination: &yaml,
		},
		cli.BoolFlag{
			Name:        "xml, x",
			Usage:       "Generate XML in addition to JSON",
			Destination: &includeXML,
		},
	},
	Before: func(c *cli.Context) error {
		if c.NArg() != 2 {
			return cli.NewExitError("Missing opencontrol.yaml file and path to opencontrols/ directory", 1)
		}

		return nil
	},
	Action: func(c *cli.Context) error {
		ocOSCAL, err := oscal.NewFromOC(oscal.OpenControlOptions{
			OpenControlYAMLFilepath: c.Args().First(),
			OpenControlsDir:         c.Args()[1],
		})
		if err != nil {
			return cli.NewExitError(err, 1)
		}

		if includeXML {
			rawXMLOCOSCAL, err := ocOSCAL.Raw("xml", true)
			if err != nil {
				return cli.NewExitError(fmt.Sprintf("Error producing raw XML: %s", err), 1)
			}
			if err := ioutil.WriteFile("opencontrol-oscal.xml", rawXMLOCOSCAL, 0644); err != nil {
				return cli.NewExitError(err, 1)
			}
		}

		if yaml {
			rawYAMLOCOSCAL, err := ocOSCAL.Raw("yaml", true)
			if err != nil {
				return cli.NewExitError(err, 1)
			}
			if err := ioutil.WriteFile("opencontrol-oscal.yaml", rawYAMLOCOSCAL, 0644); err != nil {
				return cli.NewExitError(err, 1)
			}
		}

		rawOCOSCAL, err := ocOSCAL.Raw("json", true)
		if err != nil {
			return cli.NewExitError(err, 1)
		}

		if err := ioutil.WriteFile("opencontrol-oscal.json", rawOCOSCAL, 0644); err != nil {
			return cli.NewExitError(err, 1)
		}

		return nil
	},
}
