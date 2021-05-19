#!/bin/bash

if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

source "$OSCALDIR/build/metaschema/scripts/include/init-saxon.sh"

integrate_hugo_docs() {
  local source="$1"; shift
  local hugo-page="$1"; shift

  # truncate the hugo page
  sed '/---/q' inputfile
}

# defaults
XPROC="${OSCALDIR}/build/metaschema/toolchains/xslt-M4/write-hugo-metaschema-docs.xpl"
xml_outline_filename="xml-outline.md"
xml_reference_filename="xml-reference.md"
xml_index_filename="xml-index.md"
xml_definitions_filename="xml-definitions.md"
json_outline_filename="json-outline.md"
json_reference_filename="json-reference.md"
json_index_filename="json-index.md"
json_definitions_filename="json-definitions.md"

declare -a doc_files=("$xml_outline_filename" "$xml_reference_filename" "$xml_index_filename" "$xml_definitions_filename" "$json_outline_filename" "$json_reference_filename" "$json_index_filename" "$json_definitions_filename")

usage() { # Function: Print a help message.
  cat <<EOF
Usage: $0 [options] [metaschema] [documentation directory]

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

OPTS=$(getopt -o vh --long scratch-dir:,keep-temp-scratch-dir,help -n "$0" -- "$@")
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
  metaschema_paths=("$1")
  doc_paths=("$2")
else
  while IFS="|" read metaschema_path doc_path || [[ -n "$metaschema_path" ]]; do
    [[ "$metaschema_path" =~ ^[[:space:]]*# ]] && continue
    # remove leading space
    metaschema_path="${metaschema_path##+([[:space:]])}"
    doc_path="${doc_path##+([[:space:]])}"

    ([ -z "$metaschema_path" ] || [ -z "$doc_path" ]) && continue

    metaschema_path_absolute="$OSCALDIR"/"$metaschema_path"
    doc_path_absolute="$OSCALDIR"/"$doc_path"

    metaschema_paths+=("$metaschema_path_absolute")
    doc_paths+=("$doc_path")
  done <"$OSCALDIR/build/ci-cd/config/metaschema-docs"
fi

exitcode=0
for i in "${!metaschema_paths[@]}"; do
  metaschema="${metaschema_paths[$i]}"
  doc_path="${doc_paths[$i]}"

  filename=$(basename -- "$metaschema")
  extension="${filename##*.}"
  filename="${filename%.*}"
  base="${filename/_metaschema/}"
  metaschema_relative=$(realpath --relative-to="$OSCALDIR" "$metaschema")
  metaschema_path=$(realpath --relative-to="$PWD" "$metaschema")

  model="${base/oscal_/}"

  docs=()

  docs+=("output-path=file://$SCRATCH_DIR/$model/")
  docs+=("xml-outline-filename=${xml_outline_filename}")
  docs+=("xml-reference-filename=${xml_reference_filename}")
  docs+=("xml-index-filename=${xml_index_filename}")
  docs+=("xml-definitions-filename=${xml_definitions_filename}")
  docs+=("json-outline-filename=${json_outline_filename}")
  docs+=("json-reference-filename=${json_reference_filename}")
  docs+=("json-index-filename=${json_index_filename}")
  docs+=("json-definitions-filename=${json_definitions_filename}")

  mkdir -p "$SCRATCH_DIR/$model"

  result=$(run_calabash "$XPROC" "-i source=$metaschema_path ${docs[@]}" 2>&1)
  cmd_exitcode=$?
  if [ $cmd_exitcode -ne 0 ]; then
    echo -e "${P_ERROR}Generating docs failed for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
    echo -e "${P_ERROR}${result}${P_END}"
    exitcode=1
    continue
  else
    echo -e "${P_OK}Generated docs for '${P_END}${metaschema_relative}${P_OK}' in '${P_END}${SCRATCH_DIR}/${model}${P_OK}'.${P_END}"
  fi

  for filename in "${doc_files[@]}"
  do
    doc_file_path="$OSCALDIR/${doc_path}/$filename"
    temp_file_path="$SCRATCH_DIR/$model/$filename"

    echo "Doc File: $doc_file_path"
    echo "Temp File: $temp_file_path"

    # sed -n '/^<!-- DO NOT REMOVE. Generated text below -->$/q;p' "$doc_file_path" > "$doc_file_path"
    # cat "$temp_file_path" >> "$doc_file_path"
  done
  

done

exit $exitcode
