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

The [OSCAL models](/concepts/layer/) provide standardized formats for exchanging control, control implementation, and control assessment information in XML, JSON, and YAML. These formats allow this information to be exchanged between tools and for individual tools to process exchanged data, supporting analytics, user interaction, and increased automation.

Tools supporting the use of the OSCAL models are listed below in the following categories:

- Commodity tooling supporting basic operations
- Tools and applications developed by the OSCAL team or by third parties

If you have produced a tool that supports the OSCAL formats which you would like to have listed on this page, please [contact us](/contact/).

## Disclaimer

**Certain products may be identified on this web page, but such identification does not imply recommendation by the US National Institute of Standards and Technology or other agencies of the US Government, nor does it imply that the products identified are necessarily the best available for the purpose.**

See the [NIST Software Disclaimer](https://www.nist.gov/disclaimer) for more details.

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
 
## OSCAL Application Frameworks, Tools and Libraries

Valid OSCAL is open-ended in application. Some of the tools described provide validation and conversion, while others do not, presuming that inputs are already valid.

| Name | Provider/Developer | Description | Type |
|:---|:---|:---|:---|
| [Compliance trestle](https://github.com/IBM/compliance-trestle) | IBM | A python SDK and command line tool which manipulates OSCAL structures and supports transformation of data into OSCAL. | open source |
| [control_freak](https://controlfreak.risk-redux.io/) | Risk Redux | This tool seeks to provide folks with a searchable and easy-to-navigate reference for NIST SP 800-53 Revision 5. It is [an open-source application from the Risk Redux project](https://github.com/risk-redux/control_freak), built using parsed content directly from the OSCAL repositories. | open-source |
| [DRT Confidence](https://www.drtstrategies.com/drt-confidence-fedramp/) | DRT Strategies Inc. | DRTConfidence is a next generation Governance, Risk and Compliance (GRC) solution to help organizations transition to OSCAL and continuous compliance. DRTConfidence is available in FedRAMP High environments and supports all OSCAL artifacts: Catalogs, Profiles, Component Definitions, System Security Plans, Security Assessment Plans, Security Assessment Reports, POAMs and conforms to the OSCAL v1.0.0 specification and its schemas. Additional information can be found at [DRT Confidence for FedRAMP](https://www.drtstrategies.com/drt-confidence-fedramp/). | Commercial License |
| [Ignyte Assurance Platform](https://www.ignyteplatform.com ) |  Ignyte Assurance Platform | Modern security risk and compliance orchestration platform for managing near real-time authorization decisions for FedRAMP, Continuous ATOs and CNSSI 1253 packages (ie SSPs, SAP, SARs, POA&Ms, etc...) Allows the ability to build, manage and streamline OSCAL components. OSCAL data model with options for simplified OSCAL data models for commercial, Federal and DoD ATO packages. | Commercial License |
| [OSCAL4NEO4J](https://github.com/Agh42/oscal4neo4j) | The OSCAL4NEO4J Project | This project features a set of Neo4J cypher scripts which will import OSCAL catalogs and profiles directly from the official Github-repositories into a Neo4J database. Once imported, the information can be queried to gain insight into the structure of those catalogs and baselines. The project aims to add tool support for the implementation and assessment layers by allowing generation of component definitions, system security plans, assessment-plans, assessment-results and POA&Ms. | open source |
| [OSCAL Deep Diff](https://github.com/usnistgov/oscal-deep-diff) | NIST OSCAL Project | A Typescript-based CLI application and library that produces machine readable and human-consumable comparisons of JSON OSCAL artifacts. | open source |
| [OSCAL Editor](https://github.com/EasyDynamics/oscal-editor-deployment) |  Easy Dynamics | Simple Docker deployment of the [OSCAL REST Service](https://github.com/EasyDynamics/oscal-rest-service) and web-based [OSCAL React](https://github.com/EasyDynamics/oscal-react-library/tree/develop/example) user interface for the OSCAL Editor. | open source |
| [OSCAL Java Library](https://github.com/usnistgov/liboscal-java) | NIST OSCAL Project | A Java-based programming API for reading and writing content conformant to the OSCAL XML, JSON, and YAML based models. | open source |
| [OSCAL React Component Library](https://github.com/EasyDynamics/oscal-react-library) | Easy Dynamics | A library of reusable React components and an [example user interface application](https://oscal-viewer.msd.easydynamics.com/catalog) that provides a direct UI into OSCAL. | open source |
| [OSCAL REST API](https://github.com/EasyDynamics/oscal-rest) |  Easy Dynamics | An initial OpenAPI definition of an OSCAL REST API that describes how systems might manipulate catalogs, profiles, components, and SSPs. | open source |
| [OSCAL REST Service](https://github.com/EasyDynamics/oscal-rest-service) |  Easy Dynamics | Initial implementation of some the [OSCAL REST API](https://github.com/EasyDynamics/oscal-rest) which persists data as files in local directories. | open source |
| [RegScale (formerly Atlasity)](https://regscale.com) | RegScale (spun out of C2 Labs)  | RegScale Community Edition is a free to use, API-centric real-time Governance, Risk and Compliance (GRC) platform that deploys in any environment, shifting left compliance by integrating with security and compliance tools via API to keep compliance documentation continuously up to date. GRC staff can work in the UI, engineers can write scripts to feed the API, and both human- and machine-readable (OSCAL - all layers supported) content is automatically generated on demand, achieving a continuous Authority to Operate (cATO). Additional information can be found here: [RegScale Delivers Free Platform to Create OSCAL Content](https://regscale.com/oscal). | [license](https://qa-ce.regscale.com/assets/eula-ce.pdf) |
| [Xacta 360](https://www.telos.com/offerings/xacta-360-continuous-compliance-assessment/) | Telos | Xacta 360 is a cyber risk management and compliance analytics platform that enables users to create and submit FedRAMP system security plans (SSPs) in OSCAL format. Future OSCAL capabilities are forthcoming as the standard evolves. | [license](https://cdn.telos.com/wp-content/uploads/2021/06/22150746/Xacta-360-EULA-US.pdf) |
| [XML Jelly Sandwich](https://github.com/wendellpiez/XMLjellysandwich) | Wendell Piez (NIST) | Interactive XSLT in the browser includes [OSCAL demonstrations](https://wendellpiez.github.io/XMLjellysandwich/oscal/). | open source |
| [XSLT Tooling](https://github.com/usnistgov/oscal-tools/tree/master/xslt) | NIST OSCAL Project | A variety of Extensible Stylesheet Language (XSL) Transformations (XSLT), Cascading Style Sheets (CSS), and related utilities for authoring, converting, and publishing OSCAL content in various forms. | open source |
