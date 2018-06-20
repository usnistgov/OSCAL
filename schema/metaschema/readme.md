# OSCAL Metaschema directory

OSCAL Metaschemas, with documentation of the structures (objects or XML element structures) they define.

Run a metaschema like this:

```
> ./run-metaschema.sh oscal-catalog-metaschema.xml
```

(For the `catalog` metaschema.)

This will produce artifacts based on the metaschema. Locations where the results are written are configured in the script and echoed to the console. The artifacts include:

* Schemas derived from the metaschema, expressed as XSD and JSON Schema;
* Conversion scripts from JSON-based OSCAL (conformant to the schema) to XML-based OSCAL, and the reverse; 
* Documentation in markdown format

Additionally, find metaschema resources including its own schemas in the `/build` directory.

