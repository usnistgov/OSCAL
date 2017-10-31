package oscal

import (
	"strings"
	"testing"

	"github.com/usnistgov/OSCAL/oscalkit/oscal/core"
	"github.com/usnistgov/OSCAL/oscalkit/oscal/profile"
)

func TestOSCAL(t *testing.T) {
	type args struct {
		options Options
	}

	rawCatalog := `<catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0"></catalog>`
	rawDeclarations := `<declarations xmlns="http://csrc.nist.gov/ns/oscal/1.0"></declarations>`
	rawFramework := `<framework xmlns="http://csrc.nist.gov/ns/oscal/1.0"></framework>`
	rawProfile := `<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"></profile>`

	tests := []struct {
		name    string
		args    args
		want    OSCAL
		wantErr bool
	}{
		{"newOSCALCatalog", args{Options{strings.NewReader(rawCatalog)}}, &core.Catalog{}, false},
		{"newOSCALDeclarations", args{Options{strings.NewReader(rawDeclarations)}}, &core.Declarations{}, false},
		{"newOSCALFramework", args{Options{strings.NewReader(rawFramework)}}, &core.Framework{}, false},
		{"newOSCALProfile", args{Options{strings.NewReader(rawProfile)}}, &profile.Profile{}, false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := New(tt.args.options)
			if (err != nil) != tt.wantErr {
				t.Errorf("NewOSCAL() error = %v, wantErr %v", err, tt.wantErr)
				return
			}

			switch tt.name {
			case "newOSCALCatalog":
				if _, ok := got.(*core.Catalog); !ok {
					t.Errorf("NewOSCAL() did not return OSCAL of type catalog")
				}
			case "newOSCALDeclarations":
				if _, ok := got.(*core.Declarations); !ok {
					t.Errorf("NewOSCAL() did not return OSCAL of type declarations")
				}
			case "newOSCALFramework":
				if _, ok := got.(*core.Framework); !ok {
					t.Errorf("NewOSCAL() did not return OSCAL of type framework")
				}
			case "newOSCALProfile":
				if _, ok := got.(*profile.Profile); !ok {
					t.Errorf("NewOSCAL() did not return OSCAL of type profile")
				}
			}
		})
	}
}
