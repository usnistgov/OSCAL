#!/bin/bash

if [[ ! -v OSCALDIR ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/saxon-init.sh

if [ -z "$1" ]; then
  working_dir=$OSCALDIR
else
  working_dir=$1
fi

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

  ([ -z "$path" ] || [ -z "$gen_converter" ]) && continue;

  files_to_process="$OSCALDIR"/"$path"

  IFS= # disable word splitting    
  for metaschema in $files_to_process
  do
    filename=$(basename -- "$metaschema")
    extension="${filename##*.}"
    filename="${filename%.*}"
    model="${filename/_metaschema/}"

    #split on commas
    IFS=, read -a formats <<< "$gen_docs"
    for format in "${formats[@]}"; do
      if [ -z "$format" ]; then
        # skip blanks
        continue;
      fi
    
      # Run the XSL template for the format
      case $format in
      xml)
        source_format="json"
        ;;
      json)
        source_format="xml"
        ;;
      *)
        echo "${P_WARN}Generating converter to the '${format^^}' format is unsupported for '$metaschema'.${P_END}"
        continue;
        ;;
      esac

      converter="$working_dir/${format}/convert/${model}_${source_format}-to-${format}-converter.xsl"

      echo "${P_INFO}Generating ${source_format^^} to ${format^^} converter for '$metaschema' as '$converter'.${P_END}"
      xsl_transform "$OSCALDIR/build/metaschema/$format/produce-$format-converter.xsl" "$metaschema" "$converter"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}Generating ${source_format^^} to ${format^^} converter failed for '$metaschema'.${P_END}"
        exitcode=1
      fi
    done
  done
done < $OSCALDIR/build/ci-cd/config/metaschema
shopt -u nullglob
shopt -u globstar

exit $exitcode
