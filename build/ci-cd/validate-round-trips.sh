# Catalog round trip from XML -> JSON -> XML

#!/bin/bash
#source common-environment.sh

# set the OSCAL directory and pass in common environment
if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

# initialize Saxon and get the path
source $OSCALDIR/build/ci-cd/saxon-init.sh

# in CI/CD use the build directory for artifacts when passed in
if [ -z "$1" ]; then
  working_dir="$OSCALDIR"
else
  working_dir=$(readlink -f "$1")
fi
echo "${P_INFO}Working in '${P_END}${working_dir}${P_INFO}'.${P_END}"

###################################################################################################################
#   XML->JSON Roundtrip conversions tests
###################################################################################################################

# default to test passed at zero
exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="|" read path format model converttoformats || [[ -n "$path" ]]; do
  shopt -s extglob
  [[ "$path" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  path="${path##+([[:space:]])}"
  # remove trailing space
  converttoformats="${converttoformats%%+([[:space:]])}"
  shopt -u extglob

  if [[ ! -z "$path" ]]; then
    files_to_process="$OSCALDIR/$path"
    IFS= # disable word splitting    

    #loop through the files
    for file in $files_to_process
    do
      # get the base file name
      baseName=$(basename $file)

      # debuggging statements, shows what is processing
      #printf 'path: %s\n' "$file"
      #printf 'file name: %s\n' "$baseName" 
      #printf 'format: %s\n' "$format"
      #printf 'model: %s\n' "$model"
      #printf 'convert-to: %s\n' "$converttoformats"

      if [ "$format" == "xml" ]; then
        # XML -> JSON -> XML round trip testing
        # transformation from source XML to target JSON
        converter="$working_dir/json/convert/oscal_${model}_xml-to-json-converter.xsl"

        to_json="$working_dir/roundtrip/${baseName}-to.json"
        xsl_transform "$converter" "$file" "$to_json"

        # check the exit code for the conversion
        cmd_exitcode=$?
        if [ $cmd_exitcode != 0 ]; then
            echo "${P_ERROR}XML->JSON conversion failed for '${P_END}${file}${P_ERROR}'.${P_END}"
            exitcode=1
            continue;
        else
            echo "${P_OK}XML converted to JSON for '${P_END}${file}${P_OK}'.${P_END}"
        fi

        back_to_xml="$working_dir/roundtrip/${baseName}-back-to.xml"

        # transformation of JSON back to XML
        converter="$working_dir/xml/convert/oscal_${model}_json-to-xml-converter.xsl"
        converter_path=$(realpath --relative-to="$PWD" "$converter")
        output_path=$(realpath --relative-to="$PWD" "$back_to_xml")

        # Make the json file relative to the converter
        converter_dir=$(dirname "$converter_path")
        json_file_path=$(realpath --relative-to="$converter_dir" "$to_json")

        xsl_transform "$converter_path" "" "$output_path" "-it" "json-file=${json_file_path}"

        # check the exit code for the conversion
        cmd_exitcode=$?
        if [ $cmd_exitcode != 0 ]; then
            echo "${P_ERROR}JSON->XML conversion failed for '${P_END}${to_json}${P_ERROR}'.${P_END}"
            exitcode=1
            continue;
        else
            echo "${P_OK}JSON converted to XML for '${P_END}${to_json}${P_OK}'.${P_END}"
        fi

        # Validate the resulting XML
        schema="$working_dir/xml/schema/oscal_${model}_schema.xsd"
        xmllint --noout --schema "$schema" "$output_path"
        cmd_exitcode=$?
        if [ $cmd_exitcode -ne 0 ]; then
          echo "${P_ERROR}XML schema validation failed for '$output_path'.${P_END}"
          exitcode=1
          continue;
        fi

        # compare the XML files to see if there is data loss
        echo "${P_INFO}Checking XML->JSON->XML conversion for '${P_END}${file}${P_INFO}'.${P_END}"
        python ${OSCALDIR}/build/ci-cd/python/xmlComparison.py "$back_to_xml" "$file"
        cmd_exitcode=$?
        if [ $cmd_exitcode != 0 ]; then
            echo "${P_ERROR}XML round-trip comparison failed.${P_END}"
            exitcode=1
        else
            echo "${P_OK}XML round-trip comparison was successful.${P_END}"
        fi
      fi
    done
  fi
done < "$OSCALDIR/build/ci-cd/config/content" #inserts the config of files to parse
shopt -u nullglob
shopt -u globstar

exit $exitcode