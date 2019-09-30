#!/bin/bash
# set the OSCAL directory and pass in common environment
if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/include/common-environment.sh"
fi

# initialize Saxon and get the path
source "$OSCALDIR/build/ci-cd/include/saxon-init.sh"

# Catalog round trip from XML -> JSON -> XML
MSYS_NO_PATHCONV=1

# Option defaults
KEEP_TEMP_SCRATCH_DIR=false
WORKING_DIR="${OSCALDIR}"
VERBOSE=false
HELP=false

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options]

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

OPTS=`getopt -o w:vh --long scratch-dir:,keep-temp-scratch-dir,working-dir:,help -n "$0" -- "$@"`
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

OTHER_ARGS=$@ # save the arg

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

echo -e ""
echo -e "${P_INFO}Validating Content Conversions Using Round-Trips${P_END}"
echo -e "${P_INFO}================================================${P_END}"

if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Using scratch directory:${P_END} ${SCRATCH_DIR}"
  echo -e "${P_INFO}Using working directory:${P_END} ${WORKING_DIR}"
fi

###################################################################################################################
#   XML->JSON Roundtrip conversions tests
###################################################################################################################

# default to test passed at zero
exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="|" read path format model converttoformats || [[ -n "$path" ]]; do
  shopt -s extglob
  [[ "$path" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  path="${path##+([[:space:]])}"
  # remove trailing space
  converttoformats="${converttoformats%%+([[:space:]])}"
  shopt -u extglob

  if [[ ! -z "$path" ]]; then
    files_to_process="$OSCALDIR/$path"

    IFS= # disable word splitting
    #loop through the files
    for file in $files_to_process
    do
      # get the base file name
      file_basename=$(basename $file)
      file_relative=$(realpath --relative-to="$OSCALDIR" "$file")

      # debuggging statements, shows what is processing
      #printf 'path: %s\n' "$file"
      #printf 'file name: %s\n' "$file_basename"
      #printf 'format: %s\n' "$format"
      #printf 'model: %s\n' "$model"
      #printf 'convert-to: %s\n' "$converttoformats"

      if [ "$format" == "xml" ]; then
        # XML -> JSON -> XML round trip testing
        # transformation from source XML to target JSON
        converter="$WORKING_DIR/json/convert/oscal_${model}_xml-to-json-converter.xsl"

        to_json_file="${SCRATCH_DIR}/roundtrip/${file_basename}-to.json"
        result=$(xsl_transform "$converter" "$file" "$to_json_file" 2>&1)

        # check the exit code for the conversion
        cmd_exitcode=$?
        if [ $cmd_exitcode != 0 ]; then
            echo -e "${P_ERROR}XML->JSON conversion failed for '${P_END}${file_relative}${P_ERROR}'.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            exitcode=1
            continue;
        else
          if [ "$VERBOSE" = "true" ]; then
            echo -e "${P_OK}Converted XML '${P_END}${file_relative}${P_OK}' to JSON '${P_END}${to_json_file}${P_OK}'.${P_END}"
          fi
        fi

        back_to_xml_file="${SCRATCH_DIR}/roundtrip/${file_basename}-to-json-and-back-to.xml"

        # transformation of JSON back to XML
        converter="$WORKING_DIR/xml/convert/oscal_${model}_json-to-xml-converter.xsl"
        converter_path="$(realpath "$converter")"
        back_to_xml_file_relative="$(realpath --relative-to="$PWD" "$back_to_xml_file")"

        # Make the json file relative to the converter
        converter_dir="$(dirname "$converter")"
        json_file_path="$(realpath "$to_json_file")"

        result=$(xsl_transform "$converter_path" "" "$back_to_xml_file" "-it" "json-file=${json_file_path}" 2>&1)

        # check the exit code for the conversion
        cmd_exitcode=$?
        if [ $cmd_exitcode != 0 ]; then
            echo -e "${P_ERROR}JSON->XML conversion failed for '${P_END}${to_json_file}${P_ERROR}'.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            exitcode=1
            continue;
        else
          if [ "$VERBOSE" = "true" ]; then
            echo -e "${P_OK}Converted JSON '${P_END}${to_json_file}${P_OK}' to XML for '${P_END}${back_to_xml_file}${P_OK}'.${P_END}"
          fi
        fi

        # Validate the resulting XML
        schema="$WORKING_DIR/xml/schema/oscal_${model}_schema.xsd"
        schema_relative="$(realpath --relative-to="${WORKING_DIR}" "$schema")"
        result="$(xmllint --noout --schema "$schema" "$back_to_xml_file" 2>&1)"
        cmd_exitcode=$?
        if [ $cmd_exitcode -ne 0 ]; then
          echo -e "${P_ERROR}XML Schema validation failed for '${P_END}${back_to_xml_file}${P_ERROR}' using schema '${P_END}${schema_relative}${P_ERROR}'.${P_END}"
          echo -e "${P_ERROR}${result}${P_END}"
          exitcode=1
          continue;
        else
          if [ "$VERBOSE" = "true" ]; then
            echo -e "${P_OK}XML Schema validation passed for '${P_END}${back_to_xml_file}${P_OK}' using schema '${P_END}${schema_relative}${P_OK}'.${P_END}"
          fi
        fi

        # compare the XML files to see if there is data loss
        if [ "$VERBOSE" = "true" ]; then
          echo -e "${P_INFO}Checking XML->JSON->XML conversion for '${P_END}${file_relative}${P_INFO}'.${P_END}"
        fi

        result=$(python ${OSCALDIR}/build/ci-cd/python/xmlComparison.py "$back_to_xml_file" "$file" 2>&1)
        cmd_exitcode=$?
        if [ $cmd_exitcode != 0 ]; then
            echo -e "${P_ERROR}XML round-trip comparison failed for '${P_END}${file_relative}${P_ERROR}' against '${P_END}${back_to_xml_file}${P_ERROR}'.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            if [ "$VERBOSE" != "true" ]; then
              echo -e "  ${P_ERROR}Used interim JSON file '${P_END}${to_json_file}${P_ERROR}'.${P_END}"
            fi
            exitcode=1
        else
          echo -e "${P_OK}XML round-trip comparison succeeded for '${P_END}${file_relative}${P_OK}' against '${P_END}${back_to_xml_file}${P_OK}'.${P_END}"
        fi
      fi
    done
  fi
done < "$OSCALDIR/build/ci-cd/config/content" #inserts the config of files to parse
shopt -u nullglob
shopt -u globstar

exit $exitcode
