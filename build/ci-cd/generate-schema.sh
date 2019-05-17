#!/bin/bash

if [[ ! -v OSCALDIR ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/saxon-init.sh

exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="" read -r line || [ -n "$line" ]; do
  [[ "$line" =~ ^[[:space:]]*# ]] && continue

  if [ -n "$line" ]; then
    files_to_process="$OSCALDIR"/"$line"

    IFS= # disable word splitting    
    for metaschema in $files_to_process
    do
      filename=$(basename -- "$metaschema")
      extension="${filename##*.}"
      filename="${filename%.*}"
      base="${filename/-metaschema/}"

      schema="xml/schema/$base-schema.xsd"
      printf 'Generating XML schema for %s as %s\n' "$metaschema" "$schema"
      xsl_transform "$OSCALDIR/build/metaschema/xml/produce-xsd.xsl" "$metaschema" "$schema"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        printf 'Generating XML schema failed for %s\n' "$metaschema"
        exitcode=1
      fi

      schema="json/schema/$base-schema.json"
      printf 'Generating JSON schema for %s as %s\n' "$metaschema" "$schema"
      xsl_transform "$OSCALDIR/build/metaschema/json/produce-json-schema.xsl" "$metaschema" "$schema"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        printf 'Generating JSON schema failed for %s\n' "$metaschema"
        exitcode=1
      fi
      ajv compile -s "$schema" --extend-refs=true --verbose
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        printf 'Invalid JSON schema: %s\n' "$schema"
        exitcode=1
      fi
    done
  fi
done < $OSCALDIR/build/ci-cd/config/metaschema
shopt -u nullglob
shopt -u globstar

exit $exitcode
