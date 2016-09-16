# Invokes produce-schema-set.xpl to produce all three schema modules with injected docs

# This should be a call to maven, gradle or functional equivalent
CALABASH=/home/wendell/xmlcalabash-1.1.20-98/xmlcalabash-1.1.20-98.jar

# Set up call to Calabash
JAVACALL="java -jar $CALABASH produce-xsd-set.xpl"

# Now ...
echo
echo Processing XSD file set : see results as ../\*.xsd
echo
echo $JAVACALL

# Go for it --
$JAVACALL
