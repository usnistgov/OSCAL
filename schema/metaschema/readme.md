# OSCAL Metaschema directory

OSCAL Metaschemas, with documentation of the structures (objects or XML element structures) they define.

Run a metaschema like this:

```
> .produce-schemas.sh oscal-catalog-metaschema.xml
```

(For the `catalog` metaschema.)

This will produce two schema files representing the metaschema, along with documentation. (Locations where the results are written are configured in the script and echoed to the console.)

TBD: split the documentation on the two sides, writing examples out in JSON format on the JSON side

Also note that the `metaschema-html.xsl` resource is an XSLT 1.0 stylesheet that functions in a browser such as Firefox. Or apply it using any conformant XSLT 1.0 engine.

Additionally, find metaschema resources including its own schemas in the `/build` directory.
