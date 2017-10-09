package oscal

import (
	"testing"
)

func TestNewOSCAL(t *testing.T) {
	type args struct {
		rawOSCAL []byte
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
		{"newOSCALCatalog", args{[]byte(rawCatalog)}, &catalog{}, false},
		{"newOSCALDeclarations", args{[]byte(rawDeclarations)}, &declarations{}, false},
		{"newOSCALFramework", args{[]byte(rawFramework)}, &framework{}, false},
		{"newOSCALProfile", args{[]byte(rawProfile)}, &profile{}, false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := NewOSCAL(tt.args.rawOSCAL)
			if (err != nil) != tt.wantErr {
				t.Errorf("NewOSCAL() error = %v, wantErr %v", err, tt.wantErr)
				return
			}

			switch tt.name {
			case "newOSCALCatalog":
				if _, ok := got.(*catalog); !ok {
					t.Errorf("NewOSCAL() did not return OSCAL of type catalog")
				}
			case "newOSCALDeclarations":
				if _, ok := got.(*declarations); !ok {
					t.Errorf("NewOSCAL() did not return OSCAL of type declarations")
				}
			case "newOSCALFramework":
				if _, ok := got.(*framework); !ok {
					t.Errorf("NewOSCAL() did not return OSCAL of type framework")
				}
			case "newOSCALProfile":
				if _, ok := got.(*profile); !ok {
					t.Errorf("NewOSCAL() did not return OSCAL of type profile")
				}
			}
		})
	}
}
