#!/bin/bash

if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

source "$OSCALDIR/build/metaschema/scripts/include/init-saxon.sh"

# Option defaults

usage() { # Function: Print a help message.
  cat <<EOF
Usage: $0 [options] [metaschema paths]

-h, --help                        Display help
-w DIR, --working-dir DIR         Generate artifacts in DIR
-v                                Provide verbose output
--keep-temp-scratch-dir           If a scratch directory is automatically
                                  created, it will not be automatically removed.
EOF
}

OPTS=$(getopt -o w:vh --long working-dir:,help -n "$0" -- "$@")
if [[ "$OSTYPE" == "darwin"* ]]; then
  OPTS=$(getopt w:vh $*)
fi
if [ $? != 0 ]; then
  echo "Failed parsing options." >&2
  usage
  exit 1
fi

# Process arguments
eval set -- "$OPTS"
while [ $# -gt 0 ]; do
  arg="$1"
  case "$arg" in
  -w | --working-dir)
    WORKING_DIR="$(realpath "$2")"
    shift # past path
    ;;
  -v)
    VERBOSE=true
    ;;
  -h | --help)
    usage
    exit 0
    ;;
  --) # end of options
    shift
    break
    ;;
  *) # unknown option
    echo "Unhandled option: $1"
    exit 1
    ;;
  esac
  shift # past argument
done

OTHER_ARGS=$@ # save the remaining args

echo -e ""
echo -e "${P_INFO}Generating XML and JSON Model Documentation${P_END}"
echo -e "${P_INFO}===========================================${P_END}"

if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Using working directory:${P_END} ${WORKING_DIR}"
fi

declare -a paths
declare -a formats
if [ "$#" -ne 0 ]; then
  paths=("$@")
  for i in "${!paths[@]}"; do
    formats[$i]="xml,json"
  done
