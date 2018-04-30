# OSCAL Metaschema

Check out the [OSCAL Metaschema](OSCAL-metaschema.xml) in its current form.

This is intended to support:

* XSD and JSON Schema production, coordinated from a unified source
* Documentation (embedded and external)

OSCAL schemas produced from Metaschema are located in `schemas/OSCAL`. The top-level schemas are currently `oscal-schema.xsd` and `oscal-json-schema.json`. Other files in that directory are modules or components.

The XPath directory contains an XSD describing the XPath mapping for JSON (useful for debugging).

The `metaschema` directory contains validation logic for the metaschema format. It integrates the OSCAL schema from the directory next to it, so that OSCAL samples given in the metaschema can be validated against the models declared for them.

Currently only controls are modeled in the metaschema, not yet catalogs, groups or subcontrols.

The shell script `produce-schemas.sh` shows how to use the XSLTs to (re)produce the schemas from their Metaschema source.

## In place:

- [x] XSLT to produce XSD from metaschema source - the XSD so produced, describes OSCAL correctly and the sample document validates to it
- [x] A sample instance (dummy control description) conformant both to the OSCAL schema and to the (produced) metaschema XSD
- [x] A JSON version of the sample. Produced by the current xml-to-json logic inside the `lib` subdirectory. The sample holds the same information as the XML file.
- [x] A JSON Schema document, and an XSLT that produces it, that successfully constrains the JSON sample in the same way as the XSD constrains and validates the XML sample.

## Next steps

- [ ] Refactor the XML->JSON conversion code to integrate the metaschema (as a 'driver') - the current conversion was mapped into OSCLA by hand
- [ ] Look at / sketch out the conversion coming the other way
- [ ] Expand the metaschema and test at the catalog level
- [ ] Expand and test on profiles and the declarations model

    
