# Continuous Integration and Continuous Deployment (CI/CD)

This GitHub repository uses a CI/CD process that provides automation for:
- Validation of contributed content and models.
- Generation of documentation, content converters, and content in alternate formats.
- Methods to update the [project website](https://pages.nist.gov/OSCAL).

Using a CI/CD process ensures that all artifacts in [pull requests](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md) and in the [master branch](https://github.com/usnistgov/OSCAL) are valid and usable.

# Provided Scripts

The primary CircleCI supported CI/CD workflow, ```build```, is uses a series of bash scripts. The following scripts are used in this workflow:

1. [run-all.sh](run-all.sh): Runs all of the scripts in workflow order.
1. [validate-metaschema.sh](validate-metaschema.sh): Ensures that all [metaschema](https://github.com/usnistgov/OSCAL/tree/master/src/metaschema) are valid according to the [metaschema XML schema](https://github.com/usnistgov/OSCAL/blob/master/build/metaschema/lib/metaschema.xsd).
1. [generate-schema.sh](generate-schema.sh): Generates [XML schema](https://github.com/usnistgov/OSCAL/tree/master/xml/schema) and [JSON schema](https://github.com/usnistgov/OSCAL/tree/master/json/schema) files for each OSCAL model based on their [respective metaschemas](https://github.com/usnistgov/OSCAL/tree/master/src/metaschema).
1. [validate-content.sh](validate-content.sh): Validates OSCAL content in the repository's [src](https://github.com/usnistgov/OSCAL/tree/master/src) against the content's respective OSCAL model and format.
1. [generate-content-converters.sh](generate-content-converters.sh): Generates [JSON to XML](https://github.com/usnistgov/OSCAL/tree/master/xml/convert) and [XML to JSON](https://github.com/usnistgov/OSCAL/tree/master/json/convert) content conversion scripts for each OSCAL model based on their [respective metaschemas](https://github.com/usnistgov/OSCAL/tree/master/src/metaschema).
1. [copy-and-convert-content.sh](copy-and-convert-content.sh): Copies selective content from the [src/content](https://github.com/usnistgov/OSCAL/tree/master/src/content) directory, and generates instance of this content in alternate OSCAL formats using the appropriate content converters. Note __This script requires that the process have write access to the Git repository branch that the CI/CD is operating on to work completely.__

Additional scripts are provided that generate content for the OSCAL project website, supported by the CircleCI ```build-and-deploy-site``` workflow.
1. [generate-schema-documentation.sh](generate-schema-documentation.sh): This is used as part of the site generation pipeline to build HTML documentation for the OSCAL models.


# Running the Scripts Locally

The bash scripts used in the CI/CD workflow can be run locally in the correct environment. In addition to a bash shell, to run these scripts the following must be installed:
- [xmlint](http://xmlsoft.org/xmllint.html)
- [Java](https://www.java.com/en/) 8.0 or greater
- [Apache Maven](https://maven.apache.org/) 3.6.1 or greater
- [Node.js and Node Package Manager (NPM)](https://nodejs.org/en/) 10.15.3 or greater
- 'Another Json Validator' Command Line Interface ([ajv-cli](https://github.com/jessedc/ajv-cli)) v3.0.0 or greater
- [Python](https://www.python.org/) 3.7.3 or greater

Additionally, the following packages need to be installed.

NodeJS Packages:

```
npm install -g ajv-cli
```

Python packages:

```
pip install 'jsonschema>=3.0.1'
pip install simplejson
```

The Saxon jar file needs to be retrieved. This can be two ways:

1) You can set the environment variable ```SAXON_VERSION``` to the Saxon version to use. This must correspond to a valid Saxon-HE version in [Maven Central](https://mvnrepository.com/artifact/net.sf.saxon/Saxon-HE). Maven will be used to automatically download the Saxon-HE jar dependency.

For example:

```
export SAXON_VERSION=9.9.1-3
```

2) You can manually download any variant of Saxon (e.g., HE, ) from [Saxonica](https://www.saxonica.com/download/java.xml) and set the ```SAXON_HOME``` environment variable to the location of the Saxon JAR.

```
export SAXON_HOME=~/saxon-jar-directory
```

Finally, the Schematron Skeleton needs to be retrieved. The following commands can be used to download it.

```
export SCHEMATRON_HOME=~/schematron-skeleton
git clone --depth 1 --no-checkout https://github.com/Schematron/schematron.git "$SCHEMATRON_HOME"
cd "$SCHEMATRON_HOME"
git checkout master -- trunk/schematron/code
```
