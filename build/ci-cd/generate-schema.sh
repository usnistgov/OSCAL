#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi
source $OSCALDIR/build/ci-cd/saxon-init.sh
source $OSCALDIR/build/ci-cd/init-validate-json.sh

if [ -z "$1" ]; then
  working_dir="$OSCALDIR"
else
  working_dir="$1"
fi
echo "${P_INFO}Working in '${P_END}${working_dir}${P_INFO}'.${P_END}"

exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="|" read path gen_schema gen_converter gen_docs || [[ -n "$path" ]]; do
  shopt -s extglob
  [[ "$path" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  path="${path##+([[:space:]])}"
  # remove trailing space
  gen_docs="${gen_docs%%+([[:space:]])}"
  shopt -u extglob

  ([ -z "$path" ] || [ -z "$gen_schema" ]) && continue;
  
  files_to_process="$OSCALDIR"/"$path"

  IFS= # disable word splitting    
  for metaschema in $files_to_process
  do
    filename=$(basename -- "$metaschema")
    extension="${filename##*.}"
    filename="${filename%.*}"
    base="${filename/_metaschema/}"

    #split on commas
    IFS=, read -a formats <<< "$gen_schema"
    for format in "${formats[@]}"; do
      if [ -z "$format" ]; then
        # skip blanks
        continue;
      fi
    
      # Run the XSL template for the format
      case $format in
      xml)
        transform="$OSCALDIR/build/metaschema/$format/produce-xsd.xsl"
        schema="$working_dir/$format/schema/${base}_schema.xsd"
        ;;
      json)
        transform="$OSCALDIR/build/metaschema/$format/produce-json-schema.xsl"
        schema="$working_dir/$format/schema/${base}_schema.json"
        ;;
      *)
        echo "${P_WARN}Unsupported schema format '${format^^}' schema for '$metaschema'.${P_END}"
        continue;
        ;;
      esac

      echo "${P_INFO}Generating ${format^^} schema for '$metaschema' as '$schema'.${P_END}"
      xsl_transform "$transform" "$metaschema" "$schema"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}Generating ${format^^} schema failed for '$metaschema'.${P_END}"
        exitcode=1
      fi

      # validate generated schema
      case $format in
      # xml)
        # TODO: Add support for XML schema validation
      json)
        result=$(validate_json "$OSCALDIR/build/ci-cd/json-schema-schema.json" "$schema")
        cmd_exitcode=$?
        ;;
      *)
        echo "${P_WARN}Unsupported validation of ${format^^} schema for '$schema'.${P_END}"
        cmd_exitcode=0
        ;;
      esac
      
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}${result}${P_END}"
        echo "${P_ERROR}Invalid ${format^^} schema '$schema'.${P_END}"
        exitcode=1
      fi
    done
  done
done < "$OSCALDIR/build/ci-cd/config/metaschema"
shopt -u nullglob
shopt -u globstar

exit $exitcode
