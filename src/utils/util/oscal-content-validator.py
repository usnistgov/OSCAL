#!/usr/bin/python3

import sys
import io
import json
import argparse
from jsonschema import validate
import xmlschema
import yaml


def _get_oscal_file_type(filename):
    if filename.endswith("json"):
        return "json"
    elif filename.endswith("xml") or filename.endswith("xsd"):
        return "xml"
    elif filename.endswith("yaml") or filename.endswith("yml"):
        return "yaml"
    else:
        raise("Not a valid OSCAL file.")


def read_file(filename, ftype):
    with io.open(filename, 'r', encoding="utf-8") as f:
        if ftype == "json":
            filedata = json.load(f)
        if ftype == "yaml":
            filedata = yaml.load(f)
        else:
            filedata = f.read()
    return filedata, ftype


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-s", "--oscal-schema", default=False, required=True,
                        action="store", dest="oscal_schema",
                        help="An OSCAL schema file.")
    parser.add_argument("-f", "--oscal-file", default=False, required=True,
                        action="store", dest="oscal_file",
                        help="An OSCAL data file.")
    return parser.parse_args()


def oscal_validator(oscal_schema, oscal_data):
    schema, stype = read_file(oscal_schema, _get_oscal_file_type(oscal_schema))
    data, ftype = read_file(oscal_data, _get_oscal_file_type(oscal_data))

    if ftype == 'json' or ftype == 'yaml':
        # Yaml files are validated using the json schema
        validate(data, schema)
    if ftype == 'xml':
        xmlschema.validate(data, schema)


def main():
    args = parse_args()

    oscal_validator(args.oscal_schema, args.oscal_file)


if __name__ == "__main__":
    main()
