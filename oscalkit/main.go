package main

import (
	"os"

	"github.com/usnistgov/OSCAL/oscalkit/cmd"
)

func main() {
	if err := cmd.Execute(); err != nil {
		os.Exit(1)
	}
}
