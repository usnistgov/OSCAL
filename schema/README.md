# OSCAL Schema Files

This directory contains the OSCAL schemas and related validation tools. The directory contains both XML and JSON representations for OSCAL. The structure and contents of the directory are as follows:

 * [json](json): This directory contains JSON Schema files describing OSCAL data format(s). They are produced dynamically from inputs in the neighboring [metaschema](metaschema) directory.
 * [metaschema](metaschema): This directory contains the OSCAL metaschema, documenting and specifying its models for production of schema artifacts in neighboring subdirectories.
 * [xml](xml): This directory contains XSD schema files in parallel with the JSON schema files and describing the analogous (XML-based) data formats as the JSON Schema describes. In addition to the (generated) XSD files, this directory also contains a Schematron directory for supplementary (extra-schema) validations of OSCAL or OSCAL formats and data sets.
