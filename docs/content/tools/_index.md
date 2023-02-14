---
title: Tools
heading: OSCAL Tools
menu:
  primary:
    name: Tools
    weight: 50
toc:
  enabled: true
toc:
  enabled: true
---

The [OSCAL models](/concepts/layer/) provide standardized formats for exchanging control, control implementation, and control assessment information in XML, JSON, and YAML, in support of interoperable security assessment automation and continuous monitoring. These formats allow this information to be exchanged between tools ensuring interoperability, and for individual tools, to process exchanged data, supporting analytics, user interaction, and security assessment automation where suitable.

{{% callout note %}} Tools supporting the use of the OSCAL models are instrumental for a broad adoption of OSCAL in support of interoperable security assessment automation.  The community maintains a list of known OSCAL tools in the [Awesome OSCAL](https://github.com/oscal-club/awesome-oscal) repository.{{% /callout %}}

The following types of tools are developed by NIST OSCAL team:
- commodity tooling for basic operations such as format validation, data conversion between supported formats
- application frameworks, tools and libraries

## Commodity Tooling - Basic Operations

In order to support data interchange and semantic interoperability in this heterogeneous environment, the OSCAL project publishes some basic software components along with the OSCAL specifications, to help serve as reference points or "scaffolding" for developers and for partners in data exchange.

See the OSCAL  [XML](https://github.com/usnistgov/OSCAL/tree/main/xml) and [JSON/YAML](https://github.com/usnistgov/OSCAL/tree/main/json) resource pages in the project repository for more details.

### Validation

OSCAL can be formally *validated* to help confirm its correctness and fitness for processing. Validation of any OSCAL content instance can be accomplished by applying the appropriate schema for the respective format. For example, a System Security Plan (SSP) represented in OSCAL XML can be validated against the [SSP XML Schema](https://github.com/usnistgov/OSCAL/blob/main/xml/schema/oscal_ssp_schema.xsd), which defines (in machinable form) the validation rules for OSCAL SSPs in XML. Validation operations are based entirely on non-proprietary, standardized processes available in multiple tool implementations, by reference to open, publicly available schemas, located in the [OSCAL repository](https://github.com/usnistgov/OSCAL/) for [XML](https://github.com/usnistgov/OSCAL/tree/main/xml/schema) and [JSON/YAML](https://github.com/usnistgov/OSCAL/tree/main/json/schema) respectively.

YAML developers should take note that the JSON Schemas can be applied to YAML content instances.

More details about validation are offered on the page [Well-formed Data Formats and Valid OSCAL](https://pages.nist.gov/OSCAL/concepts/layer/validation/).

### Data conversion

Because OSCAL can be XML, JSON or YAML, it is sometimes useful to convert OSCAL XML into the equivalent OSCAL JSON, or vice-versa.  The OSCAL project publishes data convertors for this purpose. Using an appropriate converter, OSCAL in any format, valid to one of the OSCAL models, can be converted into another format also valid to its (corresponding) model. Note that since JSON and YAML express the same data model (YAML syntax being defined as a superset of JSON syntax), conversion between these formats is more straightforward and does not require "OSCAL-awareness".

Additionally, OSCAL applications such as those listed below, when reading and writing OSCAL, may themselves support more than one syntax. Check the features of your processor in case you do not need a standalone tool for data conversion.

Details on acquiring and running the converters:

- converting *into* JSON - [XML to JSON](https://github.com/usnistgov/OSCAL/tree/main/json)
- converting *into* XML - [JSON to XML](https://github.com/usnistgov/OSCAL/tree/main/xml)
 
## NIST's OSCAL Application Frameworks, Tools and Libraries

Valid OSCAL is open-ended in application. Some of the tools described provide validation and conversion, while others do not, presuming that inputs are already valid.

| Name | Provider/Developer | Description | Type |
|:---|:---|:---|:---|
| [OSCAL Deep Diff](https://github.com/usnistgov/oscal-deep-diff) | NIST OSCAL Project | A Typescript-based CLI application and library that produces machine readable and human-consumable comparisons of JSON OSCAL artifacts. | open source |
| [OSCAL Java Library](https://github.com/usnistgov/liboscal-java) | NIST OSCAL Project | A Java-based programming API for reading and writing content conformant to the OSCAL XML, JSON, and YAML based models. | open source |
| [XSLT Tooling](https://github.com/usnistgov/oscal-tools/tree/master/xslt) | NIST OSCAL Project | A variety of Extensible Stylesheet Language (XSL) Transformations (XSLT), Cascading Style Sheets (CSS), and related utilities for authoring, converting, and publishing OSCAL content in various forms. | open source |
