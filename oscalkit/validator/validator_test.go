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
			name:    "successfulJSONValidation",
			fields:  fields{"../sample/oscal-profile.json"},
			args:    args{[]string{"../sample/fedramp-simple-profile.json"}},
			wantErr: false,
		},
		{
			name:    "failedJSONValidation",
			fields:  fields{"../sample/oscal-profile.failed"},
			args:    args{[]string{"../sample/fedramp-simple-profile.failed"}},
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
			name:    "successfulXMLValidation",
			fields:  fields{"../sample/oscal-profile.xsd"},
			args:    args{[]string{"../sample/fedramp-simple-profile.xml"}},
			wantErr: false,
		},
		{
			name:    "failedXMLValidation",
			fields:  fields{"../sample/oscal-profile.failed"},
			args:    args{[]string{"../sample/fedramp-simple-profile.failed"}},
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
