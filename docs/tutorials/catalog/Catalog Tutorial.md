# OSCAL Catalog Tutorial

Prerequisite: [OSCAL Data Types](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/)

## What is an OSCAL Catalog
##	Example of a Proprietary Catalog 

An [OSCAL](https://www.nist.gov/oscal) Control Catalog is a machine-readable representation of a catalog of security controls which is a collection of security controls and related control enhancements, along with contextualizing documentation and metadata.

For the purpose of this tutorial, a proprietary catalog is created. The file is available for view or download [here](./Catalog Sample.pdf)

##	Reformatting the Control Catalog into an OSCAL Catalog (XML and JSON)
###	Catalog Schemas

The OSCAL Catalog Model can be used to describe a collection of security controls and related control enhancements, along with contextualizing documentation and metadata. The [OSCAL](https://www.nist.gov/oscal) website provides comprehensive information about the [OSCAL Catalog Model](https://pages.nist.gov/OSCAL/documentation/schema/catalog/)

There are two schemas for the Catalog Model:
- an XML Schema based on the [XML Schema Definition Language (XSD) 1.1](https://www.w3.org/TR/xmlschema11-1/) that describes the XML tag set for the OSCAL Catalog Model, and
- a JSON Schema based on the [JSON Schema Draft-07](https://json-schema.org/specification.html) that describes a JSON data object for the OSCAL Catalog Model.

The two schema files are listed below. The schemas are necessary to validate the content created in OSCAL.

| XML Schema | JSON Schema |
| :---------:|:---------:|
| [oscal_catalog_schema.xsd](https://github.com/usnistgov/OSCAL/blob/master/xml/schema/oscal_catalog_schema.xsd)  | [oscal_catalog_schema.json](https://github.com/usnistgov/OSCAL/blob/master/json/schema/oscal_catalog_schema.json) |

###	Control Catalog Model

This tutorial is not focusoing on the schemas themselves but rather on the formatting in OSCAL of a control catalog. For more detail information on each schemas, the reader is referred to [XML Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/catalog/xml-schema/) and [JSON Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/catalog/json-schema/), respectivly.

Current tutorial highlight only the high-level elements of the schemas, to give an overview of the problem.

 The root of the Control Catalog format is `catalog`.
 
A `catalog` contains:
-	`metadata` – mandatory to have one 
-	`groups` – may have none, or as many as necessary
-	`controls` – may have none, or as many as necessary
-	`back-matter` – may have none, or as many as necessary 

|  ![Catalog elements](./Catalog_1_x_s.png)  |  ![Catalog elements](./Catalog_1_j_s.png)  |

#### Catalog's Metadata
The `metadata` has identical structure for all OSCAL files. A separate tutorial is discussing all the elements of a `metadata`. This tutorial is only ilustrating the mandatory elements based on the information in the [Sample Security Catalog](./Catalog%20Sample.md)

#### Formatting a Control in OSCAL

#### Formatting a Back-matter


