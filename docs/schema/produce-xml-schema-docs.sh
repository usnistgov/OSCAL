# Invokes produce-schema-set.xpl to produce all three schema modules with injected docs

# This should be a call to maven, gradle or functional equivalent
CALABASH=/home/wendell/xmlcalabash-1.1.20-98/xmlcalabash-1.1.20-98.jar

# Set up call to Calabash
JAVACALL="java -jar $CALABASH produce-schema-doc-set.xpl"

# Now ...
echo
echo Processing schema documentation set
echo
echo $JAVACALL

# Go for it --
$JAVACALL
