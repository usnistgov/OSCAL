# Converts OSCAL into XPath's JSON XML syntax, then converts that to JSON

METASCHEMAXML=$1

# munge input file name: oscal-catalog-metaschema.xml becomes oscal-catalog-schema
TRIMNAME=$(sed 's/-metaschema//' <<< $METASCHEMAXML)
BASENAME=$(sed 's/.xml//'  <<< $TRIMNAME)

OSCALDIR=../..
LIBDIR=$OSCALDIR/build/metaschema

XSD_BASE=$OSCALDIR/schema/xml/$BASENAME-schema
JSON_BASE=$OSCALDIR/schema/json/$BASENAME-schema
XMLJSXSLT=$OSCALDIR/util/convert/$BASENAME-xml-converter.xsl
JSXMLXSLT=$OSCALDIR/util/convert/$BASENAME-json-converter.xsl

# This could be a call to maven, gradle or functional equivalent
SAXON="/home/wendell/Saxon/saxon9he.jar"
# Saxon CL documented here: http://www.saxonica.com/documentation9.5/using-xsl/commandline.html

# Each call produces a separate schema
XSD_MAKE="java -jar $SAXON -s:$METASCHEMAXML -o:$XSD_BASE.xsd -xsl:$LIBDIR/produce-xsd.xsl"
JSONSCHEMA_MAKE="java -jar $SAXON -s:$METASCHEMAXML -o:$JSON_BASE.json -xsl:$LIBDIR/produce-json-schema.xsl"
XSD_DOCS="java -jar $SAXON -s:$METASCHEMAXML -o:$XSD_BASE-docs.md -xsl:$LIBDIR/metaschema-xml-docs-md.xsl"
JSONSCHEMA__DOCS="java -jar $SAXON -s:$METASCHEMAXML -o:$JSON_BASE-docs.md -xsl:$LIBDIR/metaschema-json-docs-md.xsl"
XMLCONVERTER_MAKE="java -jar $SAXON -s:$METASCHEMAXML -o:$XMLJSXSLT -xsl:$LIBDIR/produce-xml-converter.xsl"
JSONCONVERTER_MAKE="java -jar $SAXON -s:$METASCHEMAXML -o:$JSXMLXSLT -xsl:$LIBDIR/produce-json-converter.xsl"

# Now ...
echo
echo Producing JSON and XML schemas and tools from $METASCHEMAXML ...
cp -u $LIBDIR/OSCAL/oscal-prose-module.xsd $OSCALDIR/schema/xml
echo _ Updated OSCAL prose XSD module
$XSD_MAKE
echo _ Made XSD ______________________ $XSD_BASE.xsd
$JSONSCHEMA_MAKE
echo _ Made JSON Schema ______________ $JSON_BASE.json
$XMLCONVERTER_MAKE
echo _ Made XML-to-JSON converter ____ $XMLJSXSLT
$JSONCONVERTER_MAKE
echo _ Made JSON-to-XML converter ____ $JSXMLXSLT

$XSD_DOCS
echo $XSD_DOCS
# $JSONSCHEMA__DOCS
echo _ Made markdown documentation . . . Done!
echo

