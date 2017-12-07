// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package convert

import (
	"io/ioutil"

	"github.com/urfave/cli"
	"github.com/usnistgov/OSCAL/oscalkit/oscal"
)

// ConvertOpenControl ...
var ConvertOpenControl = cli.Command{
	Name:  "opencontrol",
	Usage: `convert from OpenControl format to OSCAL "implementation" format`,
	Description: `Convert OpenControl-formatted "component" and "opencontrol" YAML into
	 OSCAL-formatted "implementation" layer JSON`,
	ArgsUsage: "[opencontrol.yaml-filepath]",
	Before: func(c *cli.Context) error {
		if c.NArg() != 1 {
			return cli.NewExitError("Missing opencontrol.yaml file", 1)
		}

		return nil
	},
	Action: func(c *cli.Context) error {
		ocOSCAL, err := oscal.NewFromOC(oscal.OpenControlOptions{
			OpenControlYAMLFilepath: c.Args().First(),
			OpenControlsDir:         c.Args()[1],
		})
		if err != nil {
			return err
		}

		rawOCOSCAL, err := ocOSCAL.Raw("json", true)
		if err != nil {
			return err
		}

		return ioutil.WriteFile("opencontrol-oscal.json", rawOCOSCAL, 0644)
	},
}
