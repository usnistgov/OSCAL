package validator

import (
	"bytes"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/Sirupsen/logrus"
	"github.com/santhosh-tekuri/jsonschema"
)

// Validator ...
type Validator interface {
	Validate(file ...string) error
}

type jsonValidator struct {
	SchemaFile string
}

type xmlValidator struct {
	SchemaFile string
}

// New creates a Validator based on the specified schema file
func New(schemaFile string) Validator {
	switch filepath.Ext(schemaFile) {
	case ".json":
		return jsonValidator{SchemaFile: schemaFile}

	case ".xsd":
		return xmlValidator{SchemaFile: schemaFile}
	}

	return nil
}

// Validate validates one or more JSON files against a specific
// JSON schema.
func (j jsonValidator) Validate(file ...string) error {
	schema, err := jsonschema.Compile(j.SchemaFile)
	if err != nil {
		return fmt.Errorf("Error compiling OSCAL schema: %v", err)
	}

	logrus.Debugf("Validating %s against OSCAL schema", file)

	for _, f := range file {
		rawFile, err := os.Open(f)
		if err != nil {
			return fmt.Errorf("Error opening file: %s, %v", f, err)
		}
		defer rawFile.Close()

		if err = schema.Validate(rawFile); err != nil {
			return err
		}

		logrus.Debugf("%s is valid against JSON schema %s", f, j.SchemaFile)
	}

	return nil
}

// Validate validates one or more XML files against a specific
// XML schema (.xsd). Wrapper around `xmllint`
func (x xmlValidator) Validate(file ...string) error {
	for _, f := range file {
		rawFile, err := os.Open(f)
		if err != nil {
			return err
		}
		defer rawFile.Close()

		xmllintCmd := exec.Command("xmllint", "--schema", x.SchemaFile, f, "--noout")

		xmllintCmdOutput := &bytes.Buffer{}
		xmllintCmdErr := &bytes.Buffer{}
		xmllintCmd.Stdout = xmllintCmdOutput
		xmllintCmd.Stderr = xmllintCmdErr

		if err := xmllintCmd.Run(); err != nil {
			logrus.Error(string(xmllintCmdErr.Bytes()))
			continue
		}

		logrus.Infof("%s is valid against XML schema %s", f, x.SchemaFile)
	}

	return nil
}
