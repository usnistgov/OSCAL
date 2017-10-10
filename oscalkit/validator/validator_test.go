package validator

import (
	"reflect"
	"testing"
)

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

func TestJSONValidate(t *testing.T) {
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
			fields:  fields{"../testdata/oscal-profile.json"},
			args:    args{[]string{"../testdata/fedramp-simple-profile.json"}},
			wantErr: false,
		},
		{
			name:    "failed-validation-non-existent-schema-file",
			fields:  fields{"../testdata/oscal-profile.failed"},
			args:    args{[]string{"../testdata/fedramp-simple-profile.failed"}},
			wantErr: true,
		},
		{
			name:    "failed-validation-non-existent-file",
			fields:  fields{"../testdata/oscal-profile.json"},
			args:    args{[]string{"../testdata/fedramp-simple-profile.failed"}},
			wantErr: true,
		},
		{
			name:    "failed-validation-not-oscal-formatted",
			fields:  fields{"../testdata/oscal-profile.json"},
			args:    args{[]string{"../testdata/notoscal.json"}},
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
