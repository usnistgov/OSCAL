# Converts JSON via an XPath function into XML, from there into OSCAL
OSCALJSON=$1
BASENAME=${OSCALJSON%.json}


# This could be a call to maven, gradle or functional equivalent
SAXON="/home/wendell/Saxon/saxon9he.jar"
# Saxon CL documented here: http://www.saxonica.com/documentation9.5/using-xsl/commandline.html

# Set up calls to Saxon - old-fashioned file-writing pipeline
# produces (and retains) intermediate results
# JAVACALL1="java -jar $SAXON -s:$OSCALXML          -o:$BASENAME-json.xml -xsl:oscal-json-map.xsl"
# JAVACALL2="java -jar $SAXON -s:$BASENAME-json.xml -o:$BASENAME.json     -xsl:json-write.xsl"

# This call performs both steps in one (the pipeline is internal to the XSLT)
JAVACALL="java -jar $SAXON -o:$BASENAME.xml -xsl:oscal-catalog-json-converter.xsl json-file=$OSCALJSON"


# Now ...
echo
echo Producing XML from $OSCALJSON ...
echo
echo $JAVACALL

# Go for it --
$JAVACALL