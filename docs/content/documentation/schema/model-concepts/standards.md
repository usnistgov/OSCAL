---
title: OSCAL Layer and Model Concepts
description: Provides information about concepts employed in OSCAL layers and models.
aliases:
  - /resources/standards/
weight: 90
---

## Catalog
NIST-provided syntax validation capabilities require the following processing standards:

<center>

|   | **OSCAL Syntax Validation**|
| :---: | :---: |
| **XML** | XML Schema Definition Language (XSD) 1.1 <br /> [ [https://www.w3.org/TR/xmlschema11-1/ ](https://www.w3.org/TR/xmlschema11-1/ )] |
| **JSON** | JSON Schema, draft-07 <br /> [ [https://json-schema.org/specification-links.html#draft-7](https://json-schema.org/specification-links.html#draft-7) ] |
</center>


## Format Conversion

NIST-provided format conversion capabilities require the following processing standards:

<center>

|    | **OSCAL File Conversion** |
| :---: | :---: |
| **XML &#10152; JSON** <br />and<br /> **JSON &#10152; XML** | Extensible Stylesheet Language Transformation (XSLT) 3.0 <br /> [ [https://www.w3.org/TR/2017/REC-xslt-30-20170608/](https://www.w3.org/TR/2017/REC-xslt-30-20170608/)]<br />**AND**<br />XPath 3.1<br />[[https://www.w3.org/TR/xpath-31/](https://www.w3.org/TR/xpath-31/) ] |

</center>

**IMPORTANT** : XSLT 3.0 and XPath 3.1 are only required when using NIST published tools to convert OSCAL files between JSON and XML. 

## Data Type Standards

OSCAL employs existing standards for most data types. Please see the [OSCAL Data Types](../schema/model-concepts/datatypes/) for the standards associated with each data type.

<center>

| **Data Type** | **Standard** |
| :---: | :---: |
| **UUID** |  |

</center>



