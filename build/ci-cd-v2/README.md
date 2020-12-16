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

[options] and [arguments] are optional inputs. Below is a list of options and arguments that can be used:


- ### OPTIONS

| Options           | Meaning                                    |
| :---------------- | :----------------------------------------- |
| -h                | Show help (usage guide)                    |
| --help            | Show help (usage guide)                    |
| -v                | Run in verbose mode to see detailed log)   |
| --verbose         | Run in verbose mode to see detailed log)   |
| -w Dir            | Specify a working directory                |
| --working_dir Dir | Specify a working directory                |



- ### ARGUMENTS

Arguments do not require the "-" and "--" flag.

### GENERATE SCHEMA & GENERATE CONTENT CONVERTERS

`Dir` indicates the directory relative to the project root directory, where you want the generated XML and JSON directories to be created for `schema` and `convert`. You can use any name that you desire for the directory.
When a working directory option is not specified, the directories will be created in the root directory.

Arguments are used to pass the metaschema through the command line interface. This is an alternative to using the config file. You can pass as many arguments as you wish.

`Please note` that the argument is only needed when you do not want to use the config file. The argument passed through CLI should not contain the pipes with format, convert or doc as in the regular schema/convert path defined in the config file.

For example:

Instead of `src/metaschema/file_metaschema.xml|xml,json|xml,json|xml,json` use `src/metaschema/file_metaschema.xml`.

## EXAMPLE

- The generate-schema as well as generate-content-converters script can be run from either the script directory or any other directory. When the script is run from any other directory, the XML and JSON directories would be generated in that directory.

- Run from the script directory, without options, while using the config file to generate schema/convert files

```sh
  $ oscalcli generate-schema

  $ oscalcli generate-converters
```

- Run oscalcli using CLI arguments and options

```sh
  $ oscalcli generate-schema src/metaschema/file1_metaschema.xml src/metaschema/file2_metaschema.xml --verbose
```