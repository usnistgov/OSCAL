# Invokes produce-schema-set.xpl to produce all three schema modules with injected docs

CALABASH=/home/wendell/xmlcalabash-1.1.20-98/xmlcalabash-1.1.20-98.jar

# Set up call to Calabash
CATALOG_DOCS="java -jar $CALABASH -ischema-docs=oscal-oscal.xml -omarkdown-docs=__catalogXML.md lib/produce-schema-module-docs.xpl module=catalog"
PROFILE_DOCS="java -jar $CALABASH -ischema-docs=oscal-oscal.xml -omarkdown-docs=__profileXML.md lib/produce-schema-module-docs.xpl module=profile"
DECLARATIONS_DOCS="java -jar $CALABASH -ischema-docs=oscal-oscal.xml -omarkdown-docs=__declarationsXML.md lib/produce-schema-module-docs.xpl module=declarations"

# Now ...
echo
echo Processing schema documentation set
echo

# Go for it --
echo $CATALOG_DOCS
$CATALOG_DOCS
echo produced _catalogXML.md
echo $PROFILE_DOCS
$PROFILE_DOCS
echo produced _profileXML.md
echo $DECLARATIONS_DOCS
$DECLARATIONS_DOCS
echo produced _declarationsXML.md

