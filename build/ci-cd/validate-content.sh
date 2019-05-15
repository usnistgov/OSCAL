#!/bin/bash

if [[ ! -v OSCALDIR ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="|" read path format type converttoformats || [ -n "$path" ]
do
  printf 'path: %s\n' "$path"
  if [ -n "$path" ]; then
    files_to_process="$OSCALDIR/$path"
    IFS= # disable word splitting    
    for file in $files_to_process
    do
      printf 'Validating %s file %s as %s\n' "$format" "$file" "$type"
      printf 'format: %s\n' "$format"
      printf 'type: %s\n' "$type"
      printf 'convert-to: %s\n' "$converttoformats"

      case $format in
      xml)
          schema="xml/schema/oscal-$type-schema.xsd"
          xmllint --noout --schema "$schema" "$file"
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
            printf 'XML schema validation failed for %s\n' "$file"
            exitcode=1
          fi
        ;;
      json)
          schema="json/schema/oscal-$type-schema.json"
          ajv validate -s "$schema" -d "$file"
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
            printf 'JSON schema validation failed for %s\n' "$file"
            exitcode=1
          fi
        ;;
      esac
    done
  fi
done < "$OSCALDIR/build/ci-cd/config/content"
shopt -u nullglob
shopt -u globstar

exit $exitcode
