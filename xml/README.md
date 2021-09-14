# OSCAL XML Resources

This part of the OSCAL GitHub repository contains useful resources for working with OSCAL content formatted using the Extensible Markup Language (XML).

# Table of Contents
<!-- TOC -->

- [OSCAL XML Resources](#oscal-xml-resources)
- [Table of Contents](#table-of-contents)
- [Available XML Resources](#available-xml-resources)
- [XML Schema for OSCAL Models](#xml-schema-for-oscal-models)
    - [Validating OSCAL XML Content](#validating-oscal-xml-content)
- [OSCAL JSON to XML Converters](#oscal-json-to-xml-converters)
    - [Converting OSCAL JSON Content to XML](#converting-oscal-json-content-to-xml)

<!-- /TOC -->
# Available XML Resources

The following directories provide:

- [schema](schema): XML Schema files that can be used to validate OSCAL content expressed in XML.
- [convert](convert): eXtensible Stylesheet Language Transformations (XSLTs) to convert OSCAL content expressed in other OSCAL formats into XML.

# XML Schema for OSCAL Models

XML Schema based on the [XML Schema Definition Language (XSD) 1.1](https://www.w3.org/TR/xmlschema11-1/) are provided for the following [OSCAL models](https://pages.nist.gov/OSCAL/documentation/schema/):

- [Catalog XML Schema](schema/oscal_catalog_schema.xsd) (Draft): Supports the validation of OSCAL XML-based control catalogs.
- [Profile XML Schema](schema/oscal_profile_schema.xsd) (Draft): Supports the validation of OSCAL XML-based control baselines.
- [System Security Plan (SSP) XML Schema](schema/oscal_ssp_schema.xsd) (Draft): Supports the validation of OSCAL XML-based SSP content.
- [System Component XML Schema](schema/oscal_component_schema.xsd) (Draft): Supports the validation of OSCAL XML-based component definition content.
- [System Assessment Plan (SAP) XML Schema](schema/oscal_assessment-plan_schema.xsd) (Draft): Supports the validation of OSCAL XML-based assessment plan content.
- [System Assessment Report (SAR) XML Schema](schema/oscal_assessment-results_schema.xsd) (Draft): Supports the validation of OSCAL XML-based assessment results content.
- [System POA&M XML Schema](schema/oscal_poam_schema.xsd) (Draft): Supports the validation of OSCAL XML-based POA&M content.

## Validating OSCAL XML Content

The OSCAL project uses [xmllint](http://xmlsoft.org/xmllint.html) to perform automated validation of all XML-based OSCAL [content](../content) provided in this repository. *xmllint* is an open source tool that can be [downloaded](http://xmlsoft.org/downloads.html), installed, and run on OSX, Linux, and Windows environments.

The following example uses **xmllint** to perform validation of an OSCAL catalog XML file.

```
xmllint --noout --schema "oscal_catalog_schema.xsd" "catalog.xml"
```

The [online documentation](http://xmlsoft.org/xmllint.html) for *xmllint* provides more information on the commandline arguments.

# OSCAL JSON to XML Converters

The OSCAL project provides Extensible Stylesheet Language Transformation (XSLT) templates based on [XSLT 3.0](https://www.w3.org/TR/xslt-30/) and [XPath 3.1](https://www.w3.org/TR/xpath-31/) for the following [OSCAL models](https://pages.nist.gov/OSCAL/documentation/schema/):

- [Catalog JSON-to-XML](convert/oscal_catalog_json-to-xml-converter.xsl) (Draft): Supports the conversion of OSCAL JSON-based control catalogs to the OSCAL XML catalog format.
- [Profile JSON-to-XML](convert/oscal_profile_json-to-xml-converter.xsl) (Draft): Supports the conversion of OSCAL JSON-based control baselines to the OSCAL XML profile format.
- [System Security Plan (SSP) JSON-to-XML](convert/oscal_ssp_json-to-xml-converter.xsl) (Draft): Supports the conversion of OSCAL JSON-based SSP content to the OSCAL XML SSP format.
- [Component Definition JSON-to-XML](convert/oscal_component_json-to-xml-converter.xsl) (Draft): Supports the conversion of OSCAL JSON-based component definition content to the OSCAL XML content format.
- [Assessment Plan JSON-to-XML](convert/oscal_assessment-plan_json-to-xml-converter.xsl) (Draft): Supports the conversion of OSCAL JSON-based component definition content to the OSCAL XML content format.
- [Assessment Results JSON-to-XML](convert/oscal_assessment-results_json-to-xml-converter.xsl) (Draft): Supports the conversion of OSCAL JSON-based component definition content to the OSCAL XML content format.
- [Plan of Action and Milestones (POA&M) JSON-to-XML](convert/oscal_poam_json-to-xml-converter.xsl) (Draft): Supports the conversion of OSCAL JSON-based component definition content to the OSCAL XML content format.

**IMPORTANT** : XSLT 3.0 and XPath 3.1 are only required when using the NIST provided tools for converting OSCAL content between JSON and XML. Any version of XSLT or XPath may be used when transforming or querying OSCAL files for other reasons. These newer versions of XSLT and XPath offer more robust capabilities, that are needed to support the OSCAL converters.

## Converting OSCAL JSON Content to XML

The OSCAL project uses [Saxon-HE (Saxon Home Edition)](http://saxon.sourceforge.net/) to evaluate the XSLT templates supporting conversion of OSCAL XML and JSON [content](../content) provided in this repository. *Saxon-HE* is an open source implementation of XSLT 3.0, XPath 2.0 and 3.1, and XQuery 3.1 supporting Java and .NET programming environments. These versions of *Saxon-HE* can be [downloaded directly](http://saxon.sourceforge.net/#F9.9HE) or the Java version can be [downloaded](https://search.maven.org/artifact/net.sf.saxon/Saxon-HE) using Apache Maven. Saxonica also offers Saxon PE and EE versions, which are commercial products with technical support and redistribution rights.

The OSCAL project uses *Saxon-HE* with Java version 8 or greater.

The following example uses **Saxon HE** to convert an OSCAL catalog JSON file to XML using one of the NIST-provided [JSON to XML XSLT converters](convert). This example assumes that has been installed and the Saxon-HE jar files have already unzipped.

```
java -jar "saxon9he.jar" -xsl:"oscal_catalog_json-to-xml-converter.xsl" -o:"oscal-catalog.xml" -it json-file="oscal-catalog.json"
```

The Saxon JAR file is named ```saxon9he.jar```. The catalog converter is specified as ```-xsl:"oscal_catalog_json-to-xml-converter.xsl"```, the source catalog JSON file is specified as ```json-file="oscal-catalog.json"```, and the destination catalog XML file is specified as ```-o:"oscal-catalog.xml"```. Paths\names of these files need to be provided based on the location of the files on your computer.

The [online documentation](http://www.saxonica.com/documentation/#!using-xsl/commandline) for *Saxon* provides more information on the command line arguments.
