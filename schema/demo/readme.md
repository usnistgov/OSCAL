# Demo metaschema for testing

A small metaschema for testing Metaschema semantics, features and infrastructure.

Like a "real" metaschema, the demo validates against Metaschema schema and Schematron, and can be processed using the same toolkit to produce analogous outputs.

To do:

- [x] isolate and shake out so all parts run without error, producing results
- [x] go back and test with out of line examples (both XML and JSON sides)
- [x] include prose module into schema as literal - when exists(//prose)
- [x] rebuild 'import' as 'model/@echo' w./ Schematron for link integrity
- [x] write and test shell XSLT for markdown docs production

Further:

- [ ] embedded Schematron or equivalent / OSCAL declarations model in metaschema?
- [x] implement namespaces per metaschema