#!/bin/bash

# Produces Metaschema artifacts from an OSCAL Metaschema metaschema
# Including XML and JSON schemas, conversion utilities (XSLTs) and Markdown documentation

METASCHEMAXML=charstrings-test_metaschema.xml
BASENAME=charstrings-test

OSCALDIR=../../../..

if [[ -z SAXON_HOME ]]; then
    echo "SAXON_HOME is not set"
    exit 1
elif [[ -z "$SAXON_HOME" ]]; then
    echo "SAXON_HOME is set to the empty string"
    exit 1
fi

SAXON=$SAXON_HOME/Saxon-HE-9.9.1-3.jar

if [ ! -f $SAXON ]; then
    echo "The saxon library was not found at: $SAXON!"
    exit 1
fi

# Saxon CL documented here: http://www.saxonica.com/documentation9.8/using-xsl/commandline.html

LIBDIR=$OSCALDIR/build/metaschema
XSDDIR=.
JSONDIR=.
CONVERSION_DIR=.
CURRENT_DIR=$(pwd -W)
# DOCSDIR=docs

echo Working in $CURRENT_DIR

MAKE_XSD="java -jar $SAXON -s:$METASCHEMAXML -o:$XSDDIR/$BASENAME-schema.xsd -xsl:$LIBDIR/xml/produce-xsd.xsl"
MAKE_JSC="java -jar $SAXON -s:$METASCHEMAXML -o:$JSONDIR/$BASENAME-schema.json -xsl:$LIBDIR/json/produce-json-schema.xsl"

CONV_XML="java -jar $SAXON -s:$METASCHEMAXML -o:$CONVERSION_DIR/$BASENAME-xml-converter.xsl -xsl:$LIBDIR/xml/produce-xml-converter.xsl"
CONV_JSON="java -jar $SAXON -s:$METASCHEMAXML -o:$CONVERSION_DIR/$BASENAME-json-converter.xsl  -xsl:$LIBDIR/json/produce-json-converter.xsl"

EXAMPLE_BASE=charstrings-test_okay-PASS

EXAMPLE_JSON="java -jar $SAXON -s:$EXAMPLE_BASE.xml -o:$EXAMPLE_BASE.json  -xsl:$CONVERSION_DIR/$BASENAME-xml-converter.xsl json-indent=yes"
EXAMPLE_BACK="java -jar $SAXON -it -o:$EXAMPLE_BASE-back.xml  -xsl:$CONVERSION_DIR/$BASENAME-json-converter.xsl json-file=$CURRENT_DIR/$EXAMPLE_BASE.json"

# DOCS_XSLT="java -jar $SAXON -s:$METASCHEMAXML -o:$LIBDIR/temp/$BASENAME-xml-docs-md.xsl -xsl:$LIBDIR/xml/produce-and-run-documentor.xsl"

# Now ...
echo
echo Producing JSON and XML schemas and tools from $METASCHEMAXML ...
$MAKE_XSD
echo _ Made XSD ________________________ $XSDDIR/$BASENAME-schema.xsd
$MAKE_JSC
echo _ Made JSON Schema ________________ $JSONDIR/$BASENAME-schema.json
$CONV_XML
echo _ Made XML-to-JSON converter ______ $CONVERSION_DIR/$BASENAME-xml-converter.xsl
$CONV_JSON
echo _ Made JSON-to-XML converter ______ $CONVERSION_DIR/$BASENAME-json-converter.xsl
$EXAMPLE_JSON
echo _ Produced $EXAMPLE_BASE.json from $EXAMPLE_BASE.xml
$EXAMPLE_BACK
echo _ Produced $EXAMPLE_BASE-back.xml from $EXAMPLE_BASE.json

# $DOCS_XSLT
# echo _ Made Metaschema documentation _ $DOCSDIR/${BASENAME}_xml.md $DOCSDIR/json_${BASENAME}_json.md
# echo
