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

<!-- /TOC -->

# Available JSON Resources

The following directories provide:

- [schema](schema): JSON Schema files that can be used to validate OSCAL content expressed in JSON.
- [convert](convert): eXtensible Stylesheet Language Transformations (XSLTs) to convert OSCAL content expressed in other OSCAL formats into JSON.

# JSON Schema for OSCAL Models

JSON Schema based on the [JSON Schema Draft-07](https://json-schema.org/specification.html) are provided for the following [OSCAL models](https://pages.nist.gov/OSCAL/docs/architecture/):

- [Catalog JSON Schema](schema/oscal_catalog_schema.xsd): Supports the validation of OSCAL JSON-based control catalogs.
- [Profile JSON Schema](schema/oscal_profile_schema.xsd): Supports the validation of OSCAL JSON-based control baselines.
- [System Security Plan (SSP) JSON Schema](schema/oscal_ssp_schema.xsd): (Experimental) Supports the validation of OSCAL JSON-based SSPs.

## Validating OSCAL JSON Content

The OSCAL project uses the [Another Json Validator](https://ajv.js.org/) (AJV) [command line interface](https://github.com/jessedc/ajv-cli) (CLI) to perform automated validation of all JSON-based OSCAL [content](../content) provided in this repository. *ajv-cli* is an open source tool that can be [installed](https://github.com/jessedc/ajv-cli#installation), and run on OSX, Linux, and Windows environments, with a [Node.js](https://nodejs.org/en/download/current/) environment installed. Node.js is the JavaScript runtime environment that is required to run AJV.

The following example uses the **ajv-cli** to perform validation of an OSCAL catalog JSON file.

```
ajv validate -s "oscal_catalog_schema.xsd" -d "catalog.xml" --extend-refs=true --verbose
```

The [online documentation](https://github.com/jessedc/ajv-cli) for *ajv-cli* provides more information on the commandline arguments.

# OSCAL XML to JSON Converters

The OSCAL project provides Extensible Stylesheet Language Transformation (XSLT) templates based on [XSLT 3.0](https://www.w3.org/TR/xslt-30/) and [XPath 3.1](https://www.w3.org/TR/xpath-31/) for the following [OSCAL models](https://pages.nist.gov/OSCAL/docs/architecture/):

- [Catalog XML-to-JSON](convert/oscal_catalog_xml-to-json-converter.xsl): Supports the conversion of OSCAL XML-based control catalogs to the OSCAL JSON catalog format.
- [Profile XML-to-JSON](convert/oscal_profile_xml-to-json-converter.xsl): Supports the conversion of OSCAL XML-based control baselines to the OSCAL JSON profile format.
- [System Security Plan (SSP) XML-to-JSON](convert/oscal_ssp_xml-to-json-converter.xsl): (Experimental) Supports the conversion of OSCAL XML-based SSPs to the OSCAL JSON SSP format.

**IMPORTANT** : XSLT 3.0 and XPath 3.1 are only required when using the NIST provided tools for converting OSCAL content between JSON and XML. Any version of XSLT or XPath may be used when transforming or querying OSCAL files for other reasons. These newer versions of XSLT and XPath offer more robust capabilities, that are needed to support the OSCAL converters.

## Converting OSCAL XML Content to JSON

The OSCAL project uses [Saxon-HE (Saxon Home Edition)](http://xmlsoft.org/xmllint.html) to evaluate the XSLT templates supporting conversion of OSCAL XML and JSON [content](../content) provided in this repository. *Saxon-HE* is an open source implementation of XSLT 3.0, XPath 2.0 and 3.1, and XQuery 3.1 supporting Java and .NET programming environments. These versions of *Saxon-HE* can be [downloaded directly](http://saxon.sourceforge.net/#F9.9HE) or the Java version can be downloaded using [Apache Maven](https://mvnrepository.com/artifact/net.sf.saxon/Saxon-HE). Saxonica also offers Saxon PE and EE versions, which are commercial products with technical support and redistribution rights.

The OSCAL project uses *Saxon-HE* with Java version 8 or greater.

The following example uses **Saxon HE** to convert an OSCAL catalog XML file to JSON using one of the NIST-provided [JSON to XML XSLT converters](convert). This example assumes that Java 8+ and Saxon-HE have already been installed.

```
java -jar "saxon9he.jar" -xsl:"oscal_catalog_xml-to-json-converter.xsl" -s:"oscal-catalog.xml" -o:"oscal-catalog.json" json-indent=yes
```

The Saxon JAR file is named ```saxon9he.jar```. The catalog converter is specified as ```-xsl:"oscal_catalog_xml-to-json-converter.xsl"```, the source catalog XML file is specified as ```-s:"oscal-catalog.xml"```, and the destination catalog JSON file is specified as ```-o:"oscal-catalog.json"```. Paths\names of these files need to be provided based on the location of the files on your computer.

The [online documentation](http://www.saxonica.com/documentation/#!using-xsl/commandline) for *Saxon* provides more information on the command line arguments.
