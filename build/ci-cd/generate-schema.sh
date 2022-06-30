#!/bin/bash

# if not previously initialized
if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
  # Initializing the OSCAL and metaschema environments, to include configured paths to supporting files
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

# A bash function that displays the command help message called when "-h" argument is provided
usage() {
  cat << EOF
Usage: $0 [options] [metaschema paths]

-h, --help                        Display help
-w DIR, --working-dir DIR         Generate artifacts in DIR  (default: ${WORKING_DIR})
-v                                Provide verbose output
EOF
}

# Setup the commandline argument parsing via getopt, defines the long ("--") and short ("-") options
# See https://man7.org/linux/man-pages/man1/getopt.1.html
# if the getopt parsing failed (i.e., non-zero return code), display message and usage
if ! OPTS=$(getopt -o w:vh --long working-dir:,help -n "$0" -- "$@"); then echo "Failed parsing options." >&2 ; usage ; exit 1 ; fi

# Process commandline arguments
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

# start the script execution by outputting some details
echo -e ""
echo -e "${P_INFO}Generating XML and JSON Schema${P_END}"
echo -e "${P_INFO}==============================${P_END}"

# if verbose output is enable, display the working directory used
if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Using working directory:${P_END} ${WORKING_DIR}"
fi

# Establish which metaschema to process, either: the commandline argument or the config file
declare -a paths
declare -a formats
if [ "$#" -ne 0 ]; then
  # if a metaschema is provided as a commandline argument, use it
  paths=("$@")
  # handles any wildcards in the schema path
  for i in "${!paths[@]}"; do
    # for each resolved path, generate XML and JSON schema
    formats[$i]="xml,json"
  done
else
  # use the paths defined in the config file, parsing them into the specified variables
  IFS_OLD="$IFS"
  while IFS="|" read path gen_schema gen_converter gen_docs || [[ -n "$path" ]]; do
    [[ "$path" =~ ^[[:space:]]*# ]] && continue
    # remove leading space
    path="${path##+([[:space:]])}"

    # skip empty paths and entries with no target schema described
    ([ -z "$path" ] || [ -z "$gen_schema" ]) && continue;

    path_absolute="$OSCALDIR"/"$path"

    IFS= # disable word splitting
    for metaschema in $path_absolute
    do
      # for each resolved path, generate the specified (XML and JSON) schema
      paths+=($metaschema)
      formats+=($gen_schema)
    done
  done < "$OSCALDIR/build/ci-cd/config/metaschema" # the config file
  IFS="$IFS_OLD"
fi

exitcode=0
# For each configured metaschema, do the following
for i in ${!paths[@]}; do
  metaschema="${paths[$i]}"
  gen_schema="${formats[$i]}"

  # get the metaschema's filename
  filename=$(basename -- "$metaschema")
  # get the metaschema's file extension
  extension="${filename##*.}"
  # get the metaschema's filename minus the extension
  filename="${filename%.*}"
  # remove the "_metaschema" from the filename. All metaschema follow the convention "oscal_{name}_metaschema.xml"
  # For example: "oscal_profile_metaschema" while be converted to "oscal_profile"
  base="${filename/_metaschema/}"
  metaschema_relative=$(get_rel_path "${OSCALDIR}" "${metaschema}")

  # split on commas to determine which schema to generate and iterate
  IFS_OLD="$IFS"
  IFS=, gen_formats=($gen_schema)
  IFS="$IFS_OLD"
  for format in ${gen_formats[@]}; do
    if [ -z "$format" ]; then
      # skip blanks
      continue;
    fi

    # depending on the target schema format
    case $format in
    xml)
      # indicate which type of schema to generate
      generator_arg="--xml"
      # name the target schema
      schema="$WORKING_DIR/$format/schema/${base}_schema.xsd"
      ;;
    json)
      # indicate which type of schema to generate
      generator_arg="--json"
      # name the target schema
      schema="$WORKING_DIR/$format/schema/${base}_schema.json"
      ;;
    *)
      # else display an error about the unsupported format
      echo -e "${P_WARN}Unsupported schema format '${format^^}' schema for '$metaschema'.${P_END}"
      continue;
      ;;
    esac

    # ensure the schema directory exists and make them if needed
    mkdir -p "$(dirname "$schema")"
    schema_relative=$(get_rel_path "${WORKING_DIR}" "${schema}")

    if [ "$VERBOSE" == "true" ]; then
      echo -e "${P_INFO}Generating ${format^^} schema for '${P_END}${metaschema_relative}${P_INFO}' as '${P_END}${schema_relative}${P_INFO}'.${P_END}"
    fi

    # We need to call the script that does the actual schema generation
    # first setup the commandline arguments for this script
    args=()
    args+=("$generator_arg") # type of schema to generate
    args+=("$metaschema") # source metaschema
    args+=("$schema") # target schema
    args+=("--validate") # validate the schema after generation

    if [ "$VERBOSE" == "true" ]; then
      args+=("-v") # if verbose, have the generation script generate verbose messages
    fi

    # call the schema generation script
    result=$("$OSCALDIR/build/metaschema/scripts/generate-schema.sh" "${args[@]}" 2>&1)
    cmd_exitcode=$? # save exit code
    if [ $cmd_exitcode -ne 0 ]; then
      # if the exit code is not 0 (failure), output error message
      echo -e "${P_ERROR}Generation of ${format^^} schema failed for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
      echo -e "${P_ERROR}${result}${P_END}"
      exitcode=1
    else
      # if the exit code is 0 (success), output success message if verbose is turned on
      echo -e "${result}"
      if [ "$VERBOSE" == "true" ]; then
        echo -e "${P_OK}Generation of ${format^^} schema passed for '${P_END}${metaschema_relative}${P_OK}'.${P_END}"
      fi
    fi
  done
done

exit $exitcode
