# OSCAL Testing

This code provides test coverage to validate the OSCAL artifacts as new documentation is published, schemas are updated, and other XML artifacts such as catalogs and profiles are created.

### Pre-Requisites

1. [Python 2.7.10 or greater](https://www.python.org/)
2. [xmllint](http://xmlsoft.org/xmllint.html)
3. Java 8.0 or greater
4. [Saxon 9 HE](http://saxon.sourceforge.net/)

### Instructions

To run the full suite of tests for OSCAL, run the following at the command line:

```sh fullTests.sh```

This file will output to the console SUCCESS/ERROR messages with supporting logs for all relevant XML/XSD pairs defined in the validation script.

In addition to the full test suite, individual test files can be run.  Each of these tests is captured in separate .sh files.

### How it Works (in progress)

The XML to XSD validation is done via a Python script (see xmlValidation.py).  This script relies on the xmlint library to parse the XML and to perform the XSD validation.  One limitation of this library is that it does not perform transformation so it cannot meet the full testing requirements by itself.

The time check validation is done vai a Python script (see timeStampValidation.py).  This scrip uses the datetime library to check timestamps on files to do a comparison for validity.  The first file should be younger than the second file to pass.

The JSON schema validation is done via jsonschema (pip install jsonschema).  Tests are executed in the jsonSchemaTests.sh file.  NOTE: Current error checking only shows the first error.  Still working through ways to capture and display all errors.  Code currently exits after the first error.

NOTE: If unable to perform validation using the script, you can call jsonschema directly from the command line as follows:

```
jsonschema -i ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_LOW-baseline_profile.json ../schema/json/oscal-profile-schema.json
```
The command line will provide more detailed error messaging for troubleshooting of problematic files.

Reading JSON files is done via simplejson (pip install simplejson).  This library reads the JSON files and passes to JSON schema above.

To cover transformations, the testing relies on the Saxon 9 HE open source library.  This can be command line driven with Java to perform transformations.  This library will be used to do round trip transformations to create temporary files that can be validated by additional Python scripts to provide full test coverage.

### Future State Work

Once the basic testing is in place, additional data sets will be created to allow lower level testing and deeper regression testing.  This work is post-poned until the standard and supporting artifacts stabilize to minimize rework.
