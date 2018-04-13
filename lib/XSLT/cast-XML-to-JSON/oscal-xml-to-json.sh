# Converts OSCAL into XPath's JSON XML syntax, then converts that to JSON
OSCALXML=$1
BASENAME=${OSCALXML%.xml}


# This could be a call to maven, gradle or functional equivalent
SAXON="/home/wendell/Saxon/saxon9he.jar"
# Saxon CL documented here: http://www.saxonica.com/documentation9.5/using-xsl/commandline.html

# Set up calls to Saxon - old-fashioned file-writing pipeline
# produces (and retains) intermediate results
# JAVACALL1="java -jar $SAXON -s:$OSCALXML          -o:$BASENAME-json.xml -xsl:oscal-json-map.xsl"
# JAVACALL2="java -jar $SAXON -s:$BASENAME-json.xml -o:$BASENAME.json     -xsl:json-write.xsl"

# This call performs both steps in one (the pipeline is internal to the XSLT)
JAVACALL3="java -jar $SAXON -s:$OSCALXML -o:$BASENAME.json -xsl:oscal-json-write.xsl"

# Now ...
echo
echo Producing JSON from $OSCALXML ...
echo
echo $JAVACALL3

# Go for it --
# $JAVACALL1
# $JAVACALL2
$JAVACALL3