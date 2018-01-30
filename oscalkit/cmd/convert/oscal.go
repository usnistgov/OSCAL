// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package convert

import (
	"encoding/json"
	"encoding/xml"
	"errors"
	"fmt"
	"io/ioutil"
	"os"
	"path"
	"path/filepath"
	"strings"

	"github.com/Sirupsen/logrus"
	"github.com/urfave/cli"
	"github.com/usnistgov/OSCAL/oscalkit/oscal"
)

var outputPath string
var outputFile string

// ConvertOSCAL ...
var ConvertOSCAL = cli.Command{
	Name:  "oscal",
	Usage: "convert between one or more OSCAL file formats",
	Description: `Convert between OSCAL-formatted XML and JSON files. The command accepts
   one or more source file paths and can also be used with source file contents
	 piped/redirected from STDIN.`,
	ArgsUsage: "[source-files...]",
	Flags: []cli.Flag{
		cli.StringFlag{
			Name:        "output-path, o",
			Usage:       "Output path for converted file(s). Defaults to current working directory",
			Destination: &outputPath,
		},
		cli.StringFlag{
			Name:        "output-file, f",
			Usage:       `file name for converted output from STDIN. Defaults to "stdin.<json|xml|yaml>"`,
			Destination: &outputFile,
		},
		cli.BoolFlag{
			Name:        "include-yaml",
			Usage:       "If source file format is XML or JSON, also generate equivalent YAML output",
			Destination: &yaml,
		},
	},
	Before: func(c *cli.Context) error {
		if c.NArg() < 1 {
			// Check for stdin
			stat, _ := os.Stdin.Stat()
			if (stat.Mode() & os.ModeCharDevice) == 0 {
				return nil
			}

			return cli.NewExitError("oscalkit convert requires at least one argument", 1)
		}

		if c.NArg() > 1 {
			for _, arg := range c.Args() {
				// Prevent the use of both stdin and specific source files
				if arg == "-" {
					return cli.NewExitError("Cannot use both file path and '-' (STDIN) in args", 1)
				}
			}
		}

		if c.Args().First() != "-" && outputFile != "" {
			return cli.NewExitError("--output-file (-f) is only used when converting from STDIN (-)", 1)
		}

		return nil
	},
	Action: func(c *cli.Context) error {
		// Parse stdin via pipe or redirection
		if c.NArg() <= 0 || c.Args().First() == "-" {
			rawSource, err := parseStdin(os.Stdin)
			if err != nil {
				return cli.NewExitError(fmt.Sprintf("Error parsing from STDIN: %s", err), 1)
			}

			return convert(rawSource, "")
		}

		// Convert each source file
		for _, sourcePath := range c.Args() {
			matches, _ := filepath.Glob(sourcePath)
			if len(matches) > 0 {
				for _, match := range matches {
					if err := convert(nil, match); err != nil {
						return cli.NewExitError(fmt.Sprintf("Error converting to OSCAL from source: %s", err), 1)
					}
				}
			} else {
				if err := convert(nil, sourcePath); err != nil {
					return cli.NewExitError(fmt.Sprintf("Error converting to OSCAL from source: %s", err), 1)
				}
			}
		}

		return nil
	},
}

func parseStdin(stdin *os.File) ([]byte, error) {
	rawSource, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		return nil, err
	}

	var xmls string
	var jsons string

	if err = xml.Unmarshal(rawSource, &xmls); err == nil {
		if outputFile == "" {
			outputFile = "stdin.xml"
		}

	} else if err = json.Unmarshal(rawSource, &jsons); err == nil {
		if outputFile == "" {
			outputFile = "stdin.json"
		}
	} else {
		return nil, errors.New("File content from STDIN is neither XML nor JSON")
	}

	return rawSource, nil
}

// Not yet parsing rawSource arg for STDIN
func convert(rawSource []byte, sourcePath string) error {
	f, err := os.Open(sourcePath)
	if err != nil {
		return err
	}
	defer f.Close()

	switch filepath.Ext(sourcePath) {
	case ".xml":
		logrus.Debug("Converting XML to JSON")

		oscal, err := oscal.New(oscal.Options{Reader: f})
		if err != nil {
			return err
		}

		oscalJSON, err := oscal.Raw("json", true)
		if err != nil {
			return err
		}

		if err := writeFile(filepath.Base(sourcePath), ".json", oscalJSON); err != nil {
			return err
		}

		logrus.Infof("XML file %s successfully converted to JSON", sourcePath)

		if yaml {
			oscalYAML, err := oscal.Raw("yml", false)
			if err != nil {
				return err
			}

			if err := writeFile(filepath.Base(sourcePath), ".yaml", oscalYAML); err != nil {
				return err
			}

			logrus.Infof("XML file %s successfully converted to YAML", sourcePath)
		}

	case ".json":
		logrus.Debug("Converting JSON to XML")

		oscal, err := oscal.New(oscal.Options{Reader: f})
		if err != nil {
			return err
		}

		oscalXML, err := oscal.Raw("xml", true)
		if err != nil {
			return err
		}

		if err := writeFile(filepath.Base(sourcePath), ".xml", oscalXML); err != nil {
			return err
		}

		logrus.Infof("JSON file %s successfully converted to XML", sourcePath)

	default:
		return fmt.Errorf("Source file extension %s is not a supported extension", filepath.Ext(sourcePath))
	}

	return nil
}

func writeFile(filePath string, ext string, data []byte) error {
	filePath = fmt.Sprintf("%s%s", strings.Split(path.Base(filePath), ".")[0], ext)

	if outputPath != "" {
		filePath = path.Join(outputPath, filePath)
	}

	return ioutil.WriteFile(filePath, data, 0644)
}
