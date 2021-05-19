#!/bin/bash

if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

source "$OSCALDIR/build/metaschema/scripts/include/init-saxon.sh"

# defaults
XPROC="${OSCALDIR}/build/metaschema/toolchains/xslt-M4/make-hugo-metaschema-docs.xpl"

# Option defaults
WORKING_DIR="${OSCALDIR}"

usage() { # Function: Print a help message.
  cat <<EOF
Usage: $0 [options] [metaschema paths]

-h, --help                        Display help
-w DIR, --working-dir DIR         Generate artifacts in DIR
-v                                Provide verbose output
--scratch-dir DIR                 Generate temporary artifacts in DIR
                                  If not provided a new directory will be
                                  created under \$TMPDIR if set or in /tmp.
--keep-temp-scratch-dir           If a scratch directory is automatically
                                  created, it will not be automatically removed.
EOF
}

OPTS=$(getopt -o w:vh --long scratch-dir:,keep-temp-scratch-dir,working-dir:,help -n "$0" -- "$@")
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
  --scratch-dir)
    SCRATCH_DIR="$(realpath "$2")"
    shift # past path
    ;;
  --keep-temp-scratch-dir)
    KEEP_TEMP_SCRATCH_DIR=true
    ;;
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
  echo -e "${P_INFO}Using scratch directory:${P_END} ${SCRATCH_DIR}"
fi

if [ -z "${SCRATCH_DIR+x}" ]; then
  SCRATCH_DIR="$(mktemp -d)"
  if [ "$KEEP_TEMP_SCRATCH_DIR" != "true" ]; then
    function CleanupScratchDir() {
      rc=$?
      if [ "$VERBOSE" = "true" ]; then
        echo -e ""
        echo -e "${P_INFO}Cleanup${P_END}"
        echo -e "${P_INFO}=======${P_END}"
        echo -e "${P_INFO}Deleting scratch directory:${P_END} ${SCRATCH_DIR}"
      fi
      rm -rf "${SCRATCH_DIR}"
      exit $rc
    }
    trap CleanupScratchDir EXIT
  fi
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

  docs=()

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
      docs+=("-o XML-element-outline-div=$SCRATCH_DIR/$model/xml-outline.html")
      docs+=("-o XML-element-reference-div=$SCRATCH_DIR/$model/xml-reference.html")
      docs+=("-o XML-element-index-div=$SCRATCH_DIR/$model/xml-index.html")
      # docs+=("XML-element-definitions-div=$SCRATCH_DIR/$model/xml-definitions.html")
      ;;
    json)
      docs+=("-o JSON-object-outline-div=$SCRATCH_DIR/$model/json-outline.html")
      docs+=("-o JSON-object-reference-div=$SCRATCH_DIR/$model/json-reference.html")
      docs+=("-o JSON-object-index-div=$SCRATCH_DIR/$model/json-index.html")
      # docs+=("JSON-object-definitions-div=$SCRATCH_DIR/$model/json-definitions.html")
      ;;
    *)
      echo -e "${P_WARN}Generating documentation for '${format}' is unsupported for '${P_END}${metaschema_relative}${P_WARN}'.${P_END}"
      continue
      ;;
    esac

    continue

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

  result=$(run_calabash "$XPROC" "-i source=$metaschema_path ${docs[@]}" 2>&1)
  cmd_exitcode=$?
  if [ $cmd_exitcode -ne 0 ]; then
    echo -e "${P_ERROR}Generating docs failed for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
    echo -e "${P_ERROR}${result}${P_END}"
    exitcode=1
    continue
  fi
done

exit $exitcode
