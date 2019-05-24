#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
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
while IFS="" read -r path || [ -n "$path" ]; do
  shopt -s extglob
  # skip if line starts with comment
  [[ "$path" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  path="${path##+([[:space:]])}"
  # remove trailing space
  path="${path%%+([[:space:]])}"
  shopt -u extglob

  if [[ ! -z "$path" ]]; then  if [ -n "$line" ]; then
    files_to_process="$OSCALDIR"/"$line"

    IFS= # disable word splitting    
    for metaschema in $files_to_process
    do
      filename=$(basename -- "$metaschema")
      extension="${filename##*.}"
      filename="${filename%.*}"
      base="${filename/-metaschema/}"

      printf 'Generating XML documentation for metaschema %s\n' "$metaschema"
      xsl_transform "$OSCALDIR/build/metaschema/xml/produce-and-run-either-documentor.xsl" "$metaschema" "" "target-format=xml" "output-path=$working_dir/docs/content/documentation/schemas"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        printf 'Generating XML schema failed for %s\n' "$metaschema"
        exitcode=1
      fi

      printf 'Generating JSON documentation for metaschema %s\n' "$metaschema"
      xsl_transform "$OSCALDIR/build/metaschema/xml/produce-and-run-either-documentor.xsl" "$metaschema" "" "target-format=json" "output-path=$working_dir/docs/content/documentation/schemas"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        printf 'Generating XML schema failed for %s\n' "$metaschema"
        exitcode=1
      fi
    done
  fi
done < $OSCALDIR/build/ci-cd/config/metaschema-docs
shopt -u nullglob
shopt -u globstar

exit $exitcode
