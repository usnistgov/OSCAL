# Converts JSON via an XPath function into XML, from there into OSCAL
OSCALJSON=$1
BASENAME=${OSCALJSON%.json}

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

# Set up calls to Saxon - old-fashioned file-writing pipeline

# This call performs both steps in one (the pipeline is internal to the XSLT)
JAVACALL="java -jar $SAXON -o:$BASENAME.xml -xsl:oscal-catalog-json-converter.xsl json-file=$OSCALJSON"

# Now ...
echo
echo Producing XML from $OSCALJSON ...
echo
echo $JAVACALL

# Go for it --
$JAVACALL