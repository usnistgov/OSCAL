# Rewrites a file in XPath's JSON XML syntax, as JSON
XMLJSON=$1
BASENAME=${XMLJSON%.xml}

# This should be a call to maven, gradle or functional equivalent
SAXON="/home/wendell/Saxon/saxon9he.jar"
# Saxon CL documented here: http://www.saxonica.com/documentation9.5/using-xsl/commandline.html

# Set up call to Saxon
JAVACALL="java -jar $SAXON -s:$XMLJSON -o:$BASENAME.json -xsl:json-write.xsl"

# Now ...
echo
echo Producing JSON from $XMLJSON ...
echo
echo $JAVACALL

# Go for it --
$JAVACALL
