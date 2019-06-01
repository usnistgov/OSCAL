#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/saxon-init.sh

if [[ -z "$1" ]]; then
  working_dir=$OSCALDIR
else
  working_dir=$1
fi

exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="" read -r path || [[ -n "$path" ]]; do
  shopt -s extglob
  # skip if line starts with comment
  [[ "$path" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  path="${path##+([[:space:]])}"
  # remove trailing space
  path="${path%%+([[:space:]])}"
  shopt -u extglob

  if [[ ! -z "$path" ]]; then
    files_to_process="$OSCALDIR"/"$path"

    IFS= # disable word splitting    
    for metaschema in $files_to_process
    do
      filename=$(basename -- "$metaschema")
      extension="${filename##*.}"
      filename="${filename%.*}"
      base="${filename/_metaschema/}"

      schema="$working_dir/xml/schema/$base_schema.xsd"
      echo "${P_INFO}Generating XML schema for '$metaschema' as '$schema'.${P_END}"
      xsl_transform "$OSCALDIR/build/metaschema/xml/produce-xsd.xsl" "$metaschema" "$schema"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}Generating XML schema failed for '$metaschema'.${P_END}"
        exitcode=1
      fi
      # TODO: Validate XML schema

      schema="$working_dir/json/schema/$base-schema.json"
      echo "${P_INFO}Generating JSON schema for '$metaschema' as '$schema'.${P_END}"
      xsl_transform "$OSCALDIR/build/metaschema/json/produce-json-schema.xsl" "$metaschema" "$schema"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}Generating JSON schema failed for '$metaschema'.${P_END}"
        exitcode=1
      fi
      ajv compile -s "$schema" --extend-refs=true --verbose
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}Invalid JSON schema: '$schema'.${P_END}"
        exitcode=1
      fi
    done
  fi
done < "$OSCALDIR/build/ci-cd/config/metaschema"
shopt -u nullglob
shopt -u globstar

exit $exitcode
