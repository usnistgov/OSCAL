# How to Validate OSCAL

## XML or JSON?

XML files use XML syntax: they are [*well-formed* by the rules of XML](https://pages.nist.gov/OSCAL/concepts/layer/validation/). If you can process your file using a conformant XML parser, the file is XML.

Well-formedness also applies to JSON and YAML and their respective parsers.

But *validating* goes beyond parsing: it tells you not only that a file can be read successfully, but also that its data structures conform to rules for a particular application of XML, JSON, or YAML. [Well-formed JSON, XML, or YAML is not necessarily valid OSCAL JSON, XML, or YAML](https://pages.nist.gov/OSCAL/concepts/layer/validation/).

If working with XML you will need an XML *schema* (or functional equivalent) to validate your OSCAL. If working with JSON or YAML, you will need a JSON schema. Normative schemas suitable for validating the various OSCAL models are available in the project's source code repository [for XML](https://github.com/usnistgov/OSCAL/tree/main/xml/schema) and [for JSON and YAML](https://github.com/usnistgov/OSCAL/tree/main/json/schema).

## What are the OSCAL models?

OSCAL comes in several different forms, with data models in JSON, XML, and YAML. Please review [this page with the status of all the models as organized into layers](https://pages.nist.gov/OSCAL/concepts/layer/#status-of-the-oscal-layers) for information about each model and the status of its respective schemas.

## OSCAL "complete" schema

Additionally, there are "complete" XML and JSON schemas, which can validate any kind of OSCAL. It is larger and more complex than the model-specific schemas and may not be as efficient, but it can be convenient to use one schema file as an entry point to validate one or more OSCAL documents without knowing the particular model in advance, whether it be a `component-definition`, `system-security-plan`, `assessment-plan`, et cetera.

## How do I apply a schema to a document to determine validity?

Schemas are built using standard schema languages that are supported by commodity tools. These tools can all apply the same schemas to the same documents, and give the same results.

For OSCAL XML, this schema syntax is [XML Schema Definition (XSD)](https://www.w3.org/TR/xmlschema-1/). For OSCAL JSON, the schema syntax is [JSON Schema](https://json-schema.org/). Many freely available, open-source, and commercial implementations are available. These schema standards are also built in to many common application frameworks and development environments.

Each tool will have its own way to provide for validation. Bindings or configurations to link documents to schemas can be maintained either inside or outside the documents themselves; many tools offer several ways to do this.

Some tools support self-contained validation functionality without full-fledged application frameworks or development environments, with tools like [`xmllint`](https://linux.die.net/man/1/xmllint/) offering command-line interfaces. Similarly, you can use the [`ajv-cli`](https://github.com/ajv-validator/ajv-cli) for JSON.

## What does success look like?

If you validate an OSCAL document with a local copy of a schema with `xmllint`, it will return results to the standard output (STDOUT) stream like so:

```
$ xmllint oscal.xml --schema oscal-schema.xsd --noout
oscal.xml validates
```

There is no detailed output, just a statement that indicates validation has been performed successfully.

If you remove the `--noout` flag from the command line, a copy of the input will be returned. This is because the utility is designed for a pipeline architecture, in which its outputs (written to `STDOUT`) can be provided as input to the next tool in the pipeline.

As for OSCAL JSON, the results from validation with AJV will look like this:

```
# Install the ajv-formats library in NodeJS runtime to avoid runtime errors.
npm install -g ajv-formats ajv-cli
ajv-cli validate -s oscal-schema.json -d oscal.json -c ajv-formats
oscal.json valid
```

## What does an error look like?

### Well-formed, but not valid
If your document is not valid, the results may look like this:

```
Element '{http://csrc.nist.gov/ns/oscal/1.0}last-modified': This element is not expected. Expected is ( {http://csrc.nist.gov/ns/oscal/1.0}title ).
test-invalid-profile.xml fails to validate
```

The important line here is the final one. However, there may be one or more messages preceding it, describing the finding of the parser that a validation rule has been violated.

### Not even well-formed

It can happen, however, that the file is not even legible to the processor ("parser"), because it is not well-formed to the syntax rules.

In such a case, XML Lint signals trouble like this:

```
test-invalid-profile.xml:10: parser error : Opening and ending tag mismatch: profile line 2 and metadata
  </metadata>
             ^
test-invalid-profile.xml:11: parser error : Extra content at the end of the document
  <merge>
  ^
```

In this case the processor reports the syntax issues it detects, to the extent possible, for a document that is not well-formed. The processor will be unable to complete validation of the document because it is not well-formed.

## What can you learn from errors?

A validation error tells you, first and foremost, that your file is incorrect in a basic way. For example, an element (data structure) may be out of place, or missing a required piece. Tools that fail to implement schema validation, misconfigured tools, data quality issues, workflow issues, or many other causes may be the cause. They also vary in how easy they are to correct. The most common problem is that the wrong schema is being used.

The most important consideration in correcting a validation error is selecting the appropriate schema and the appropriate version of that schema. OSCAL maintains backward compatibility across all schemas as expressed through [the use of semantic versioning](https://github.com/usnistgov/OSCAL/blob/main/docs/content/downloads/_index.md#oscal-releases).

A *well-formedness error*, however, tells you your file is incorrect in a more fundamental way. It is both more severe (further processing cannot continue) but also easier to address by using tools correctly. In a mature system, well-formedness errors should be rare, and when they do occur it is because preliminary checks for well-formedness were not implemented or ignored.

## How can I correct my errors?

End users will ordinarily find it easiest and best to edit a file in an OSCAL tool with a graphical user interface or a structured editor. These would be tools that are especially built or configured to support changing the file while respecting the rulesof well-formedness and validating against the rules of an intended schema.

In order to build such tools and support other operations, developers may also do this work. Commercial off-the-shelf developer environments may support these basic operations for a range of formats.

Finally, XML and JSON are both based on the conventions of *plain-text* (UTF-8 in the case of JSON; any encoding your processor supports in the case of XML). As such, they can be edited in any text editor.

You should validate OSCAL documents saved to files to ensure it will work for the next operation.

## What does validation *not* tell me?

The rules expressed and enforced by a schema are limited to those that can be systematically checked by automated processes. Valid OSCAL documents are *not necessarily* "correct" with respect to the information they represent. For OSCAL, validation is an objective determination by a program, whereas "correct" remains a subjective determination based on analysis by a person. Validation ensures only that *your data is fit for further processing*; such processing can include operations to determine the data's correctness, completeness, adequacy, veracity, or anything else not defined or definable by a schema. 

## Other ways to validate?

The provided schemas are machine-generated and tested to reflect and enforce the rules of OSCAL, but they are not the only way to validate. Alternative schema technologies and schema "emulators" are conceivable and sometimes useful. Refer to the [the Metaschema repository](https://github.com/usnistgov/metaschema/) for more details on the Metaschema technology from which our schemas derive, and which can be used as a basis for alternative strategies and approaches to document validation.
