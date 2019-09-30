#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/include/common-environment.sh"
fi
source "$OSCALDIR/build/ci-cd/include/saxon-init.sh"
source "$OSCALDIR/build/ci-cd/include/init-validate-json.sh"

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
echo -e "${P_INFO}Copying and Converting Content${P_END}"
echo -e "${P_INFO}==============================${P_END}"

if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Using working directory:${P_END} ${WORKING_DIR}"
fi

# check for perl
result=$(which perl 2>&1)
if [ $? -ne 0 ]; then
  echo -e "${P_ERROR}Perl is not installed. Perl is needed by this script.${P_END}"
  exit 1
fi

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
    files_to_process="$OSCALDIR"/"$path"
    IFS= # disable word splitting
    for file in $files_to_process
    do
      file_relative=$(realpath --relative-to="${OSCALDIR}" "$file")
      dest="$WORKING_DIR/${file/$OSCALDIR\/src\//}"
      dest_dir=${dest%/*} # remove filename
      dest_relative=$(realpath --relative-to="${WORKING_DIR}" "$dest")

      mkdir -p "$dest_dir"
      result=$(cp "$file" "$dest" 2>&1)
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo -e "${P_ERROR}Unable to copy '${P_END}${file_relative}${P_ERROR}' to '${P_END}${dest_relative}${P_ERROR}'.${P_END}"
        echo -e "${P_ERROR}${result}${P_END}"
      else
        echo -e "${P_OK}Copied '${P_END}${file_relative}${P_OK}' to '${P_END}${dest_relative}${P_OK}'.${P_END}"
      fi

      IFS=","
      for altformat in "$converttoformats"; do
        newpath="${file/$OSCALDIR\/src\//}" # strip off src
        newpath="${newpath/\/$format\///$altformat/}" # change path from old to new format dir
        newpath="${newpath%.*}" # strip extension

        converter="$WORKING_DIR/$altformat/convert/oscal_${model}_${format}-to-${altformat}-converter.xsl"
        converter_relative=$(realpath --relative-to="${WORKING_DIR}" "$converter")


        case $format in
        xml)
          dest="$WORKING_DIR/${newpath}-min.${altformat}"
          dest_relative=$(realpath --relative-to="${WORKING_DIR}" "$dest")
          if [ "$VERBOSE" = "true" ]; then
            echo -e "${P_INFO}Generating ${altformat^^} file '${P_END}${dest_relative}${P_INFO}' from '${P_END}${file_relative}${P_INFO}' using converter '${P_END}${converter_relative}${P_INFO}'.${P_END}"
          fi
          result=$(xsl_transform "$converter" "$file" "$dest" 2>&1)
          ;;
        json)
          dest="$WORKING_DIR/${newpath}.${altformat}"
          dest_relative=$(realpath --relative-to="${WORKING_DIR}" "$dest")
          if [ "$VERBOSE" = "true" ]; then
            echo -e "${P_INFO}Generating ${altformat^^} file '${P_END}${dest_relative}${P_INFO}' from '${P_END}${file_relative}${P_INFO}' using converter '${P_END}${converter_relative}${P_INFO}'.${P_END}"
          fi
          result=$(xsl_transform "$converter" "" "$dest" "-it" "json-file=${file}" 2>&1)
          ;;
        *)
          echo -e "${P_WARN}Conversion from '${format} to '${altformat^^}' is unsupported for '${P_END}${file_relative}${P_OK}'.${P_END}"
          continue;
        esac
        cmd_exitcode=$?
        if [ $cmd_exitcode -ne 0 ]; then
          echo -e "${P_ERROR}Content conversion to ${altformat^^} failed for '${P_END}${file_relative}${P_ERROR}' using converter '${P_END}${converter_relative}${P_ERROR}'.${P_END}"
          echo -e "${P_ERROR}${result}${P_END}"
          exitcode=1
          continue
        else
          if [ "$VERBOSE" = "true" ]; then
            echo -e "${P_OK}Content conversion to ${altformat^^} succeeded for '${P_END}${file_relative}${P_OK}'.${P_END}"
          fi
        fi

        # Format specific post-processing
        case $altformat in
        json)
          # Remove extra slashes
          # perl -pi -e 's,\\/,/,g' "${dest}"
          # translate OSCAL mime types
          perl -pi -e 's,(application/oscal\.[a-z]+\+)xml\",\1json\",g' "${dest}"
          # relative content paths
          # translate path names, starting first with the xml directory, then the filename
          perl -pi -e 's,(\.\./[^\"]+(?=/xml/))/xml/,\1/json/,g' "${dest}"
          perl -pi -e 's,(\.\./[^\"]+(?=/json/)[^\"]+(?=.xml\")).xml\",\1.json\",g' "${dest}"
          perl -pi -e 's,(\"[^/\"]+(?=\.xml\")).xml\",\1.json\",g' "${dest}"

#          cp "${dest}.tmp" "${dest}"

          # validate generated file
          schema="$WORKING_DIR/json/schema/oscal_${model}_schema.json"
          schema_relative=$(realpath --relative-to="${WORKING_DIR}" "$schema")
          result=$(validate_json "$schema" "$dest")
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
            echo -e "${P_ERROR}JSON Schema validation failed for '${P_END}${dest_relative}${P_ERROR}' using schema '${P_END}${schema_relative}${P_ERROR}'.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            exitcode=1
            continue
          else
            echo -e "${P_OK}JSON Schema validation passed for '${P_END}${dest_relative}${P_OK}' using schema '${P_END}${schema_relative}${P_OK}'.${P_END}"
          fi

          # produce pretty JSON
          dest_pretty="$WORKING_DIR/${newpath}.${altformat}"
          dest_pretty_relative=$(realpath --relative-to="${WORKING_DIR}" "$dest_pretty")
          result=$(jq . "$dest" > "$dest_pretty" 2>&1)
          if [ $? -ne 0 ]; then
            echo -e "${P_ERROR}Unable to execute jq on '${P_END}${dest_pretty_relative}${P_ERROR}' using schema '${P_END}${schema_relative}${P_ERROR}'.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            exitcode=1
            continue
          fi
		  # remove carriage returns
		  perl -pi -e 's,\r,,g' "$dest_pretty"

          result=$(validate_json "$schema" "$dest_pretty" 2>&1)
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
            echo -e "${P_ERROR}JSON Schema validation failed for '${P_END}${dest_pretty_relative}${P_ERROR}' using schema '${P_END}${schema_relative}${P_ERROR}'.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            exitcode=1
            continue
          else
            echo -e "${P_OK}JSON Schema validation passed for '${P_END}${dest_pretty_relative}${P_OK}' using schema '${P_END}${schema_relative}${P_OK}'.${P_END}"
          fi

          # produce yaml
          newpath="${newpath/\/json\///yaml/}" # change path
          dest_pretty="$WORKING_DIR/${newpath}.yaml"
          dest_pretty_dir=${dest_pretty%/*} # remove filename
          mkdir -p "$dest_pretty_dir"
          prettyjson --nocolor=1 --indent=2 --inline-arrays=1 "$dest" > "$dest_pretty"
          ;;
        xml)
          # validate generated file
          schema="$WORKING_DIR/xml/schema/oscal_${model}_schema.xsd"
          schema_relative=$(realpath --relative-to="${WORKING_DIR}" "$schema")
          result=$(xmllint --noout --schema "$schema" "$dest" 2>&1)
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
            echo -e "${P_ERROR}XML Schema validation failed for '${P_END}${dest_relative}${P_ERROR}' using schema '${P_END}${schema_relative}${P_ERROR}'.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            exitcode=1
          else
            echo -e "${P_OK}XML Schema validation passed for '${P_END}${dest_relative}${P_OK}' using schema '${P_END}${schema_relative}${P_OK}'.${P_END}"
          fi
          ;;
        *)
          echo -e "${P_WARN}Post processing of '${altformat^^}' is unsupported for '${P_END}${dest_relative}${P_OK}'.${P_END}"
          continue;
        esac
      done
    done
  fi
done < "$OSCALDIR/build/ci-cd/config/content"

shopt -u nullglob
shopt -u globstar

exit $exitcode
