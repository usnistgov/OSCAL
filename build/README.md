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

The following steps are known to work on [Ubuntu](https://ubuntu.com/) (tested in [18.04 LTS](http://old-releases.ubuntu.com/releases/bionic/) and [20.04 LTS](http://old-releases.ubuntu.com/releases/focal/).

1. Setup environment variables

    Environment variables are used to configure the runtime environment.

    - SAXON_VERSION - Defines which version of Saxon-HE to use
    - HUGO_VERSION - Defines which version of Hugo to use
    - CALABASH_VERSION - Defines which version of XML Calabash to use
    - CALABASH_HOME - Defines where calabash will be installed

    The following is an example of how to configure the environment.

    ```bash
    export SAXON_VERSION="10.6"
    export HUGO_VERSION="0.83.1"
    export CALABASH_VERSION="1.2.5-100"
    export CALABASH_HOME="$HOME/calabash"
    ```

    You may want to add this export to your `~/.bashrc` to persist the configuration.

1. Install required packages

    To install the required Linux packages, run the following:

    ```bash
    sudo apt-get update
    sudo apt-get install -y apt-utils build-essential git-core jq libxml2-utils maven nodejs npm python3-pip unzip
    sudo apt-get clean
    ```

1. Install Hugo

    The version of Hugo available on Ubuntu is outdated. To install a current version of Hugo, run the following:

    ```bash
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
    sudo apt install ./hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
    ```

1. Install Node.js modules and set path 

    To install the required Node.js modules, run the following:

    ```bash
    npm install # run inside ./build directory
    ```

    You must add the path for Node.js executable to the `$PATH`. You may want to add this export to your `~/.bashrc` to persist the configuration.

    ```bash
    export PATH="$(npm bin):${PATH}" # run inside ./build directory
    ```

1. Install Python modules

    To install the required Python modules, run the following:

    ```bash
    pip3 install -r ./ci-cd/python/requirements.txt # run inside ./build directory
    ```

1. Install Saxon-HE

    To install Saxon-HE, run the following:

    ```bash
    mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:get -DartifactId=Saxon-HE -DgroupId=net.sf.saxon -Dversion=${SAXON_VERSION}
    ```

1. Install Calabash

    To install Calabash, run the following:

    ```bash
    wget https://github.com/ndw/xmlcalabash1/releases/download/${CALABASH_VERSION}/xmlcalabash-${CALABASH_VERSION}.zip
    mkdir -p "${CALABASH_HOME}"
    unzip -d "${CALABASH_HOME}" "xmlcalabash-${CALABASH_VERSION}.zip"
    mv "${CALABASH_HOME}"/*/* "${CALABASH_HOME}"
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

To generate OSCAL model documentation, which is used as part of the [website generation pipeline](../docs), execute the following:

```
./build/ci-cd/generate-model-documentation.sh
```
