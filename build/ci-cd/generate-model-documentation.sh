#!/bin/bash

if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

source "$OSCALDIR/build/metaschema/scripts/include/init-calabash.sh"

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
doc_path_base="/docs/content/reference/"
BRANCH="$(git branch --show-current)"
DISABLE_ARCHETYPE_CREATION=false

declare -a doc_files=("$xml_outline_filename" "$xml_reference_filename" "$xml_index_filename" "$xml_definitions_filename" "$json_outline_filename" "$json_reference_filename" "$json_index_filename" "$json_definitions_filename")

usage() { # Function: Print a help message.
  cat <<EOF
Usage: $0 [options]

-b, --branch NAME                 The name of the release branch the generated
                                  reference documentation is for (default: develop)
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

OPTS=$(getopt -o b:w:vh --long disable-archetype-creation,branch:,release:,scratch-dir:,keep-temp-scratch-dir,help -n "$0" -- "$@")
if [[ "$OSTYPE" == "darwin"* ]]; then
  OPTS=$(getopt b:r:w:vh $*)
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
  -b | --branch)
    BRANCH="$2"
    shift # past branch
    ;;
  --disable-archetype-creation)
    DISABLE_ARCHETYPE_CREATION=true
    ;;
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

if [ "$#" -ne 0 ]; then
  echo -e "${P_ERROR}Invalid arguments: ${P_END}${#[@]}"
  exit 1;
fi

# generate reference documentation
if [[ "$BRANCH" =~ ^v.* ]]; then
  VERSION="${BRANCH/#"v"}"
  REVISION="${VERSION}"
  TYPE="tag"
elif [ "$BRANCH" = "main" ]; then
  VERSION="$(git describe --abbrev=0)"
  REVISION="latest"
  TYPE="branch"
elif [ "$BRANCH" = "develop" ]; then
  VERSION="develop"
  REVISION="develop"
  TYPE="branch"
else
  echo -e "${P_WARN}Unrecognized branch: ${P_END}${BRANCH}"
  VERSION="develop"
  REVISION="${BRANCH}"
  TYPE="branch"
fi

doc_path="${OSCALDIR}${doc_path_base}${REVISION}"

#echo "BRANCH='${BRANCH}'"
#echo "VERSION='${VERSION}'"
#echo "REVISION='${REVISION}'"
#echo "TYPE='${TYPE}'"
#echo "doc_path='${doc_path}'"

# build the version folder
if [ "$DISABLE_ARCHETYPE_CREATION" = "false" ] || [ ! -d "${doc_path}" ]; then
  [ -d "${doc_path}" ] && rm -rf "${doc_path}"

  result=$(HUGO_REF_TYPE="${TYPE}" HUGO_REF_BRANCH="${BRANCH}" HUGO_REF_VERSION="${VERSION}" HUGO_REF_REVISION="${REVISION}" hugo new --kind reference "${doc_path}" 2>&1)
  cmd_exitcode=$?
  if [ $cmd_exitcode -ne 0 ]; then
    echo -e "${P_ERROR}Generating index page failed for revision '${P_END}${REVISION}${P_ERROR}' on branch '${P_END}${BRANCH}${P_ERROR}'.${P_END}"
    echo -e "${P_ERROR}${result}${P_END}"
    exit 2;
  else
    echo -e "${P_OK}Generated index page for revision '${P_END}${REVISION}${P_OK}' on branch '${P_END}${BRANCH}${P_OK}' in '${P_END}${doc_path}${P_OK}'.${P_END}"
  fi
fi

exitcode=0
while IFS="|" read metaschema_path archetype model_id model_name schema_id || [[ -n "$metaschema_path" ]]; do
  [[ "$metaschema_path" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  metaschema_path="${metaschema_path##+([[:space:]])}"

  [ -z "$metaschema_path" ] && continue;

  archetype="${archetype##+([[:space:]])}"
  model_id="${model_id##+([[:space:]])}"
  model_name="${model_name##+([[:space:]])}"
  schema_id="${schema_id##+([[:space:]])}"

  metaschema="$OSCALDIR"/"$metaschema_path"
  metaschema_relative=$(realpath --relative-to="$WORKING_DIR" "$metaschema")

  filename=$(basename -- "$metaschema")
  extension="${filename##*.}"
  filename="${filename%.*}"
  base="${filename/_metaschema/}"

  model="${base/oscal_/}"

  model_path="${doc_path}/${model_id}"

  #echo "model='${model}'"
  #echo "archetype='${archetype}'"
  #echo "model_id='${model_id}'"
  #echo "model_name='${model_name}'"
  #echo "schema_id='${schema_id}'"
  #echo "model_path='${model_path}'"

  # generate reference documentation
  if [ "$DISABLE_ARCHETYPE_CREATION" = "false" ] || [ ! -d "${model_path}" ]; then
    # build the version folder
    #if [ -d "${model_path}" ] && rm -rf "${doc_path}"

    result=$(HUGO_REF_TYPE="${TYPE}" HUGO_REF_BRANCH="${BRANCH}" HUGO_REF_VERSION="${VERSION}" HUGO_REF_REVISION="${REVISION}" HUGO_MODEL_NAME="${model_name}" HUGO_MODEL_ID="${model_id}" HUGO_SCHEMA_ID="${schema_id}" hugo new --kind ${archetype} "${model_path}" 2>&1)
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
      echo -e "${P_ERROR}Generating '${P_END}${model_id}${P_OK}' model page failed for revision '${P_END}${REVISION}${P_ERROR}' on branch '${P_END}${BRANCH}${P_ERROR}'.${P_END}"
      echo -e "${P_ERROR}${result}${P_END}"
      continue;
    else
      echo -e "${P_OK}Generated '${P_END}${model_id}${P_OK}' model page for revision '${P_END}${REVISION}${P_OK}' on branch '${P_END}${BRANCH}${P_OK}' in '${P_END}${doc_path}${P_OK}'.${P_END}"
    fi
  fi
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

  result=$(run_calabash "$XPROC" "-i source=$metaschema ${docs[@]}" 2>&1)
  cmd_exitcode=$?
  if [ $cmd_exitcode -ne 0 ]; then
    echo -e "${P_ERROR}Generating docs failed for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
    echo -e "${P_ERROR}${result}${P_END}"
    exitcode=1
    continue
  fi

  for filename in "${doc_files[@]}"
  do
    doc_file_path="${model_path}/$filename"
    temp_file_path="$SCRATCH_DIR/$model/$filename"

    sed -i '1,/<!-- DO NOT REMOVE. Generated text below -->/!d' "$doc_file_path"
    echo "{{< rawhtml >}}" >> "$doc_file_path"
    cat "$temp_file_path" | sed 's|href="\([^"]*\).md#/|href="\1/#/|g' >> "$doc_file_path"
    echo "{{< /rawhtml >}}" >> "$doc_file_path"
  done

  echo -e "${P_OK}Generated docs for '${P_END}${metaschema_relative}${P_OK}' in '${P_END}${model_path}${P_OK}'.${P_END}"

done <"$OSCALDIR/build/ci-cd/config/metaschema-docs"

exit $exitcode
