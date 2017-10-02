package cmd

import (
	"os"

	"github.com/Sirupsen/logrus"
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   os.Args[0],
	Short: "OSCAL toolkit",
	PersistentPreRunE: func(cmd *cobra.Command, args []string) error {
		debug, err := cmd.Flags().GetBool("debug")
		if err != nil {
			return err
		}
		if debug {
			logrus.SetLevel(logrus.DebugLevel)
		}

		return nil
	},
}

func init() {
	rootCmd.PersistentFlags().BoolP("debug", "d", false, "enable verbose logging")
	rootCmd.AddCommand(
		convertCmd,
		validateCmd,
	)
}

// Execute ...
func Execute() error {
	return rootCmd.Execute()
}
