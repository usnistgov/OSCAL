# delete the temp files after processing
if test -f ../util/convert/composedJSON.json; then
    rm ../util/convert/composedJSON.json
    echo "JSON temp file deleted"
fi
if test -f composedXML.xml; then
    rm composedXML.xml
    echo "Local XML temp file deleted"
fi
if test -f composedJSON.json; then
    rm composedJSON.json
    echo "Local JSON temp file deleted"
fi