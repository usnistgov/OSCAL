#!/bin/bash
# Converts OSCAL into XPath's JSON XML syntax, then converts that to JSON

METASCHEMAXML=$1

# munge input file name: oscal-catalog-metaschema.xml becomes oscal-catalog-schema
TRIMNAME=$(sed 's/-metaschema//' <<< $METASCHEMAXML)
BASENAME=$(sed 's/.xml//'  <<< $TRIMNAME)

OSCALDIR=../..
LIBDIR=$OSCALDIR/build/metaschema

XSDRESULT=$OSCALDIR/schema/xml/$BASENAME-schema.xsd
JSCRESULT=$OSCALDIR/schema/json/$BASENAME-schema.json
DOCRESULT=$OSCALDIR/schema/metaschema/$BASENAME-docs.md
XMLJSXSLT=$OSCALDIR/lib/XML-JSON/$BASENAME-xml-converter.xsl
JSXMLXSLT=$OSCALDIR/lib/XML-JSON/$BASENAME-json-converter.xsl

# This could be a call to maven, gradle or functional equivalent

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

# Each call produces a separate schema
JAVACALLX="java -jar $SAXON -s:$METASCHEMAXML -o:$XSDRESULT -xsl:$LIBDIR/produce-xsd.xsl"
JAVACALLJ="java -jar $SAXON -s:$METASCHEMAXML -o:$JSCRESULT -xsl:$LIBDIR/produce-json-schema.xsl"
JAVADOCMS="java -jar $SAXON -s:$METASCHEMAXML -o:$DOCRESULT -xsl:$LIBDIR/metaschema-docs-md.xsl"
JAVAXMLJS="java -jar $SAXON -s:$METASCHEMAXML -o:$XMLJSXSLT -xsl:$LIBDIR/produce-xml-converter.xsl"
JAVAJSXML="java -jar $SAXON -s:$METASCHEMAXML -o:$JSXMLXSLT -xsl:$LIBDIR/produce-json-converter.xsl"

# Now ...
echo
echo Producing JSON and XML schemas and tools from $METASCHEMAXML ...
cp -u $LIBDIR/OSCAL/oscal-prose-module.xsd $OSCALDIR/schema/xml
echo _ Updated OSCAL prose XSD module
$JAVACALLX
echo _ Made XSD ______________________ $XSDRESULT
$JAVACALLJ
echo _ Made JSON Schema ______________ $JSCRESULT
$JAVAXMLJS
echo _ Made XML-to-JSON converter ____ $XMLJSXSLT
$JAVAJSXML
echo _ Made JSON-to-XML converter ____ $JSXMLXSLT
$JAVADOCMS
echo _ Made markdown documentation ___ $DOCRESULT
echo

