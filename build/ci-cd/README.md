# Continuous Integration and Continuous Deployment (CI/CD)

This GitHub repository uses a CI/CD process that provides automation for:
- Validation of contributed content and models.
- Generation of documentation, content converters, and content in alternate formats.
- Methods to update the [project website](https://pages.nist.gov/OSCAL).

Using a CI/CD process ensures that all artifacts in [pull requests](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md) and in the [master branch](https://github.com/usnistgov/OSCAL) are valid and usable.

# Provided Scripts

The CI/CD workflow is processed by CircleCI using a series of bash scripts. The following scripts are used in this workflow:

1. [run-all.sh](run-all.sh): Runs all of the scripts in workflow order.
1. [validate-metaschema.sh](validate-metaschema.sh): Ensures that all [metaschema](https://github.com/usnistgov/OSCAL/tree/master/src/metaschema) are valid according to the [metaschema XML schema](https://github.com/usnistgov/OSCAL/blob/master/build/metaschema/lib/metaschema.xsd).
1. [generate-schema.sh](generate-schema.sh): Generates [XML schema](https://github.com/usnistgov/OSCAL/tree/master/xml/schema) and [JSON schema](https://github.com/usnistgov/OSCAL/tree/master/json/schema) files for each OSCAL model based on their [respective metaschemas](https://github.com/usnistgov/OSCAL/tree/master/src/metaschema).
1. [validate-content.sh](validate-content.sh):
1. [generate-content-converters.sh](generate-content-converters.sh):
1. [copy-and-convert-content.sh](copy-and-convert-content.sh):

Additional scripts are provided that generate content for the OSCAL project website.
1. [generate-schema-documentation.sh](generate-schema-documentation.sh):


# Running the Scripts Locally

The bash scripts used in the CI/CD workflow can be run locally in the correct environment. To run these scripts, the following must be installed:
- [xmlint](http://xmlsoft.org/xmllint.html)
- [Java](https://www.java.com/en/) 8.0 or greater
- [Apache Maven](https://maven.apache.org/) 3.6.1 or greater
- [Node.js and Node Package Manager (NPM)](https://nodejs.org/en/) 10.15.3 or greater
- 'Another Json Validator' Command Line Interface ([ajv-cli](https://github.com/jessedc/ajv-cli)) v3.0.0 or greater
- [Python](https://www.python.org/) 3.7.3 or greater
