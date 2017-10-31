package cmd

import "testing"

func TestRootCommandHasAllSubCommands(t *testing.T) {
	cmd := rootCmd

	expectedCmds := []string{
		"convert",
		"validate",
	}

	actualCmds := []string{}
	for _, subCmd := range cmd.Commands() {
		actualCmds = append(actualCmds, subCmd.Name())
	}

	for i, actualCmd := range actualCmds {
		if expectedCmds[i] != actualCmd {
			t.Errorf("oscalkit subcommands missing")
		}
	}
}

func TestExecute(t *testing.T) {
	tests := []struct {
		name    string
		wantErr bool
	}{
		{"returns-usage", true},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if err := Execute(); (err != nil) != tt.wantErr {
				t.Errorf("Execute() error = %v, wantErr %v", err, tt.wantErr)
			}
		})
	}
}
