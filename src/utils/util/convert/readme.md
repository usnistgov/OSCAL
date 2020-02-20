# OSCAL Conversion Utilities

XSLT stylesheets offer bi-directional conversion between XML and JSON versions of OSCAL data conformant (in either variant) to schemas derived from an OSCAL metaschema.

Run your XML through an XML converter to produce JSON. Run the JSON through the XML converter to produce equivalent XML.

These are XSLT 3.0 stylesheets; they have been tested under SaxonHE. They are produced by automated means from metaschema source (found in [the metaschema directory](../../../metaschema), and are not intended to be maintained by hand.

## Invocation from the command line:

See also the shell scripts (`.sh` files) in this subdirectory.

For converting from XML to JSON (where `$OSCALXML` is the path to input file name, `$OSCALJSON` is the output file name path, and `$SAXON` resolves to point to `saxon9he.jar`):

```
$ java -jar $SAXON -s:$OSCALXML -o:$OSCALJSON -xsl:oscal-catalog-json-converter.xsl
```

For coming back the other way:

```
$ java -jar $SAXON -o:$OSCALXML -xsl:oscal-catalog-json-converter.xsl json-file=$OSCALJSON
```

Note in this case the JSON file is designated with a runtime (stylesheet) parameter `json-file=`, and no (XML) source file (`-s`) is given.

