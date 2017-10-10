package cmd

import (
	"errors"
	"path/filepath"

	"github.com/Sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/usnistgov/OSCAL/oscalkit/validator"
)

var schemaFile string

var validateCmd = &cobra.Command{
	Use:   "validate [OPTIONS] [file ...]",
	Short: "Validate files against OSCAL XML or JSON schemas",
	Long: `Validate OSCAL-formatted XML files against a specific XML schema (.xsd)
or OSCAL-formatted JSON files against a specific JSON schema`,
	Example: `  oscalkit validate -s oscal-core.xsd oscal-catalog.xml
  oscalkit validate -s oscal-core.json oscal-catalog.json`,
	Args: func(cmd *cobra.Command, args []string) error {
		if len(args) < 1 {
			return errors.New("oscalkit validate requires at least one argument")
		}

		return nil
	},
	PreRunE: func(cmd *cobra.Command, args []string) error {
		if schemaFile == "" {
			return errors.New("missing schema file (-s) flag")
		}

		for _, f := range args {
			if filepath.Ext(f) == ".xml" && filepath.Ext(schemaFile) != ".xsd" {
				return errors.New("Schema file should be .xsd")
			}

			if filepath.Ext(f) == ".json" && filepath.Ext(schemaFile) != ".json" {
				return errors.New("Schema file should be .json")
			}
		}

		return nil
	},
	Run: func(cmd *cobra.Command, args []string) {
		schemaValidator := validator.New(schemaFile)

		if err := schemaValidator.Validate(args...); err != nil {
			logrus.Error(err)
			return
		}

		logrus.Debug("Validation complete")

		return
	},
}

func init() {
	validateCmd.Flags().StringVarP(&schemaFile, "schema", "s", "", "Schema file to validate against")
}
