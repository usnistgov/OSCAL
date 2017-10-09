package cmd

import (
	"encoding/json"
	"encoding/xml"
	"errors"
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
var outputFile string
var yaml bool

var convertCmd = &cobra.Command{
	Use:   "convert [source-files...]|-",
	Short: "Convert between one or more OSCAL XML and JSON files or from STDIN",
	Long: `Convert between OSCAL-formatted XML and JSON files. The command accepts
one or more source file paths and can also be used with source file contents
piped/redirected from STDIN.`,
	Args: func(cmd *cobra.Command, args []string) error {
		if len(args) < 1 {
			stat, _ := os.Stdin.Stat()
			if (stat.Mode() & os.ModeCharDevice) == 0 {
				return nil
			}

			return errors.New("Must specify at least one argument")
		}

		if len(args) > 1 {
			for _, arg := range args {
				if arg == "-" {
					return errors.New("Cannot use both file path and '-' (STDIN) in args")
				}
			}
		}

		if args[0] != "-" && outputFile != "" {
			return errors.New("--output-file (-f) is only used when converting from STDIN (-)")
		}

		return nil
	},
	RunE: func(cmd *cobra.Command, args []string) error {
		if len(args) <= 0 || args[0] == "-" {
			rawSource, err := ioutil.ReadAll(os.Stdin)
			if err != nil {
				return err
			}

			var xmls string
			var jsons string

			if err = xml.Unmarshal(rawSource, &xmls); err == nil {
				if outputFile == "" {
					outputFile = "stdin.xml"
				}

				return convert(rawSource, ".xml", outputFile)
			} else if err = json.Unmarshal(rawSource, &jsons); err == nil {
				if outputFile == "" {
					outputFile = "stdin.json"
				}

				return convert(rawSource, ".json", outputFile)
			}

			return errors.New("File content from STDIN is neither XML nor JSON")
		}

		for _, sourcePath := range args {
			f, err := os.Open(sourcePath)
			if err != nil {
				return err
			}
			defer f.Close()

			rawSource, err := ioutil.ReadAll(f)
			if err != nil {
				return err
			}

			return convert(rawSource, path.Ext(sourcePath), sourcePath)
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

// Need to clean up this function
func convert(rawSource []byte, sourceFileExt string, sourceFilename string) error {
	switch sourceFileExt {
	case ".xml":
		logrus.Debug("Converting XML to JSON")

		oscal, err := oscal.NewOSCAL(rawSource)
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

			if err := writeFile(sourceFilename, ".yml", oscalYAML); err != nil {
				return err
			}
		}

		if err := writeFile(sourceFilename, ".json", oscalJSON); err != nil {
			return err
		}

		logrus.Debug("XML converted successfully")

	default:
		return fmt.Errorf("Source file extension %s is not a supported extension", sourceFileExt)
	}

	return nil
}

func init() {
	convertCmd.Flags().StringVarP(&outputPath, "output-path", "p", "", "Output path for converted file(s). Defaults to current working directory")
	convertCmd.Flags().StringVarP(&outputFile, "output-file", "o", "", "File name for converted output from STDIN")
	convertCmd.Flags().BoolVarP(&yaml, "yaml", "y", false, "If source file is XML or JSON, also generate YAML output")
}
