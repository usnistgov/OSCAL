// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package cmd

import (
	"os"

	"github.com/Sirupsen/logrus"
	"github.com/urfave/cli"
	"github.com/usnistgov/OSCAL/oscalkit/cmd/convert"
)

// Execute ...
func Execute() error {
	app := cli.NewApp()
	app.Name = "oscalkit"
	app.Usage = "OSCAL toolkit"
	app.Flags = []cli.Flag{
		cli.BoolFlag{
			Name:  "debug, d",
			Usage: "enable debug command output",
		},
	}
	app.Before = func(c *cli.Context) error {
		if c.Bool("debug") {
			logrus.SetLevel(logrus.DebugLevel)
		}

		return nil
	}
	app.Commands = []cli.Command{
		convert.Convert,
		Validate,
	}

	return app.Run(os.Args)
}
