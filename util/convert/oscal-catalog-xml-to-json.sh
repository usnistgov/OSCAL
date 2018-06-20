# Converts OSCAL into XPath's JSON XML syntax, then converts that to JSON
OSCALXML=$1
BASENAME=${OSCALXML%.xml}

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

# This call performs both steps in one (the pipeline is internal to the XSLT)
JAVACALL="java -jar $SAXON -s:$OSCALXML -o:$BASENAME.json -xsl:oscal-catalog-xml-converter.xsl"

# Now ...
echo
echo Producing JSON from $OSCALXML ...
echo
echo $JAVACALL

# Go for it --
$JAVACALL