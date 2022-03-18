# OSCAL JSON Resources

This part of the OSCAL GitHub repository contains useful resources for working with OSCAL content formatted using the JavaScript Object Notation (JSON).

# Table of Contents
<!-- TOC -->

- [OSCAL JSON Resources](#oscal-json-resources)
- [Table of Contents](#table-of-contents)
- [Available JSON Resources](#available-json-resources)
- [JSON Schema for OSCAL Models](#json-schema-for-oscal-models)
  - [Validating OSCAL JSON Content](#validating-oscal-json-content)
- [OSCAL XML to JSON Converters](#oscal-xml-to-json-converters)
  - [Converting OSCAL XML Content to JSON](#converting-oscal-xml-content-to-json)
    - [Alternate invocations](#alternate-invocations)

<!-- /TOC -->

# Available JSON Resources

The following directories provide:

- [schema](schema): JSON Schema files that can be used to validate OSCAL content expressed in JSON.
- [convert](convert): eXtensible Stylesheet Language Transformations (XSLTs) to convert OSCAL content expressed in other OSCAL formats into JSON.

# JSON Schema for OSCAL Models

JSON Schema based on the [JSON Schema Draft-07](https://json-schema.org/specification-links.html#draft-7) are provided for the following [OSCAL models](https://pages.nist.gov/OSCAL/documentation/schema/):

- [Catalog JSON Schema](schema/oscal_catalog_schema.json)(Draft): Supports the validation of OSCAL JSON-based control catalog content.
- [Profile JSON Schema](schema/oscal_profile_schema.json) (Draft): Supports the validation of OSCAL JSON-based control baselines.
- [System Security Plan (SSP) JSON Schema](schema/oscal_ssp_schema.json) (Draft): Supports the validation of OSCAL JSON-based SSP content.
- [Component Definition XML Schema](schema/oscal_component_schema.json) (Draft): Supports the validation of OSCAL JSON-based component definition content.
- [Assessment Plan (AP) XML Schema](schema/oscal_assessment-plan_schema.json) (Draft): Supports the validation of OSCAL JSON-based assessment plan content.
- [Assessment Results (AR) XML Schema](schema/oscal_assessment-results_schema.json) (Draft):  Supports the validation of OSCAL JSON-based assessment results content.
- [Plan of Action and Milestones (POA&M) XML Schema](schema/oscal_poam_schema.json) (Draft): Supports the validation of OSCAL JSON-based POA&M content.

## Validating OSCAL JSON Content

The OSCAL project uses the [Another Json Validator](https://ajv.js.org/) (AJV) [command line interface](https://github.com/jessedc/ajv-cli) (CLI) to perform automated validation of all JSON-based OSCAL [content](../content) provided in this repository. *ajv-cli* is an open source tool that can be [installed](https://github.com/jessedc/ajv-cli#installation), and run on OSX, Linux, and Windows environments, with a [Node.js](https://nodejs.org/en/download/current/) environment installed. Node.js is the JavaScript runtime environment that is required to run AJV.

The following example uses the **ajv-cli** to perform validation of an OSCAL catalog JSON file.

```
ajv validate -s "oscal_catalog_schema.json" -d "catalog.json" --extend-refs=true --verbose
```

The [online documentation](https://github.com/jessedc/ajv-cli) for *ajv-cli* provides more information on the commandline arguments.

# OSCAL XML to JSON Converters

The OSCAL project provides Extensible Stylesheet Language Transformation (XSLT) templates based on [XSLT 3.0](https://www.w3.org/TR/xslt-30/) and [XPath 3.1](https://www.w3.org/TR/xpath-31/) for the following [OSCAL models](https://pages.nist.gov/OSCAL/documentation/schema/):

- [Catalog XML-to-JSON](convert/oscal_catalog_xml-to-json-converter.xsl) (Draft): Supports the conversion of OSCAL XML-based control catalog content to the OSCAL JSON catalog format.
- [Profile XML-to-JSON](convert/oscal_profile_xml-to-json-converter.xsl) (Draft): Supports the conversion of OSCAL XML-based control baselines to the OSCAL JSON profile format.
- [System Security Plan (SSP) XML-to-JSON](convert/oscal_ssp_xml-to-json-converter.xsl) (Draft): (Draft) Supports the conversion of OSCAL XML-based SSP content to the OSCAL JSON SSP format.
- [Component Definition XML Schema](convert/oscal_component_xml-to-json-converter.xsl) (Draft): Supports the conversion of OSCAL XML-based component definition content to the OSCAL JSON component definition format.
- [Assessment Plan (AP) XML Schema](convert/oscal_assessment-plan_xml-to-json-converter.xsl) (Draft): Supports the conversion of OSCAL XML-based assessment plan content to the OSCAL JSON assessment plan format.
- [Assessment Results (AR) XML Schema](convert/oscal_assessment-results_xml-to-json-converter.xsl) (Draft): Supports the conversion of OSCAL XML-based assessment results content to the OSCAL JSON assessment results format.
- [Plan of Action and Milestones (POA&M) XML Schema](convert/oscal_poam_xml-to-json-converter.xsl) (Draft): Supports the conversion of OSCAL XML-based POA&M content to the OSCAL JSON POA&M format.

**IMPORTANT** : XSLT 3.0 and XPath 3.1 are only required when using the NIST provided tools for converting OSCAL content between JSON and XML. Any version of XSLT or XPath may be used when transforming or querying OSCAL files for other reasons. These newer versions of XSLT and XPath offer more robust capabilities, that are needed to support the OSCAL converters.

## Converting OSCAL XML Content to JSON

The OSCAL project uses [Saxon-HE (Saxon Home Edition)](http://saxon.sourceforge.net/) to evaluate the XSLT templates supporting conversion of OSCAL XML and JSON [content](../content) provided in this repository. *Saxon-HE* is an open source implementation of XSLT 3.0, XPath 2.0 and 3.1, and XQuery 3.1 supporting Java and .NET programming environments. These versions of *Saxon-HE* can be [downloaded directly](http://saxon.sourceforge.net/#F9.9HE) or the Java version can be [downloaded](https://search.maven.org/artifact/net.sf.saxon/Saxon-HE) using Apache Maven. Saxonica also offers Saxon PE and EE versions, which are commercial products with technical support and redistribution rights.

The OSCAL project uses *Saxon-HE* with Java version 8 or greater.

The following example uses **Saxon HE** to convert an OSCAL catalog XML file to JSON using one of the NIST-provided [JSON to XML XSLT converters](convert). This example assumes that Java 8+ has been installed and the Saxon-HE jar files have already unzipped.

```
java -jar "saxon10he.jar" -xsl:"oscal_catalog_xml-to-json-converter.xsl" -s:"oscal-catalog.xml" -o:"oscal-catalog.json" json-indent=yes
```

> *Note*: at time of writing, Saxon 9 users are being encouraged to upgrade systems to use Saxon 10, and the stylesheets provided should function equally well or better with the later software. Please feel free to use the latest Saxon or indeed any conformant XSLT 3.0 processor.
>
> Operators of XSLT-based platforms should by all means test these processes with any XSLT 3.0 conformant processor, and report problems to us via Github Issues.
 
Paths\names of these files need to be provided based on the location of the files on your computer:

* The Saxon JAR file is named ```saxon10he.jar```.
* The catalog converter is specified as ```-xsl:"oscal_catalog_xml-to-json-converter.xsl"```
* The source catalog XML file is specified as ```-s:"oscal-catalog.xml"```
* The destination catalog JSON file is specified as ```-o:"oscal-catalog.json"```.

The [online documentation](http://www.saxonica.com) for *Saxon* provides more information on the command line arguments.

### Alternate invocations

The configuration just provided will convert a JSON file given as a file reference, into OSCAL XML. There are also different configurations available for debugging:

* `-it:from-xml` (indicating initial template) - provides the default XSLT entry point explicitly.
* `-file:mycatalog.xml` used with explicit `-it:from-xml` will look for the XML at the location given by the parameter, instead of on the source port (given by `-s`). This configuration parallels the JSON-to-XML converter.
* `produce=supermodel` as a runtime parameter will emit not OSCAL XML, but the intermediate format produced by the converter (a so-called 'OSCAL supermodel' derived from its metaschema): useful for debugging or as a pivot to other serializations.
* `produce=xpath-json` will produce the results in an XML format defined by the XPath function `json-to-xml()`, which when consumed by the complementary function `xml-to-json()` can deterministically provide syntactically correct JSON. This XML format is used internally to provide the JSON data description, to be cast into JSON as a (terminal) serialization step. Expressing the transformation results in this format directly can provide insight for debugging, especially in failure conditions (when the syntax cannot be written). See https://www.w3.org/TR/xpath-functions-31/#func-json-to-xml for more details on this format.