else
  while IFS="|" read path gen_schema gen_converter gen_docs || [[ -n "$path" ]]; do
    [[ "$path" =~ ^[[:space:]]*# ]] && continue
    # remove leading space
    path="${path##+([[:space:]])}"

    ([ -z "$path" ] || [ -z "$gen_docs" ]) && continue

    path_absolute="$OSCALDIR"/"$path"

    IFS_OLD=$IFS
    IFS= # disable word splitting
    for metaschema in $path_absolute; do
      paths+=("$metaschema")
      formats+=("$gen_converter")
    done
    IFS=$IFS_OLD
  done <"$OSCALDIR/build/ci-cd/config/metaschema"
fi

# the URL of the github repo where generated artifacts will be accessible
github_url="/artifacts"

# the directory to generate the documentation in
schema_doc_dir="${WORKING_DIR}/docs/layouts/partials/generated"
mkdir -p "$schema_doc_dir" # ensure this directory exists

exitcode=0
for i in "${!paths[@]}"; do
  metaschema="${paths[$i]}"
  gen_docs="${formats[$i]}"

  filename=$(basename -- "$metaschema")
  extension="${filename##*.}"
  filename="${filename%.*}"
  base="${filename/_metaschema/}"
  metaschema_relative=$(realpath --relative-to="$WORKING_DIR" "$metaschema")
  metaschema_path=$(realpath --relative-to="$PWD" "$metaschema")

  model="${base/oscal_/}"

  #split on commas
  IFS_OLD=$IFS
  IFS=, #read -a formats <<< "$gen_schema"

  for format in ${gen_docs}; do
    if [ -z "$format" ]; then
      # skip blanks
      continue
    fi

    # Run the model docs XSL template for the format
    if [ "$VERBOSE" = "true" ]; then
      echo -e "  ${P_INFO}Generating ${format} model documentation for metaschema '${P_END}${metaschema_relative}${P_INFO}'.${P_END}"
    fi

    case $format in
    xml)
      # the stylesheet used to generate the documentation
      stylesheet="$OSCALDIR/build/metaschema/toolchains/xslt-M4/nist-metaschema-MAKE-XML-DOCS.xsl"
      stylesheet_path=$(realpath --relative-to="$PWD" "$stylesheet")
      stylesheet_dir=$(dirname "$stylesheet")

      # Make converter path relative to the stylesheet
      # determine web location of schema
      schema_url="${github_url}/xml/schema/${base}_schema.xsd"

      # determine documentation location
      output="${schema_doc_dir}/oscal-${model}-xml-schema.html"
      output_path=$(realpath --relative-to="$PWD" "$output")

      result=$(xsl_transform "$stylesheet_path" "$metaschema_path" "${output_path}" \
        "schema-path=${schema_url}" 2>&1)
      ;;
    json)
      # the stylesheet used to generate the documentation
      stylesheet="$OSCALDIR/build/metaschema/toolchains/xslt-M4/nist-metaschema-MAKE-JSON-DOCS.xsl"
      stylesheet_path=$(realpath --relative-to="$PWD" "$stylesheet")
      stylesheet_dir=$(dirname "$stylesheet")

      # the converter used to generate the JSON examples
      converter="$WORKING_DIR/json/convert/${base}_xml-to-json-converter.xsl"
      converter_path=$(realpath --relative-to="$stylesheet_dir" "$converter")

      # determine documentation location
      output="${schema_doc_dir}/oscal-${model}-json-schema.html"
      output_path=$(realpath --relative-to="$PWD" "$output")

      # determine web location of schema
      schema_url="${github_url}/json/schema/${base}_schema.json"
      result=$(xsl_transform "$stylesheet_path" "$metaschema_path" "${output_path}" \
        "example-converter-xslt-path=${converter_path}" \
        "schema-path=${schema_url}" 2>&1)
      ;;
    *)
      echo -e "${P_WARN}Generating documentation for '${format}' is unsupported for '${P_END}${metaschema_relative}${P_WARN}'.${P_END}"
      continue
      ;;
    esac
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
      echo -e "${P_ERROR}Generating ${format} model documentation failed for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
      echo -e "${P_ERROR}${result}${P_END}"
      exitcode=1
      continue
    fi

    if [ "$VERBOSE" = "true" ]; then
      echo -e "${P_INFO}${result}${P_END}"
    fi
    echo -e "${P_OK}Generated ${format} model documentation for '${P_END}${metaschema_relative}${P_OK}'.${P_END}"

    # Run the model map XSL template for the format
    if [ "$VERBOSE" = "true" ]; then
      echo -e "  ${P_INFO}Generating ${format} model map for metaschema '${P_END}${metaschema_relative}${P_INFO}'.${P_END}"
    fi

    case $format in
    xml)
      # the stylesheet used to generate the documentation
      stylesheet="$OSCALDIR/build/metaschema/toolchains/xslt-M4/nist-metaschema-MAKE-XML-MAP.xsl"
      stylesheet_path=$(realpath --relative-to="$PWD" "$stylesheet")
      stylesheet_dir=$(dirname "$stylesheet")

      # determine documentation location
      output="${schema_doc_dir}/oscal-${model}-xml-map.html"
      output_path=$(realpath --relative-to="$PWD" "$output")

      # Make converter path relative to the stylesheet
      # determine web location of schema
      schema_url="${github_url}/xml/schema/${base}_schema.xsd"
      result=$(xsl_transform "$stylesheet_path" "$metaschema_path" "${output_path}" 2>&1)
      ;;
    json)
      # the stylesheet used to generate the documentation
      stylesheet="$OSCALDIR/build/metaschema/toolchains/xslt-M4/nist-metaschema-MAKE-JSON-MAP.xsl"
      stylesheet_path=$(realpath --relative-to="$PWD" "$stylesheet")
      stylesheet_dir=$(dirname "$stylesheet")

      # determine documentation location
      output="${schema_doc_dir}/oscal-${model}-json-map.html"
      output_path=$(realpath --relative-to="$PWD" "$output")

      # determine web location of schema
      schema_url="${github_url}/json/schema/${base}_schema.json"
      result=$(xsl_transform "$stylesheet_path" "$metaschema_path" "${output_path}" 2>&1)
      ;;
    *)
      echo -e "${P_WARN}Generating model map for '${format}' is unsupported for '${P_END}${metaschema_relative}${P_WARN}'.${P_END}"
      continue
      ;;
    esac
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
      echo -e "${P_ERROR}Generating ${format} model map failed for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
      echo -e "${P_ERROR}${result}${P_END}"
      exitcode=1
      continue
    fi

    if [ "$VERBOSE" = "true" ]; then
      echo -e "${P_INFO}${result}${P_END}"
    fi
    echo -e "${P_OK}Generated ${format} model map for '${P_END}${metaschema_relative}${P_OK}'.${P_END}"

    touch -c "$OSCALDIR/docs/content/documentation/schema/$model/${format}-model-map.md"
    touch -c "$OSCALDIR/docs/content/documentation/schema/$model/${format}-schema.md"
  done
  IFS=$IFS_OLD
done

exit $exitcode
