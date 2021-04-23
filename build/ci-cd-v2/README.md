# OSCALCLI

The OSCAL Command-Line Interface (CLI) is a library of commands that can be used to automate creation and maintenance of OSCAL resources. CLI commands allow you to perform operations on each OSCAL model base on their corresponding metaschemas.

## SETUP

- CD into the `ci-cd-v2` directory.
- Install dependencies and make OSCALCLI globally available on your machine

```sh
  $ npm link
```

## USAGE

Oscalcli can be run from any directory. To view the available oscalcli modules and their corresponding options, run

```sh
  $ oscalcli
```

To run an oscalcli module

```sh
  $ oscalcli [module] [arguments] [options] 
```

# GENERATE SCHEMA

To build the XML and JSON Schema for the OSCAL models, run the script using the format below.

- ## usage

The generate-schema can be run from either the script directory or any other directory. When the script is run from any other directory, the XML and JSON schema would be generated in that directory.

```sh
  $ oscalcli generate-schema [arguments] [options]
```

1. Examples

    ```bash
    Example 1: $ oscalcli generate-schema src/metaschema/oscal_profile_metaschema.xml -v
    Example 2: $ oscalcli generate-schema src/metaschema/oscal_profile_metaschema.xml src/metaschema/oscal_catalog_metaschema.xml -v -w demoDir
    ```

- ## options

| Options                      | Meaning                                  |
| :--------------------------- | :--------------------------------------- |
| -v, --verbose                | Run in verbose mode (see detailed log)   |
| -h, --help                   | Get help (usage guide)                   |
| -w, --working-dir Dir        | Working directory                        |
| --validate                   | Validate the generated schema            |

`Dir` indicates the directory relative to the project root directory, where you want the generated XML and JSON `schema` directories to be created. So, you can name the directory almost anything you want, but it should be identifiable. \
When working directory option is not specified, the XML and JSON directories will be created in the project root directory.

- ## arguments

Arguments are used to pass the metaschema through the command line interface. The argument passed through the CLI should not contain the pipes that indicate format, convert, doc as in the regular schema defined in a config file.\
For example: \
Instead of `src/metaschema/file_metaschema.xml|xml,json|xml,json|xml,json` use `src/metaschema/file_metaschema.xml`.

# GENERATE CONVERTERS

To build the XML-to-JSON and JSON-to-XML Converters for the OSCAL models, run the script using the format below.

- ## usage

The generate-schema as well as generate-converters script can be run from either the script directory or any other directory. When the script is run from any other directory, the XML and JSON converters would be generated in that directory.

```sh
  $ oscalcli generate-converters [arguments] [options]
```
1. Examples

    ```bash
    Example 1: $ oscalcli generate-converters src/metaschema/oscal_profile_metaschema.xml -v
    Example 2: $ oscalcli generate-converters src/metaschema/oscal_profile_metaschema.xml src/metaschema/oscal_catalog_metaschema.xml -v -w demoDir
    ```

[options] are optional inputs. Below is a list of options and arguments that can be used:

- ## options

| Options                      | Meaning                                  |
| :--------------------------- | :--------------------------------------- |
| -v, --verbose                | Run in verbose mode (see detailed log)   |
| -h, --help                   | Get help (usage guide)                   |
| -w, --working-dir Dir        | Working directory                        |

`Dir` indicates the directory relative to the project root directory, where you want the generated XML and JSON `convert` directories to be created. So, you can name the directory almost anything you want, but it should be identifiable. \
When working directory option is not specified, the XML and JSON directories will be created in the project root directory.

- ## arguments

Arguments are used to pass the metaschema through the command line interface. \
For example: `src/metaschema/file_metaschema.xml`.


# VALIDATE CONTENT

To validate the OSCAL content in the repository's src against the content's respective OSCAL model and format, run the script using the format below.

- ## usage

```
  $ oscalcli validate-content [arguments] [options]
```
1. Examples

    ```bash
    Example 1: $ oscalcli validate-content "src/examples/catalog/xml/*.xml|xml|catalog|json" -v -a oscal-content -o build/ci-cd-v2
    Example 2: $ oscalcli validate-content "src/examples/ssp/json/ssp-example.json|json|ssp|xml" "src/nist.gov/SP800-53/rev5/xml/
               draft/*profile.xml|xml|profile|json" -v -a oscal-content
    ```


- ## options

| Options                      | Meaning                                        |
| :--------------------------- | :----------------------------------------------|
| -v, --verbose                | Run in verbose mode (see detailed log)         |
| -h, --help                   | Get help (usage guide)                         |
| -o, --oscal-dir              | Working directory (Default: OSCAL root dir)    |
| -a, --artifact-dir           | Source artifact                                |


# VALIDATE SCHEMA

To validate the XML and JSON Schema for OSCAL models within the OSCAL file system against XML and JSON validators, run the script using the format below.


- ## usage

```
  $ oscalcli validate-schema [arguments] [options]
```
1. Examples

    ```bash
    Example 1: $ oscalcli validate-schema oscal_profile_schema.json
    Example 2: $ oscalcli validate-schema oscal_poam_schema.xsd -w build/ci-cd-v2
    ```

- ## options

| Options                      | Meaning                                        |
| :--------------------------- | :----------------------------------------------|
| -h, --help                   | Get help (usage guide)                         |
| -w, --working-dir Dir        | Working directory                              |
