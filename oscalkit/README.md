# oscalkit

> In development

Barebones toolkit for translating between OSCAL-formatted XML and JSON

## Installing

You can download the appropriate oscalkit command-line utility for your system from the [TBD] page and run it from your local machine directly. For easier execution, you can include it in your `$PATH` environment variable as follows:

Windows:

> XML Validation requires the `xmllint` tool which is not included with Windows. Installation instructions can be found [here](https://stackoverflow.com/a/21227833).

```powershell
# Run the following commands in a PowerShell console

$newPath = "<path_to_oscalkit.exe>;" + [Environment]::GetEnvironmentVariable("PATH", [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("PATH", $newPath, [EnvironmentVariableTarget]::Machine)
```

macOS/Linux:

```sh
# Add the following line to to the .profile file in your home directory (~/.profile)

PATH=$PATH:/<path_to_oscalkit>
export PATH
```

Docker:

```sh
docker pull usnistgov/oscalkit:latest
```

## Usage

```
OSCAL toolkit

Usage:
  oscalkit [command]

Available Commands:
  convert     Convert between OSCAL XML and JSON
  help        Help about any command
  validate    Validate against OSCAL XML or JSON schemas

Flags:
  -d, --debug   enable verbose logging
  -h, --help    help for oscalkit

Use "oscalkit [command] --help" for more information about a command.
```

### Convert between XML and JSON

`oscalkit` can be used to convert one or more source files between OSCAL-formatted XML and JSON.

```
Convert between OSCAL XML and JSON

Usage:
  oscalkit convert [source-files...] [flags]

Flags:
  -h, --help                help for convert
  -o, --outputPath string   Output path for JSON file(s). Defaults to current directory
  -y, --yaml                If source file is XML or JSON, also generate YAML output

Global Flags:
  -d, --debug   enable verbose logging
```

#### Examples

Convert OSCAL-formatted NIST 800-53 declarations from XML to JSON:

```sh
oscalkit convert SP800-53-declarations.xml
```

### Validate against XML and JSON schemas

The tool supports validation of OSCAL-formatted XML and JSON files against the corresponding OSCAL XML schemas (.xsd) and JSON schemas. XML schema validation requires the `xmllint` tool on the local machine (included with macOS and Linux. Windows installation instructions [here](https://stackoverflow.com/a/21227833))

```
Usage:
  oscalkit validate [file ...] [flags]

Flags:
  -h, --help            help for validate
  -s, --schema string   Schema file to validate against

Global Flags:
  -d, --debug   enable verbose logging
```

#### Examples

Validate FedRAMP framework in OSCAL-formatted JSON against the corresponding JSON schema

```sh
oscalkit validate -s oscal-core.json fedramp-annotated-wrt-SP800-53catalog.json
```

## Developing

`oscalkit` is developed with [Go](https://golang.org/) (1.9+). If you have Docker installed, the included `Makefile` can be used to run tests and compile the application for Linux, macOS and Windows. Otherwise, the native Go toolchain can be used.

### Compile

```sh
# Compile for Linux

GOOS=linux GOARCH=amd64 make

# Compile for macOS

GOOS=darwin GOARCH=amd64 make

# Compile for Windows

GOOS=windows GOARCH=amd64 make
