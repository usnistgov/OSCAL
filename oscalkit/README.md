# oscalkit

> In development

Barebones toolkit for translating between OSCAL-formatted XML and JSON

## Installing

You can download the appropriate oscalkit command-line utility for your system from the [TBD] page and run it from your local machine directly. For easier execution, you can include it in your `$PATH` environment variable as follows:

Windows:

> XML validation requires the `xmllint` tool which is not included with Windows. Installation instructions can be found [here](https://stackoverflow.com/a/21227833).

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

> Running the oscalkit Docker container requires either bind-mounting the directory containing your source files or passing file contents in to the command via stdin.

```sh
docker pull usnistgov/oscalkit:latest
docker run -it --rm -v $PWD:/data -w /data usnistgov/oscalkit convert oscal-core.xml

# or via stdin

docker run -it --rm usnistgov/osaclkit convert < oscal-core.xml
```

## Usage

```
Usage: 
  oscalkit [command]

OSCAL toolkit

Available Commands:
  convert     Convert between one or more OSCAL XML and JSON files or from STDIN
  help        Help about any command
  validate    Validate files against OSCAL XML or JSON schemas

Options:
  -d, --debug   enable verbose logging
  -h, --help    help for oscalkit

Use "oscalkit [command] --help" for more information about a command.
```

### Convert between XML and JSON

`oscalkit` can be used to convert one or more source files between OSCAL-formatted XML and JSON.

```
Usage: convert [OPTIONS] [source-files...]|-

Convert between one or more OSCAL XML and JSON files or from STDIN

Examples:
  oscalkit convert oscal-catalog.xml
  cat oscal-catalog.xml | oscalkit convert -

Options:
  -h, --help                 help for convert
  -o, --output-file string   File name for converted output from STDIN
  -p, --output-path string   Output path for converted file(s). Defaults to current working directory
  -y, --yaml                 If source file is XML or JSON, also generate YAML output

Global Options:
  -d, --debug   enable verbose logging
```

#### Examples

Convert OSCAL-formatted NIST 800-53 declarations from XML to JSON:

```sh
oscalkit convert SP800-53-declarations.xml
```

Convert OSCAL-formatted NIST 800-53 declarations from XML to JSON via STDIN:

```sh
cat SP800-53-declarations.xml | oscalkit convert -
```

### Validate against XML and JSON schemas

The tool supports validation of OSCAL-formatted XML and JSON files against the corresponding OSCAL XML schemas (.xsd) and JSON schemas. XML schema validation requires the `xmllint` tool on the local machine (included with macOS and Linux. Windows installation instructions [here](https://stackoverflow.com/a/21227833))

```
Usage: validate [OPTIONS] [file ...]

Validate files against OSCAL XML or JSON schemas

Examples:
  oscalkit validate -s oscal-core.xsd oscal-catalog.xml
  oscalkit validate -s oscal-core.json oscal-catalog.json

Options:
  -h, --help            help for validate
  -s, --schema string   Schema file to validate against

Global Options:
  -d, --debug   enable verbose logging
```

#### Examples

Validate FedRAMP framework in OSCAL-formatted JSON against the corresponding JSON schema

```sh
oscalkit validate -s oscal-core.json fedramp-annotated-wrt-SP800-53catalog.json
```

## Developing

`oscalkit` is developed with [Go](https://golang.org/) (1.9+). If you have Docker installed, the included `Makefile` can be used to run tests and compile the application for Linux, macOS and Windows. Otherwise, the native Go toolchain can be used.

### Install dependencies

The [`dep`](https://github.com/golang/dep) dependency management tool is used to vendor the application's dependencies. With [`dep`](https://github.com/golang/dep), you can install the dependencies as follows:

```sh
dep ensure
```

### Compile

Before compiling, make sure you've installed the dependencies as explained above.

```sh
# Compile for Linux

GOOS=linux GOARCH=amd64 make

# Compile for macOS

GOOS=darwin GOARCH=amd64 make

# Compile for Windows

GOOS=windows GOARCH=amd64 make
