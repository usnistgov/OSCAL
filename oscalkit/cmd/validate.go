package cmd

import (
	"fmt"
	"path/filepath"

	"github.com/Sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/usnistgov/OSCAL/oscalkit/validator"
)

var schemaFile string

var validateCmd = &cobra.Command{
	Use:   "validate [file ...]",
	Short: "Validate files against OSCAL XML or JSON schemas",
	Args:  cobra.MinimumNArgs(1),
	PreRunE: func(cmd *cobra.Command, args []string) error {
		if schemaFile == "" {
			return fmt.Errorf("missing schema file (-s) flag")
		}

		for _, f := range args {
			if filepath.Ext(f) == ".xml" && filepath.Ext(schemaFile) != ".xsd" {
				return fmt.Errorf("Schema file should be .xsd")
			}

			if filepath.Ext(f) == ".json" && filepath.Ext(schemaFile) != ".json" {
				return fmt.Errorf("Schema file should be .json")
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
