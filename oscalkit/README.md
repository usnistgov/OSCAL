# oscalkit

> In development

Barebones toolkit for translating between OSCAL-formatted XML and JSON

## Installing

You can download the appropriate oscalkit command-line utility for your system from the [TBD] page and run it from your local machine directly. For easier execution, you can include it in your `$PATH` environment variable as follows:

Windows:

> XML validation requires the `xmllint` tool which is not included with Windows. Installation instructions for Windows can be found [here](https://stackoverflow.com/a/21227833).

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
NAME:
   oscalkit - OSCAL toolkit

USAGE:
   oscalkit [global options] command [command options] [arguments...]

VERSION:
   0.0.0

COMMANDS:
     convert   convert between one or more OSCAL file formats
     validate  validate files against OSCAL XML and JSON schemas
     help, h   Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --debug, -d    enable debug command output
   --help, -h     show help
   --version, -v  print the version
```

### Convert between XML and JSON

`oscalkit` can be used to convert one or more source files between OSCAL-formatted XML and JSON.

```
NAME:
   oscalkit convert - convert between one or more OSCAL file formats

USAGE:
   oscalkit convert [command options] [source-files...]

DESCRIPTION:
   Convert between OSCAL-formatted XML and JSON files. The command accepts
   one or more source file paths and can also be used with source file contents
   piped/redirected from STDIN.

OPTIONS:
   --output-path value, -o value  Output path for converted file(s). Defaults to current working directory
   --output-file value, -f value  file name for converted output from STDIN. Defaults to "stdin.<json|xml|yaml>"
   --yaml, -y                     If source file format is XML or JSON, also generate equivalent YAML output
```

#### Examples

Convert OSCAL-formatted NIST 800-53 declarations from XML to JSON:

```sh
oscalkit convert SP800-53-declarations.xml
```

Convert OSCAL-formatted NIST 800-53 declarations from XML to JSON via STDIN (note the use of "-"):

```sh
cat SP800-53-declarations.xml | oscalkit convert -
```

### Validate against XML and JSON schemas

The tool supports validation of OSCAL-formatted XML and JSON files against the corresponding OSCAL XML schemas (.xsd) and JSON schemas. XML schema validation requires the `xmllint` tool on the local machine (included with macOS and Linux. Windows installation instructions [here](https://stackoverflow.com/a/21227833))

```
NAME:
   oscalkit validate - validate files against OSCAL XML and JSON schemas

USAGE:
   oscalkit validate [command options] [files...]

DESCRIPTION:
   Validate OSCAL-formatted XML files against a specific XML schema (.xsd)
   or OSCAL-formatted JSON files against a specific JSON schema

OPTIONS:
   --schema value, -s value  schema file to validate against
```

#### Examples

Validate FedRAMP framework in OSCAL-formatted JSON against the corresponding JSON schema

```sh
oscalkit validate -s oscal-core.json fedramp-annotated-wrt-SP800-53catalog.json
```

## Developing

`oscalkit` is developed with [Go](https://golang.org/) (1.9+). If you have Docker installed, the included `Makefile` can be used to run unit tests and compile the application for Linux, macOS and Windows. Otherwise, the native Go toolchain can be used.

### Dependency management

The [`dep`](https://github.com/golang/dep) dependency management tool is used to vendor the application's dependencies. The `vendor/` folder containing the dependencies is checked in with the source. With [`dep`](https://github.com/golang/dep), you can verify the dependencies as follows:

```sh
dep ensure
```

### Compile

You can use the included `Makefile` to generate binaries for your OS as follows (requires [Docker](https://docs.docker.com/engine/installation/)):

```sh
# Compile for Linux

GOOS=linux GOARCH=amd64 make

# Compile for macOS

GOOS=darwin GOARCH=amd64 make

# Compile for Windows

GOOS=windows GOARCH=amd64 make
