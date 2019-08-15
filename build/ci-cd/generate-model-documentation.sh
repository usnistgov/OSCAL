#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/saxon-init.sh

if [ -z "$1" ]; then
  working_dir="$OSCALDIR"
else
  working_dir=$(readlink -f "$1")
fi
echo "${P_INFO}Working in '${P_END}${working_dir}${P_INFO}'.${P_END}"

# the stylesheet used to generate the documentation
stylesheet="$OSCALDIR/build/metaschema/xml/produce-and-run-either-documentor.xsl"

# the URL of the github repo where generated artifacts will be accessible
github_url="https://github.com/usnistgov/OSCAL/tree/master"

# the directory to generate the documentation in
schema_doc_dir="${working_dir}/docs/content/documentation/schemas"
mkdir -p "$schema_doc_dir" # ensure this directory exists

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

  ([ -z "$path" ] || [ -z "$gen_docs" ]) && continue;

  files_to_process="$OSCALDIR"/"$path"

  IFS= # disable word splitting
  for metaschema in $files_to_process
  do
    filename=$(basename -- "$metaschema")
    extension="${filename##*.}"
    filename="${filename%.*}"
    base="${filename/_metaschema/}"
    converter="$working_dir/json/convert/${base}_xml-to-json-converter.xsl"

    # Make xslt paths relative to current directory
    metaschema_path=$(realpath --relative-to="$PWD" "$metaschema")
    stylesheet_path=$(realpath --relative-to="$PWD" "$stylesheet")
    output_path=$(realpath --relative-to="$PWD" "$schema_doc_dir")
    # Make converter path relative to the stylesheet
    stylesheet_dir=$(dirname "$stylesheet")
    converter_path=$(realpath --relative-to="$stylesheet_dir" "$converter")

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
        # determine web location of schema
        schema_url="${github_url}/xml/schema/${base}_schema.xsd"
        ;;
      json)
        # determine web location of schema
        schema_url="${github_url}/json/schema/${base}_schema.json"
        ;;
      *)
        echo "${P_WARN}Generating documentation for '${format^^}' is unsupported for '$metaschema'.${P_END}"
        continue;
        ;;
      esac

      echo "${P_INFO}Generating ${format^^} model documentation for metaschema '${P_END}${metaschema_path}${P_INFO}'.${P_END}"
      xsl_transform "$stylesheet_path" "$metaschema_path" "" \
        "target-format=${format}" \
        "example-converter-xslt-path=${converter_path}" \
        "output-path=${output_path}" \
        "schema-path=${schema_url}"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}Generating ${format^^} model documentation failed for '${P_END}${metaschema_path}${P_ERROR}'.${P_END}"
        exitcode=1
      fi
    done
  done
done < $OSCALDIR/build/ci-cd/config/metaschema
shopt -u nullglob
shopt -u globstar

exit $exitcode
