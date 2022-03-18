#!/bin/bash
# The following commands will install all build dependencies on Ubuntu.

sudo apt-get update

sudo apt-get -y install libxml2-utils nodejs npm python-pip jq

sudo apt-get -y install openjdk-11-jre-headless maven

sudo npm install -g ajv-cli prettyjson

pip install --user lxml

export SAXON_VERSION=10.6
export GITHUB_DIR="$HOME/github"
export SCHEMATRON_HOME="$GITHUB_DIR/Schematron/schematron"
export OSCAL_TOOLS_DIR="$GITHUB_DIR/usnistgov/oscal-tools"


mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:get -DartifactId=Saxon-HE -DgroupId=net.sf.saxon -Dversion=$SAXON_VERSION

git clone --depth 1 --no-checkout https://github.com/Schematron/schematron.git "$SCHEMATRON_HOME"
cd "$SCHEMATRON_HOME"
git checkout master -- trunk/schematron/code

git clone --depth 1 https://github.com/usnistgov/oscal-tools.git "${OSCAL_TOOLS_DIR}"
cd "$OSCAL_TOOLS_DIR/json-cli"
mvn clean install
