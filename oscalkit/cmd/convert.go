package cmd

import (
	"fmt"
	"io/ioutil"
	"os"
	"path"
	"strings"

	"github.com/Sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/usnistgov/OSCAL/oscalkit/oscal"
)

var outputPath string
var yaml bool

var convertCmd = &cobra.Command{
	Use:   "convert [source-files...]",
	Short: "Convert between OSCAL XML and JSON",
	Args:  cobra.MinimumNArgs(1),
	RunE: func(cmd *cobra.Command, args []string) error {
		for _, sourcePath := range args {
			if path.Ext(sourcePath) == ".xml" {
				logrus.Debug("Converting XML to JSON")

				f, err := os.Open(sourcePath)
				if err != nil {
					return err
				}
				defer f.Close()

				rawXML, err := ioutil.ReadAll(f)
				if err != nil {
					return err
				}

				oscal, err := oscal.NewOSCAL(rawXML)
				if err != nil {
					return err
				}

				oscalJSON, err := oscal.RawJSON()
				if err != nil {
					return err
				}

				if yaml {
					oscalYAML, err := oscal.RawYAML()
					if err != nil {
						return err
					}

					if err := writeFile(sourcePath, ".yml", oscalYAML); err != nil {
						return err
					}
				}

				if err := writeFile(sourcePath, ".json", oscalJSON); err != nil {
					return err
				}

				logrus.Debug("XML converted successfully")
			} else {
				return fmt.Errorf("Source file %s is not of type xml or json", sourcePath)
			}
		}

		return nil
	},
}

func writeFile(filePath string, ext string, data []byte) error {
	filePath = fmt.Sprintf("%s%s", strings.Split(path.Base(filePath), ".")[0], ext)

	if outputPath != "" {
		filePath = path.Join(outputPath, filePath)
	}

	return ioutil.WriteFile(filePath, data, 0644)
}

func init() {
	convertCmd.Flags().StringVarP(&outputPath, "outputPath", "o", "", "Output path for JSON file(s). Defaults to current directory")
	convertCmd.Flags().BoolVarP(&yaml, "yaml", "y", false, "If source file is XML or JSON, also generate YAML output")
}
