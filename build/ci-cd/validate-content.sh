#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi
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
while IFS="|" read path format model converttoformats || [ -n "$path" ]; do
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
      echo "${P_INFO}Validating $model $format file '$file'.${P_END}"

      case $format in
      xml)
          schema="$working_dir/xml/schema/oscal_${model}_schema.xsd"
          result=$(xmllint --noout --schema "$schema" "$file")
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
            echo "${P_ERROR}${result}${P_END}"
            echo "${P_ERROR}XML schema validation failed for '$file'.${P_END}"
            exitcode=1
          fi
        ;;
      json)
          schema="$working_dir/json/schema/oscal_${model}_schema.json"
          result=$(validate_json "$schema" "$file")
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
            echo "${P_ERROR}${result}${P_END}"
            echo "${P_ERROR}JSON schema validation failed for '$file'.${P_END}"
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
