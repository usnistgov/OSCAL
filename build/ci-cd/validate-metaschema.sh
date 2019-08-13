#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/schematron-init.sh

if [ -z "$1" ]; then
  working_dir="$OSCALDIR"
else
  working_dir="$1"
fi
echo "${P_INFO}Working in '${P_END}${working_dir}${P_INFO}'.${P_END}"

# compile the schematron
metaschema_lib="$OSCALDIR/build/metaschema/lib"
schematron="$metaschema_lib/metaschema-check.sch"
compiled_schematron="${schematron}-compiled.xsl"

build_schematron "$schematron" "$compiled_schematron"
cmd_exitcode=$?
if [ $cmd_exitcode -ne 0 ]; then
  echo "${P_ERROR}Compilation of Schematron '$schematron' failed.${P_END}"
  exit 1
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

  [ -z "$path" ] && continue;
  
  files_to_process="$OSCALDIR"/"$path"

  IFS= # disable word splitting    
  for metaschema in $files_to_process
  do
    echo "${P_INFO}Validating metaschema '$metaschema'${P_END}"
    result=$(xmllint --nowarning --noout --schema "$metaschema_lib/metaschema.xsd" "$metaschema" 2>&1)
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
      echo "${P_ERROR}${result}${P_END}"
      echo "${P_ERROR}Metaschema '$metaschema' is not valid.${P_END}"
      exitcode=1
    else
      svrl_result="$working_dir/svrl/${file/$OSCALDIR\/src\//}.svrl"
      svrl_result_dir=${svrl_result%/*}
      mkdir -p "$svrl_result_dir"
      result=$(validate_with_schematron "$compiled_schematron" "$metaschema" "$svrl_result")
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
          echo "${P_ERROR}${result}${P_END}"
          exitcode=1
      fi
    fi
  done
done < $OSCALDIR/build/ci-cd/config/metaschema
shopt -u nullglob
shopt -u globstar

# cleanup compiled schematron
rm -f "$compiled_schematron"

exit $exitcode
