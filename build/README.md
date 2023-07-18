# OSCAL Build Tools

This subdirectory contains infrastructure used to create OSCAL-related artifacts (e.g., schemas, converters) and perform status checks.
Below are instructions for using these tools.

## Prerequisites

The build tools in this directory require a Unix environment with the following software:

- [Maven](https://maven.apache.org/): Required to generate artifacts
- [NodeJS](https://nodejs.org/en) (ensure the version matches [`.nvmrc`](./.nvmrc)): Required to perform link checking
- [`libxml`](https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home): Provides `xmllint` which is required to validate generated XML artifacts

Additionally ensure your environment has standard build tools such as `git`, [`make`](https://www.gnu.org/software/make/), and `bash`.

## Overview

All OSCAL build targets are defined in a [`Makefile`](./Makefile).
To summarize the build targets, run `make help`.
