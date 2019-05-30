# Catalog round trip from XML -> JSON -> XML

#!/bin/bash
#source common-environment.sh

#setup print colors
red=$'\e[1;31m'
green=$'\e[1;32m'
yellow=$'\e[1;33m'
blue=$'\e[1;34m'
end=$'\e[0m'

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

###################################################################################################################
#   XML->JSON Roundtrip conversions tests
###################################################################################################################

# default to test passed at zero
exitcode=0

# config for convertors
profileJSONConvertor=${OSCALDIR}/json/convert/oscal-profile-xml-to-json-converter.xsl
profileXMLConvertor=${OSCALDIR}/xml/convert/oscal-profile-json-to-xml-converter.xsl
catalogJSONConvertor=${OSCALDIR}/json/convert/oscal-catalog-xml-to-json-converter.xsl
catalogXMLConvertor=${OSCALDIR}/xml/convert/oscal-catalog-json-to-xml-converter.xsl

exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="|" read path format type converttoformats || [ -n "$path" ]; do
  shopt -s extglob
  # skip if line starts with comment
  [[ "$path" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  path="${path##+([[:space:]])}"
  # remove trailing space
  converttoformats="${converttoformats%%+([[:space:]])}"
  shopt -u extglob

  if [[ ! -z "$path" ]]; then
    files_to_process="$OSCALDIR/$path"
    IFS= # disable word splitting    
    for file in $files_to_process
    do
      # get the base file name
      baseName=$(basename $file)

      # debuggging statements, shows what is processing
      printf 'file name: %s\n' "$baseName" 
      printf 'format: %s\n' "$format"
      printf 'type: %s\n' "$type"
      printf 'convert-to: %s\n' "$converttoformats"

      case $format in
      xml)
          # XML -> JSON -> XML round trip testing

          # transformation from source XML to target JSON
          if [ "$type" = "profile" ]; then
              java -jar python/saxon9he.jar -s:"$file" -xsl:"$profileJSONConvertor" -o:${OSCALDIR}/build/ci-cd/temp/${baseName}-composed.json
          else
              java -jar python/saxon9he.jar -s:"$file" -xsl:"$catalogJSONConvertor" -o:${OSCALDIR}/build/ci-cd/temp/${baseName}-composed.json
          fi
          # check the exit code for the conversion
          cmd_exitcode=$?
          if [ $cmd_exitcode != 0 ]; then
              printf "${red}ERROR: XML->JSON conversion failed for file: %s\n${end}" "$file" 
              exitcode=1
          else
              printf "${green}SUCCESS: XML converted to JSON. \n${end}" 
          fi

          # transformation of JSON back to XML
          if [ "$type" = "profile" ]; then
              java -jar python/saxon9he.jar  -o:${OSCALDIR}/build/ci-cd/temp/${baseName}-composed.xml -it:start -xsl:"$profileXMLConvertor" json-file="${OSCALDIR}/build/ci-cd/temp/${baseName}-composed.json"
          else
              java -jar python/saxon9he.jar  -o:${OSCALDIR}/build/ci-cd/temp/${baseName}-composed.xml -it:start -xsl:"$catalogXMLConvertor" json-file="${OSCALDIR}/build/ci-cd/temp/${baseName}-composed.json"
          fi
          # check the exit code for the conversion
          cmd_exitcode=$?
          if [ $cmd_exitcode != 0 ]; then
              printf "${red}JSON->XML conversion failed for file: %s\n${end}" "$file"
              exitcode=1
          else
              printf "${green}JSON converted back to XML. \n${end}"
          fi

          # compare the XML files to see if there is data loss
          printf "Checking XML->JSON->XML conversion"
          python python/xmlComparison.py "$file" "${OSCALDIR}/build/ci-cd/temp/${baseName}-composed.xml"
          cmd_exitcode=$?
          if [ $cmd_exitcode != 0 ]; then
              printf "${red}XML roundtrip comparison failed for file: %s.\n${end}" "$file"
              exitcode=1
          else
              printf "${green}XML round trip comparison was successful.\n${end}"
          fi

          #validate JSON schemas
          if [ "$type" = "profile" ]; then
              #validate the profile JSON
              ajv validate -s "${OSCALDIR}/json/schema/oscal-profile-schema.json" -d "${OSCALDIR}/build/ci-cd/temp/${baseName}-composed.json"  --extend-refs=true --verbose 
          else
              #validate the catalog JSON
              ajv validate -s "${OSCALDIR}/json/schema/oscal-catalog-schema.json" -d "${OSCALDIR}/build/ci-cd/temp/${baseName}-composed.json"  --extend-refs=true --verbose
          fi
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
              printf "${red}Comparison of the converted JSON file to the original failed for file: %s.\n${end}" "$file"
              exitcode=1
          else
              printf "${green}Comparison of the converted JSON file to the original was successful.\n${end}"
          fi
        ;;
      json)
          #reverse the process, JSON->XML->JSON

        ;;
      esac
    done
  fi
done < "$OSCALDIR/build/ci-cd/config/content" #inserts the config of files to parse
shopt -u nullglob
shopt -u globstar

exit $exitcode