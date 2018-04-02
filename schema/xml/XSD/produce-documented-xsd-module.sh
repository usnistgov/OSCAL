# Invokes produce-schema-module.xpl to produce a schema module with documentation injected

# Argument 1 is path to XSD module
XSD_MODULE=$1

# This should be a call to maven, gradle or functional equivalent
CALABASH=/home/wendell/xmlcalabash-1.1.20-98/xmlcalabash-1.1.20-98.jar

# OSCALDOCS has relative path to OSCAL tag documentation
# For now, it is hard-wired in the XProc file
# OSCALDOCS=../../docs/schema/oscal-oscal.xml

# munge input file name: _catalog.xsd becomes catalog.xsd
TRIMNAME=$(sed 's/_//' <<< $XSD_MODULE)
# now prepend it with a path (going up a directory)
RESULTPATH="../oscal-"
RESULTNAME="$RESULTPATH$TRIMNAME"

# Set up call to Calabash
JAVACALL="java -jar $CALABASH -ixsd-module=$XSD_MODULE --output $RESULTNAME produce-schema-module.xpl"

# Now ...
echo
echo Injecting documentation into $XSD_MODULE: see results at $RESULTNAME
echo
echo $JAVACALL

# Go for it --
$JAVACALL
