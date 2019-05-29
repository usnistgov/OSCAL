#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/schematron-init.sh

if [[ -z "$1" ]]; then
  working_dir=$OSCALDIR
else
  working_dir=$1
fi

# compile the schematron
metaschema_lib="$OSCALDIR/build/metaschema/lib"
schematron="$metaschema_lib/metaschema-check.sch"
compiled_schematron="${schematron}-compiled.xsl"

build_schematron "$schematron" "$compiled_schematron"
cmd_exitcode=$?
if [ $cmd_exitcode -ne 0 ]; then
  printf "Compilation of Schematron '%s' failed" "$schematron"
  exit 1
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
    for file in $files_to_process
    do
      printf 'Validating: '%s'\n' "$file"
      xmllint --noout --schema "$metaschema_lib/metaschema.xsd" "$file"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        printf 'XML schema validation failed for %s\n' "$file"
        exitcode=1
      else
        svrl_result="$working_dir/svrl/${file/$OSCALDIR\/src\//}.svrl"
        svrl_result_dir=${svrl_result%/*}
        mkdir -p "$svrl_result_dir"
        validate_with_schematron "$compiled_schematron" "$file" "$svrl_result"
        cmd_exitcode=$?
        if [ $cmd_exitcode -ne 0 ]; then
            exitcode=1
        fi
      fi
    done
  fi
done < $OSCALDIR/build/ci-cd/config/metaschema
shopt -u nullglob
shopt -u globstar

# cleanup compiled schematron
rm -f "$compiled_schematron"

exit $exitcode
