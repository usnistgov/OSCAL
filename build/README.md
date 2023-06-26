# OSCAL CI/CD Build Tools

This subdirectory contains a set of build scripts used to create OSCAL-related artifacts (e.g., schemas, converters, documentation). Below are instructions for building using these scripts.

## Prerequisites

If using Docker:

- [Docker 20.10+](https://docs.docker.com/install/)

If not using Docker:

- macOS, Linux or Windows Subsystem for Linux (WSL) (the build scripts don't support Windows natively at this time)

## Executing the Build Environment with Docker

A Docker container configuration is provided that establishes the runtime environment needed to run the build scripts.

1. Install Docker and Docker Compose

    - Follow the Docker installation [instructions](https://docs.docker.com/install/) for your system.
    - Follow the Docker Compose installation [instructions](https://docs.docker.com/compose/install/) for your system. Note: Some packages install `docker` and `docker-compose` together. The installation instructions will tell you if this is the case.

2. Build the Docker container

    You can build the Docker container for the build environment using Docker Compose as follows from the OSCAL `./build` directory:

    ```
    docker compose build
    ```

3. Run the Docker container

    Executing the container will launch an interactive shell that is preconfigured with all required tools and the needed environment pre-configured.

    You can run the Docker container for the build environment using Docker Compose as follows:

    ```
    docker compose run cli
    ```

    In Windows environments, you may need to execute in a pseudoterminal (pty) that allows for using an interactive shell. In such a case, you can run the Docker container with [`winpty`](https://github.com/rprichard/winpty) as follows:


    ```
    winpty docker compose run cli
    ```

    This should launch an interactive shell.

## Manual Setup of the Build Environment (Linux)

The following steps are known to work on [Ubuntu](https://ubuntu.com/) (tested in [20.04 LTS](https://releases.ubuntu.com/releases/focal/) and [22.04 LTS](https://releases.ubuntu.com/releases/jammy/).

1. Install required packages

    To install the required Linux packages, run the following:

    ```bash
    sudo apt-get update
    sudo apt-get install -y apt-utils build-essential git golang-1.18 jq libxml2-utils maven nodejs npm python3-pip unzip wget
    ```

1. Install Hugo

    To install the supported version of Hugo pinned as a dependency in the repository, run the following:

    ```bash
    cd path/to/repo/OSCAL/build
    go install -tags "extended" github.com/gohugoio/hugo
    export PATH="~/go/bin:${PATH}"
    hugo version
    ```

1. Install Node.js modules and set path 

    To install the supported Node.js modules pinned as a dependency in the repository, run the following:

    ```bash
    cd path/to/repo/OSCAL/build
    npm ci
    export PATH="$(pwd)/node_modules/.bin:${PATH}"
    ajv help
    ```

1. Install Python modules

    To install the supported Python modules pinned as a dependency in the repository, run the following:

    ```bash
    cd path/to/repo/OSCAL/build
    pip3 -r requirements.txt
    ```

1. Install Saxon-HE and XML Calabash

    To install the supported Saxon-HE and XML Calabash versions pinned as a dependency in the repository, run the following:

    ```bash
    cd path/to/repo/OSCAL/build
    export JAVA_CLASSPATH=/opt/oscal
    sudo mkdir -p "${JAVA_CLASSPATH}"
    sudo chown -R "$USER":"$USER" "${JAVA_CLASSPATH}"
    mvn dependency:copy-dependencies -DoutputDirectory="${JAVA_CLASSPATH}"
    export CALABASH_HOME="${JAVA_CLASSPATH}"
    export SAXON_HOME="${JAVA_CLASSPATH}"
    ```

Your environment should be setup.

## Running the Build Scripts

From the root directory of the repository, execute the following command to run all scripts:

```bash
./build/ci-cd/run-all.sh -v
```

This will execute all validations, generate all OSCAL artifacts, and execute all unit tests.

## Running the Scripts Individually

The following executions can be used to build various OSCAL artifacts.

### Building XML and JSON Schema for the OSCAL models

To build the XML and JSON Schema for the OSCAL models, run the following:

```
./build/ci-cd/generate-schema.sh
```

This will generate schemas based on the Metaschema definitions in the Metaschema [configuration file](./ci-cd/config/metaschema).

### Building XML-to-JSON and JSON-to-XML Converters for the OSCAL models

To build the XML-to-JSON and JSON-to-XML Converters for the OSCAL models, run the following:

```
./build/ci-cd/generate-content-converters.sh
```

This will generate converters based on the definitions in the Metaschema [configuration file](./ci-cd/config/metaschema).

### Building Website Documentation

To generate OSCAL model documentation, which is used as part of the website generation pipeline, visit the following:

https://github.com/usnistgov/OSCAL-Reference/


To customize which OSCAL models have generated documentation, review and modify the [metaschema configuration file](./ci-cd/config/metaschema) accordingly.
