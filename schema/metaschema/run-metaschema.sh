#!/bin/bash
# Converts OSCAL into XPath's JSON XML syntax, then converts that to JSON

METASCHEMAXML=$1

# munge input file name: oscal-catalog-metaschema.xml becomes oscal-catalog (and later, oscal-catalog-schema)
TRIMNAME=$(sed 's/-metaschema//' <<< $METASCHEMAXML)
BASENAME=$(sed 's/.xml//'  <<< $TRIMNAME)

OSCALDIR=../..


if [[ ! -v SAXON_HOME ]]; then
    echo "SAXON_HOME is not set"
    exit 1
elif [[ -z "$SAXON_HOME" ]]; then
    echo "SAXON_HOME is set to the empty string"
    exit 1
fi

SAXON=$SAXON_HOME/saxon9he.jar

if [ ! -f $SAXON ]; then
    echo "The saxon library was not found at: $SAXON!"
    exit 1
fi

# Saxon CL documented here: http://www.saxonica.com/documentation9.5/using-xsl/commandline.html

LIBDIR=$OSCALDIR/build/metaschema
XSDDIR=$OSCALDIR/schema/xml
JSONDIR=$OSCALDIR/schema/json
CONVERSION_DIR=$OSCALDIR/util/convert

MAKE_XSD="java -jar $SAXON -s:$METASCHEMAXML -o:$XSDDIR/$BASENAME-schema.xsd -xsl:$LIBDIR/xml/produce-xsd.xsl"
MAKE_JSC="java -jar $SAXON -s:$METASCHEMAXML -o:$JSONDIR/$BASENAME-schema.json -xsl:$LIBDIR/json/produce-json-schema.xsl"

DOC_XML="java -jar $SAXON -s:$METASCHEMAXML -o:$XSDDIR/$BASENAME-xml-docs.md -xsl:$LIBDIR/xml/metaschema-xml-docs-md.xsl"
DOC_JSON="java -jar $SAXON -s:$METASCHEMAXML -o:$JSONDIR/$BASENAME-json-docs.md -xsl:$LIBDIR/json/metaschema-json-docs-md.xsl"

CONV_XML="java -jar $SAXON -s:$METASCHEMAXML -o:$CONVERSION_DIR/$BASENAME-xml-converter.xsl -xsl:$LIBDIR/xml/produce-xml-converter.xsl"
CONV_JSON="java -jar $SAXON -s:$METASCHEMAXML -o:$CONVERSION_DIR/$BASENAME-json-converter.xsl  -xsl:$LIBDIR/json/produce-json-converter.xsl"

# Now ...
echo
echo Producing JSON and XML schemas and tools from $METASCHEMAXML ...
cp -u $LIBDIR/OSCAL/oscal-prose-module.xsd $OSCALDIR/schema/xml
echo _ Updated OSCAL prose XSD module
$MAKE_XSD
echo _ Made XSD ______________________ $XSDDIR/$BASENAME-schema.xsd
$MAKE_JSC
echo _ Made JSON Schema ______________ $JSONDIR/$BASENAME-schema.json
$CONV_XML
echo _ Made XML-to-JSON converter ____ $CONVERSION_DIR/$BASENAME-xml-converter.xsl
$CONV_JSON
echo _ Made JSON-to-XML converter ____ $CONVERSION_DIR/$BASENAME-json-converter.xsl
$DOC_XML
$DOC_JSON
echo _ Made markdown documentation ___ find next to schema files
echo
