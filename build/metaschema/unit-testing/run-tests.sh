#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/../../ci-cd/include/common-environment.sh"
fi
source "$OSCALDIR/build/ci-cd/include/init-validate-json.sh"
source "$OSCALDIR/build/ci-cd/include/schematron-init.sh"

# configuration
UNIT_TESTS_DIR="$OSCALDIR/build/metaschema/unit-testing"
METASCHEMA_LIB_DIR="$OSCALDIR/build/metaschema/lib"
METASCHEMA_SCHEMA="$METASCHEMA_LIB_DIR/metaschema.xsd"
METASCHEMA_SCHEMATRON="$METASCHEMA_LIB_DIR/metaschema-check.sch"
DEBUG="false"

# Option defaults
KEEP_TEMP_SCRATCH_DIR=false
VERBOSE=false
HELP=false

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options] [test dir]
Run all build scripts

-h, -help,                        Display help
-v                                Provide verbose output
--scratch-dir DIR                 Generate temporary artifacts in DIR
                                  If not provided a new directory will be
                                  created under \$TMPDIR if set or in /tmp.
--keep-temp-scratch-dir           If a scratch directory is automatically
                                  created, it will not be automatically removed.
EOF
}

OPTS=`getopt -o w:vh --long scratch-dir:,keep-temp-scratch-dir,help -n "$0" -- "$@"`
if [ $? != 0 ] ; then echo -e "Failed parsing options." >&2 ; usage ; exit 1 ; fi

# Process arguments
eval set -- "$OPTS"
while [ $# -gt 0 ]; do
  arg="$1"
  case "$arg" in
    --scratch-dir)
      SCRATCH_DIR="$(realpath "$2")"
      shift # past unit_test_dir
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
      echo -e "Unhandled option: $1"
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
echo -e "${P_INFO}Running Unit Tests${P_END}"
echo -e "${P_INFO}==================${P_END}"

if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Using scratch directory:${P_END} ${SCRATCH_DIR}"
fi

test_dirs=()
if [ -n "$1" ]; then
    test_dirs+=("$1")
else
    while IFS= read -r -d $'\0'; do
        test_dirs+=("$REPLY")
    done < <(find "$UNIT_TESTS_DIR" -mindepth 1 -maxdepth 1 -type d -print0)
fi

if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Executing tests in '${P_END}${test_dirs[@]}${P_INFO}'.${P_END}"
fi

# compile the schematron
compiled_schematron="${SCRATCH_DIR}/metaschema-check-schematron-compiled.xsl"
build_schematron "$METASCHEMA_SCHEMATRON" "$compiled_schematron"
cmd_exitcode=$?
if [ $cmd_exitcode -ne 0 ]; then
  echo -e "${P_ERROR}Compilation of Schematron '${P_END}${METASCHEMA_SCHEMATRON}${P_ERROR}' failed.${P_END}"
  exit 1
fi
# the following is needed by the compiled template
cp "${METASCHEMA_LIB_DIR}/metaschema-compose.xsl" "${SCRATCH_DIR}"
cp "${METASCHEMA_LIB_DIR}/oscal-datatypes-check.xsl" "${SCRATCH_DIR}"

