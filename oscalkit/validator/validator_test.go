// oscalkit - OSCAL conversion utility
// Written in 2017 by Andrew Weiss <andrew.weiss@docker.com>

// To the extent possible under law, the author(s) have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.

// You should have received a copy of the CC0 Public Domain Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

package validator

import (
	"errors"
	"reflect"
	"testing"
)

type mockValidator struct{}

func (m mockValidator) Validate(files ...string) error {
	if len(files) <= 0 {
		return errors.New("No files to validate")
	}

	return nil
}

func TestNew(t *testing.T) {
	type args struct {
		schemaFile string
	}
	tests := []struct {
		name string
		args args
		want Validator
	}{
		{"newXMLValidator", args{"test.xsd"}, xmlValidator{"test.xsd"}},
		{"newJSONValidator", args{"test.json"}, jsonValidator{"test.json"}},
		{"nilValidator", args{"test.nil"}, nil},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := New(tt.args.schemaFile); !reflect.DeepEqual(got, tt.want) {
				t.Errorf("New() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestValidator(t *testing.T) {
	type args struct {
		files []string
	}
	tests := []struct {
		name    string
		args    args
		wantErr bool
	}{
		{"validation succeeded", args{[]string{""}}, false},
		{"validation failed", args{}, true},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			mock := mockValidator{}
			if err := mock.Validate(tt.args.files...); (err != nil) != tt.wantErr {
				t.Errorf("Validation failed %v", err)
			}
		})
	}

}

func TestJSONValidate(t *testing.T) {
	const profileSchema = "../../schema/json/oscal-profile.json"

	type fields struct {
		SchemaFile string
	}
	type args struct {
		file []string
	}
	tests := []struct {
		name    string
		fields  fields
		args    args
		wantErr bool
	}{
		{
			name:    "successful-validation",
			fields:  fields{profileSchema},
			args:    args{[]string{"../../examples/01_identity-profile.json"}},
			wantErr: false,
		},
		{
			name:    "failed-validation-non-existent-schema-file",
			fields:  fields{"./oscal-profile.failed"},
			args:    args{[]string{"../../examples/01_identity-profile.json"}},
			wantErr: true,
		},
		{
			name:    "failed-validation-non-existent-file",
			fields:  fields{profileSchema},
			args:    args{[]string{"./profile.failed"}},
			wantErr: true,
		},
		{
			name:    "failed-validation-not-oscal-formatted",
			fields:  fields{profileSchema},
			args:    args{[]string{"./notoscal.json"}},
			wantErr: true,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			j := jsonValidator{
				SchemaFile: tt.fields.SchemaFile,
			}
			if err := j.Validate(tt.args.file...); (err != nil) != tt.wantErr {
				t.Errorf("jsonValidator.Validate() error = %v, wantErr %v", err, tt.wantErr)
			}
		})
	}
}

func TestXMLValidate(t *testing.T) {
	type fields struct {
		SchemaFile string
	}
	type args struct {
		file []string
	}
	tests := []struct {
		name    string
		fields  fields
		args    args
		wantErr bool
	}{
		{
			name:    "successful-validation",
			fields:  fields{"../testdata/oscal-profile.xsd"},
			args:    args{[]string{"../testdata/fedramp-simple-profile.xml"}},
			wantErr: false,
		},
		{
			name:    "failed-validation",
			fields:  fields{"../testdata/oscal-profile.failed"},
			args:    args{[]string{"../testdata/fedramp-simple-profile.failed"}},
			wantErr: true,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			x := xmlValidator{
				SchemaFile: tt.fields.SchemaFile,
			}
			if err := x.Validate(tt.args.file...); (err != nil) != tt.wantErr {
				t.Errorf("xmlValidator.Validate() error = %v, wantErr %v", err, tt.wantErr)
			}
		})
	}
}
