#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/include/common-environment.sh"
fi
source "$OSCALDIR/build/ci-cd/include/saxon-init.sh"

# Option defaults
WORKING_DIR="${OSCALDIR}"
VERBOSE=false
HELP=false

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options]

-h, --help                        Display help
-w DIR, --working-dir DIR         Generate artifacts in DIR
-v                                Provide verbose output
--keep-temp-scratch-dir           If a scratch directory is automatically
                                  created, it will not be automatically removed.
EOF
}

OPTS=`getopt -o w:vh --long working-dir:,help -n "$0" -- "$@"`
if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; usage ; exit 1 ; fi

# Process arguments
eval set -- "$OPTS"
while [ $# -gt 0 ]; do
  arg="$1"
  case "$arg" in
    -w|--working-dir)
      WORKING_DIR="$(realpath "$2")"
      shift # past path
      ;;
    -v)
      VERBOSE=true
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --) # end of options
      shift
      break;
      ;;
    *)    # unknown option
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

# the stylesheet used to generate the documentation
stylesheet="$OSCALDIR/build/metaschema/xml/produce-and-run-either-documentor.xsl"

# the URL of the github repo where generated artifacts will be accessible
github_url="https://raw.githubusercontent.com/usnistgov/OSCAL/master"

# the directory to generate the documentation in
schema_doc_dir="${WORKING_DIR}/docs/content/documentation/schemas"
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
    metaschema_relative=$(realpath --relative-to="$WORKING_DIR" "$metaschema")
    converter="$WORKING_DIR/json/convert/${base}_xml-to-json-converter.xsl"

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
        echo -e "${P_WARN}Generating documentation for '${format^^}' is unsupported for '${P_END}${metaschema_relative}${P_WARN}'.${P_END}"
        continue;
        ;;
      esac

      if [ "$VERBOSE" = "true" ]; then
        echo -e "${P_INFO}Generating ${format^^} model documentation for metaschema '${P_END}${metaschema_relative}${P_INFO}'.${P_END}"
      fi
      result=$(xsl_transform "$stylesheet_path" "$metaschema_path" "" \
        "target-format=${format}" \
        "example-converter-xslt-path=${converter_path}" \
        "output-path=${output_path}" \
        "schema-path=${schema_url}" 2>&1)
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo -e "${P_ERROR}Generating ${format^^} model documentation failed for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
        echo -e "${P_ERROR}${result}${P_END}"
        exitcode=1
        continue
      else
        echo -e "${P_OK}Generated ${format^^} model documentation for '${P_END}${metaschema_relative}${P_OK}'.${P_END}"
      fi
    done
  done
done < $OSCALDIR/build/ci-cd/config/metaschema

shopt -u nullglob
shopt -u globstar

exit $exitcode
