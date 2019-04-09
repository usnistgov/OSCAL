#!/bin/bash

# Produces Metaschema artifacts from an OSCAL Metaschema metaschema
# Including XML and JSON schemas, conversion utilities (XSLTs) and Markdown documentation

# export SAXON_HOME="/mnt/c/Users/wap1/Downloads/Saxon"

METASCHEMAXML=$1
BASE=$2

# munge input file name: oscal-catalog-metaschema.xml becomes oscal-catalog (and later, oscal-catalog-schema)
BASENAME=oscal-$BASE
BASE=$(sed 's/oscal-//'  <<< $BASENAME)

echo "Using basename: $BASENAME"
echo "Using base: $BASE"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

OSCALDIR=$DIR/../..


if [[ ! -v SAXON ]]; then
    if [[ ! -v SAXON_HOME ]]; then
        echo "SAXON_HOME is not set"
        exit 1
    elif [[ -z "$SAXON_HOME" ]]; then
        echo "SAXON_HOME is set to the empty string"
        exit 1
    fi
    SAXON=$SAXON_HOME/saxon.jar
fi

# SAXON=/home/circleci/.m2/repository/net/sf/saxon/Saxon-HE/9.9.0-1/Saxon-HE-9.9.0-1.jar
if [ ! -f $SAXON ]; then
    echo "The saxon library was not found at: $SAXON!"
    exit 1
fi

# Saxon CL documented here: http://www.saxonica.com/documentation9.8/using-xsl/commandline.html

LIBDIR=$OSCALDIR/build/metaschema
XSDDIR=$OSCALDIR/schema/xml
JSONDIR=$OSCALDIR/schema/json
CONV_DIR=$OSCALDIR/util/convert
DOCSDIR=$OSCALDIR/docs/source/includes/schema

MAKE_XSD="java -jar $SAXON -s:$METASCHEMAXML -o:$XSDDIR/$BASENAME-schema.xsd -xsl:$LIBDIR/xml/produce-xsd.xsl"
MAKE_JSC="java -jar $SAXON -s:$METASCHEMAXML -o:$JSONDIR/$BASENAME-schema.json -xsl:$LIBDIR/json/produce-json-schema.xsl"

CONV_XML="java -jar $SAXON -s:$METASCHEMAXML -o:$CONV_DIR/$BASENAME-xml-converter.xsl -xsl:$LIBDIR/xml/produce-xml-converter.xsl"
CONV_JSON="java -jar $SAXON -s:$METASCHEMAXML -o:$CONV_DIR/$BASENAME-json-converter.xsl  -xsl:$LIBDIR/json/produce-json-converter.xsl"

# DOCS PIPELINE DISABLED UNTIL INTEGRATION
# DOC_XML="java -jar $SAXON -s:$METASCHEMAXML -o:$DOCSDIR/xml/_${BASE}.md -xsl:$LIBDIR/xml/$BASENAME/$BASENAME-xml-docs-md.xsl"
# DOC_JSON="java -jar $SAXON -s:$METASCHEMAXML -o:$DOCSDIR/json/_${BASE}.md -xsl:$LIBDIR/json/$BASENAME/$BASENAME-json-docs-md.xsl"

# Now ...
echo
echo Producing JSON and XML schemas and tools from $METASCHEMAXML ...

$MAKE_XSD
echo _ Made XSD ________________________ $XSDDIR/$BASENAME-schema.xsd
$MAKE_JSC
echo _ Made JSON Schema ________________ $JSONDIR/$BASENAME-schema.json
$CONV_XML
echo _ Made XML-to-JSON converter ______ $CONV_DIR/$BASENAME-xml-converter.xsl
$CONV_JSON
echo _ Made JSON-to-XML converter ______ $CONV_DIR/$BASENAME-json-converter.xsl

# $DOC_XML
# $DOC_JSON
# echo _ Made XML and JSON documentation _ $DOCSDIR/xml/_${BASE}.md $DOCSDIR/json/_${BASE}.md
echo
