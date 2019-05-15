#!/bin/bash

if [[ ! -v OSCALDIR ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/saxon-init.sh

exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="" read -r p || [ -n "$p" ]
do
  if [ -n "$p" ]; then
    files_to_process="$OSCALDIR"/"$p"

    IFS= # disable word splitting    
    for file in $files_to_process
    do
      filename=$(basename -- "$file")
      extension="${filename##*.}"
      filename="${filename%.*}"
      base="${filename/-metaschema/}"

      printf 'Generating XML schema for %s as %s\n' "$file" "xml/schema/$base-schema.xsd"
      xsl_transform "$OSCALDIR/build/metaschema/xml/produce-xsd.xsl" $file xml/schema/$base-schema.xsd
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        printf 'Generating XML schema failed for %s\n' "$file"
        exitcode=1
      fi

      printf 'Generating JSON schema for %s as %s\n' "$file" "json/schema/$base-schema.json"
      xsl_transform "$OSCALDIR/build/metaschema/json/produce-json-schema.xsl" $file json/schema/$base-schema.json
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        printf 'Generating JSON schema failed for %s\n' "$file"
        exitcode=1
      fi
    done
  fi
done < $OSCALDIR/build/ci-cd/config/metaschema
shopt -u nullglob
shopt -u globstar

exit $exitcode
