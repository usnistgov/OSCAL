# OSCAL File Naming Conventions

This file documents naming conventions for use with different OSCAL files in this repository.

# Table of Contents

- [OSCAL File Naming Conventions](#oscal-file-naming-conventions)
- [Table of Contents](#table-of-contents)
- [Naming OSCAL Catalog and Profile Files](#naming-oscal-catalog-and-profile-files)
    - [Catalog Example](#catalog-example)
    - [Profile Examples](#profile-examples)
- [Naming OSCAL Schema Files](#naming-oscal-schema-files)
    - [Schema Examples](#schema-examples)
- [Naming OSCAL Conversion XSL Templates](#naming-oscal-conversion-xsl-templates)
    - [Conversion XSLT Example](#conversion-xslt-example)

# Naming OSCAL Catalog and Profile Files

OSCAL catalog and profile files must be named according to the following convention:

```
{Authority}_{Source Name}[_{Source Version}][_{Specifier}][_{File Revision}]_{OSCAL Model}.{File Extension}
```

- **Authority** (*required*): The organizational owner of the content.
- **Source Name** (*required*): The proper name of the content's source.
- **Source Revision** (*optional/recommended*): The specific revision of the content's source.
- **Specifier** (optional): An additional name indicating the subject of the content.
- **File Revision** (*optional*): The specific revision of the content instance or file. The revision string should be a [semantic version](https://semver.org/).
- **OSCAL Model** (*required*): The OSCAL model used to format the file's contents. One of "catalog" or "profile".
- **File Extension** (*required*): A file extension indicating the type of the content. One of "xml" or "json".

## Catalog Example

The following file:

```
NIST_SP-800-53_rev4_catalog.xml
```

Uses the following fields:
- **Authority:** ```NIST```
- **Source Name:** ```SP-800-53```
- **Source Revision:** ```rev4```
- **Specifier:** *not used*
- **File Revision:** *not used*
- **OSCAL Model:** ```catalog```
- **File Extension:** ```xml```

## Profile Examples

The following file:

```
NIST_SP-800-53_rev4_LOW-baseline_profile.json
```

Uses the following fields:
- **Authority:** ```NIST```
- **Source Name:** ```SP-800-53```
- **Source Revision:** ```rev4```
- **Specifier:** ```LOW-baseline```
- **File Revision:** *not used*
- **OSCAL Model:** ```profile```
- **File Extension:** ```json```

The previous example uses the specifier ```LOW-baseline``` to identify that the profile is derived from the low baseline defined in SP 800-53 revision 4.

---

The following file:

```
FedRAMP_MODERATE-baseline_profile.xml
```

Uses the following fields:
- **Authority:** ```FedRAMP```
- **Source Name:** ```MODERATE-baseline```
- **Source Revision:** *not used*
- **Specifier:** *not used*
- **File Revision:** *not used*
- **OSCAL Model:** ```profile```
- **File Extension:** ```xml```

In this example, FedRAMP does not provide a specifier, since the source is sufficient to identify the specific profile represents their moderate baseline.

# Naming OSCAL Schema Files

XML and JSON schema files must be named according to the following convention:

```
oscal_{OSCAL Model}_schema[_{File Revision}].{File Extension}
```

- **OSCAL Model** (*required*): The OSCAL model used to format the file's contents. One of "catalog" or "profile".
- **File Revision** (*optional*): The specific revision of the content instance or file. If no *File Revision* is provided, then the file should be considered the latest revision. The revision string should be a [semantic version](https://semver.org/).
- **File Extension** (*required*): A file extension indicating the type of the content. One of "xsd" for XML Schema or "json" for JSON Schema.

## Schema Examples

The following JSON schema for the OSCAL catalog model:

```
oscal_catalog_schema_1.0-M1.json
```

Uses the following fields:
- **OSCAL Model:** ```catalog```
- **File Revision:** 1.0-M1 (for the 1.0 Milestone 1 Release)
- **File Extension:** ```json``` (for JSON schema)

---

The following XML schema for the OSCAL Profile model:

```
oscal_profile_schema.xsd
```

Uses the following fields:
- **OSCAL Model:** ```profile```
- **File Revision:** *not used*
- **File Extension:** ```xsd``` (for XML schema)

# Naming OSCAL Conversion XSL Templates

XML and JSON schema files must be named according to the following convention:

```
oscal_{OSCAL Model}_{Source Format}-to-{Destination Format}_converter[_{File Revision}].{File Extension}
```

- **OSCAL Model** (*required*): The OSCAL model used to format the file's contents. One of "catalog" or "profile".
- **Source Format** (*required*): The format of the source file to convert from. One of "xml" or "json".
- **Destination Format** (*required*): The format of the destination file to convert to. One of "xml" or "json".
- **File Revision** (*optional*): The specific revision of the content instance or file. If no *File Revision* is provided, then the file should be considered the latest revision. The revision string should be a [semantic version](https://semver.org/).
- **File Extension** (*required*): A file extension indicating the type of the converter content. Currently, only "xsl" is provided for XSL templates.

## Conversion XSLT Example

The following XSL template converts an OSCAL catalog in JSON format to the OSCAL catalog XML format:

```
oscal_catalog_json-to-xml-converter.xsl
```

Uses the following fields:
- **OSCAL Model:** ```catalog```
- **Source Format:** ```json```
- **Destination Format:** ```xml```
- **File Revision:** *not used*
- **File Extension:** ```xslt``` (for XSL template)