exitcode=0
for unit_test_collection_dir in "${test_dirs[@]}"
do
  # get absolute and relative paths of the unit test collection
  unit_test_collection_dir=$(realpath "$unit_test_collection_dir")
  unit_test_collection_name=$(basename -- "$unit_test_collection_dir")
  echo -e "${P_INFO}Processing unit test collection:${P_END} ${unit_test_collection_name}"

  unit_test_collection_scratch_dir="$SCRATCH_DIR/$unit_test_collection_name"
  mkdir -p "$unit_test_collection_scratch_dir"

  while IFS= read -d $'\0' -r metaschema ; do
    metaschema_file="$(basename -- "$metaschema")"
    unit_test_name="${metaschema_file/_metaschema.xml/}"
    unit_test_name="${unit_test_name/${unit_test_collection_name}-/}"
    unit_test_path_prefix="$unit_test_collection_dir/${unit_test_collection_name}-${unit_test_name}"

    echo -e "${P_INFO}Processing unit test:${P_END} ${unit_test_name}"

    unit_test_scratch_dir_prefix="$unit_test_collection_scratch_dir/$unit_test_name"

    metaschema_relative=$(realpath --relative-to="$unit_test_collection_dir" "$metaschema")

    # first validate the metaschema
    if [ "$VERBOSE" = "true" ]; then
      echo -e "  ${P_INFO}Validating Metaschema:${P_END} ${metaschema_relative}"
    fi
    result=$(xmllint --nowarning --noout --schema "$METASCHEMA_SCHEMA" "$metaschema" 2>&1)
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
      echo -e "  ${P_ERROR}Metaschema '${P_END}${metaschema_relative}${P_ERROR}' is not XML Schema valid.${P_END}"
      echo -e "${P_ERROR}${result}${P_END}"
      exitcode=1
      continue
    else
      if [ "$VERBOSE" = "true" ]; then
        echo -e "  ${P_OK}Metaschema '${P_END}${metaschema_relative}${P_OK}' is XML Schema valid.${P_END}"
      fi

      svrl_result="${unit_test_scratch_dir_prefix}.svrl"
      result=$(validate_with_schematron "$compiled_schematron" "$metaschema" "$svrl_result" 2>&1)
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
          if [ -f "${unit_test_path_prefix}_validation-schematron-FAIL" ]; then
            if [ "$VERBOSE" = "true" ]; then
              echo -e "  ${P_OK}Metaschema '${P_END}${metaschema_relative}${P_OK}' was expected to fail the schematron checks.${P_END}"
            fi
            continue;
          else
            echo -e "  ${P_ERROR}Metaschema '${P_END}${metaschema_relative}${P_ERROR}' did not pass the schematron checks.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            exitcode=1
            continue;
          fi
      fi

      # Now generate the JSON schema
      transform="$OSCALDIR/build/metaschema/json/produce-json-schema.xsl"
      schema="${unit_test_scratch_dir_prefix}_generated-json-schema.json"

      if [ "$VERBOSE" = "true" ]; then
        echo -e "  ${P_INFO}Generating JSON schema for '${P_END}${metaschema_relative}${P_INFO}' as '${P_END}$schema${P_INFO}'.${P_END}"
      fi
      result=$(xsl_transform "$transform" "$metaschema" "$schema" 2>&1)
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo -e "  ${P_ERROR}Failed to generate JSON schema for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
        echo -e "${P_ERROR}${result}${P_END}"
        exitcode=1
        continue;
      fi
      result=$(validate_json "$OSCALDIR/build/ci-cd/support/json-schema-schema.json" "$schema" 2>&1)
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo -e "  ${P_ERROR}Failed to validate generated JSON schema '${P_END}$schema${P_ERROR}'.${P_END}"
        echo -e "${P_ERROR}${result}${P_END}"
        exitcode=1
        continue;
      else
        echo -e "  ${P_OK}Generated valid JSON schema for '${P_END}${metaschema_relative}${P_OK}' as '${P_END}$schema${P_OK}'.${P_END}"
      fi
    fi

    # diff the generated JSON schema with the expected JSON schema
    expected_schema="${unit_test_path_prefix}_json-schema.json"
    expected_schema_relative=$(realpath --relative-to="$unit_test_collection_dir" "$expected_schema")
    # Only perform this check if an expected schema exists
    if [ -f "$expected_schema" ]; then
      if [ "$DEBUG" == "true" ]; then
        # skip this step and use the expected schema as the schema
        schema="$expected_schema"
      else
        diff=$(json-diff "$expected_schema" "$schema")
        cmd_exitcode=$?
        if [ $cmd_exitcode -ne 0 ]; then
          echo -e "  ${P_ERROR}Generated JSON schema '${P_END}${schema}${P_ERROR}' doesn't match expected schema '${P_END}${expected_schema_relative}${P_ERROR}'.${P_END}"
          echo -e "${P_ERROR}${diff}${P_END}"
          exitcode=1
          continue;
        else
          echo -e "  ${P_OK}Generated JSON schema matches expected schema '${P_END}${expected_schema_relative}${P_OK}'.${P_END}"
        fi
      fi
    fi

    # now run test instances
    while IFS= read -d $'\0' -r test_instance ; do
      test_instance_file=$(basename -- "$test_instance")
      test_instance_name="${test_instance_file/${unit_test_collection_name}-${unit_test_name}_test_/}"
      test_instance_name="${test_instance_name%%.json}"
      condition="${test_instance_name##*_}"
      test_instance_name="${test_instance_name%_*}"

      if [ "$VERBOSE" = "true" ]; then
        echo -e "  ${P_INFO}Evaluating test instance:${P_END} ${test_instance_name} = ${condition}"
      fi

      result=$(validate_json "$schema" "$test_instance")
      cmd_exitcode=$?
      case "$condition" in
        PASS)
          if [ $cmd_exitcode -ne 0 ]; then
            echo -e "  ${P_ERROR}Test instance '${P_END}${test_instance_name}${P_ERROR}' failed. Expected PASS.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            exitcode=1
          else
            echo -e "  ${P_OK}Test instance '${P_END}${test_instance_name}${P_OK}' passed.${P_END}"
          fi
          ;;
        FAIL)
          if [ $cmd_exitcode -eq 0 ]; then
            echo -e "  ${P_ERROR}Test instance '${P_END}${test_instance_name}${P_ERROR}' failed. Expected FAIL.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            exitcode=1
          else
            echo -e "  ${P_OK}Test instance '${P_END}${test_instance_name}${P_OK}' passed.${P_END}"
          fi
          ;;
        *)
          echo -e "${P_ERROR}Unsupported condition '$condition' for test instance '$test_instance_name'.${P_END}"
          exitcode=1
          ;;
      esac
    done < <(find "$unit_test_collection_dir" -maxdepth 1 -name "${unit_test_collection_name}-${unit_test_name}_test_*.json" -type f -print0)
  done < <(find "$unit_test_collection_dir" -maxdepth 1 -name "*_metaschema.xml" -type f -print0)
done

exit $exitcode
