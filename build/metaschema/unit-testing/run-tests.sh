#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/../../ci-cd/common-environment.sh"
fi
source $OSCALDIR/build/ci-cd/init-validate-json.sh
source $OSCALDIR/build/ci-cd/schematron-init.sh

# configuration
DEFAULT_TEST_DIR="$OSCALDIR/build/metaschema/unit-testing"
TEST_BUILD_DIR="$OSCALDIR/build/metaschema/unit-testing"
METASCHEMA_LIB_DIR="$OSCALDIR/build/metaschema/lib"
METASCHEMA_SCHEMA="$METASCHEMA_LIB_DIR/metaschema.xsd"
METASCHEMA_SCHEMATRON="$METASCHEMA_LIB_DIR/metaschema-check.sch"
DEBUG="false"

# Process arguments
OTHER_ARGS=()
while [ $# -gt 0 ]; do
    arg="$1"
    case "$arg" in
        -d|--test-dir)
        TEST_DIR="$(realpath "$2")"
        shift # argument
        shift # value
        ;;
        --scratch-dir)
        SCRATCH_DIR="$(realpath "$2")"
        shift # argument
        shift # value
        ;;
        *)    # unknown option
        OTHER_ARGS+=("$1") # save the arg
        shift # past argument
        ;;
    esac
done

if [ -z "${SCRATCH_DIR}" ]; then
    SCRATCH_DIR=$(mktemp -d)
fi
echo "${P_INFO}Using scratch dir '${P_END}${SCRATCH_DIR}${P_INFO}'.${P_END}"

test_dirs=()
if [ -n "${TEST_DIR}" ]; then
    test_dirs+=("${TEST_DIR}")
else
    while IFS= read -r -d $'\0'; do
        test_dirs+=("$REPLY")
    done < <(find "$DEFAULT_TEST_DIR" -mindepth 1 -maxdepth 1 -type d -print0)
fi
echo "${P_INFO}Executing tests in '${P_END}${test_dirs[@]}${P_INFO}'.${P_END}"

# Generate metaschema schematron
compiled_schematron="$SCRATCH_DIR/metaschema-check-compiled.xsl"
build_schematron "$METASCHEMA_SCHEMATRON" "$compiled_schematron"
cmd_exitcode=$?
if [ $cmd_exitcode -ne 0 ]; then
  echo "${P_ERROR}Compilation of Schematron '$METASCHEMA_SCHEMATRON' failed.${P_END}"
  exit 1
fi
cp "$METASCHEMA_LIB_DIR/metaschema-compose.xsl" "$SCRATCH_DIR"

exitcode=0
for dir in "${test_dirs[@]}"
do
  echo "$dir"
  unit_test_dir=$(basename -- "$dir")
  echo "${P_INFO}Processing unit test collection: ${unit_test_dir}.${P_END}"

  while IFS= read -d $'\0' -r metaschema ; do
    metaschema_file=$(basename -- "$metaschema")
    base="${metaschema_file/_metaschema.xml/}"
    path=${metaschema%/*} # remove filename

    if [ ! "$DEBUG" == "true" ]; then
      # first validate the metaschema
      echo "${P_INFO}Validating Metaschema '$metaschema'.${P_END}"
      xmllint --nowarning --noout --schema "$METASCHEMA_SCHEMA" "$metaschema"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}Metaschema '$metaschema' is not schema valid.${P_END}"
        exitcode=1
      else
        svrl_result="$SCRATCH_DIR/$unit_test_dir/${metaschema_file}.svrl"
        svrl_result_dir=${svrl_result%/*}
        mkdir -p "$svrl_result_dir"
        result=$(validate_with_schematron "$compiled_schematron" "$metaschema" "$svrl_result")
        cmd_exitcode=$?
        if [ $cmd_exitcode -ne 0 ]; then
            if [ -f "$path/${base}_validation-schematron-FAIL" ]; then
              echo "${P_OK}Metaschema '$metaschema' was expected to fail the schematron checks.${P_END}"
              continue;
            else
              echo "${P_ERROR}${result}${P_END}"
              echo "${P_ERROR}Metaschema '$metaschema' did not pass the schematron checks.${P_END}"
              exitcode=1
              continue;
            fi
        fi
      fi

      # Now generate the JSON schema
      transform="$OSCALDIR/build/metaschema/json/produce-json-schema.xsl"
      schema="$SCRATCH_DIR/$unit_test_dir/${base}_generated-json-schema.json"

      echo "${P_INFO}Generating JSON schema for '$metaschema' as '$schema'.${P_END}"
      xsl_transform "$transform" "$metaschema" "$schema"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}Generating JSON schema failed for '$metaschema'.${P_END}"
        exitcode=1
        continue;
      fi
      validate_json "$OSCALDIR/build/ci-cd/json-schema-schema.json" "$schema"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}Generating JSON schema failed for '$metaschema'.${P_END}"
        exitcode=1
        continue;
      fi
    fi

    # diff the generated JSON schema with the expected JSON schema
    expected_schema="$path/${base}_json-schema.json"
    # Only perform this check if an expected schema exists
    if [ -f "$expected_schema" ]; then
      if [ "$DEBUG" == "true" ]; then
        schema="$expected_schema"
      fi
      diff=$(json-diff "$expected_schema" "$schema")
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}Generated JSON schema '$schema' doesn't match expected schema '$expected_schema'.${P_END}"
        echo -E "${P_ERROR}${diff}${P_END}"
        exitcode=1
        continue;
      fi
    fi

    # now run test instances
    while IFS= read -d $'\0' -r test_instance ; do
      echo "$test_instance"
      test_instance_file=$(basename -- "$test_instance")
      echo "${P_INFO}Running test instance: ${test_instance_file}${P_END}"
      test_instance_name="${test_instance_file/${base}_test_/}"
      test_instance_name="${test_instance_name%%.json}"
      condition="${test_instance_name##*_}"
      test_instance_name="${test_instance_name%_*}"

      result=$(validate_json "$schema" "$test_instance")
      cmd_exitcode=$?
      case "$condition" in
        PASS)
          if [ $cmd_exitcode -ne 0 ]; then
            echo "${P_ERROR}Test validation failed for for test instance '${test_instance_file}'. Expected PASS.${P_END}"
            exitcode=1
          else
            echo "${P_OK}Test validation passed.${P_END}"
          fi
          ;;
        FAIL)
          if [ $cmd_exitcode -eq 0 ]; then
            echo "${P_ERROR}Test validation failed for for test instance '${test_instance_file}'. Expected FAIL.${P_END}"
            exitcode=1
          else
            echo "${P_OK}Test validation passed.${P_END}"
          fi
          ;;
        *)
          echo "${P_ERROR}Unsupported condition '$condition' for test instance '$test_instance'.${P_END}"
          exitcode=1
          ;;
      esac
    done < <(find "$dir" -maxdepth 1 -name "${base}_test_*.json" -type f -print0)
  done < <(find "$dir" -maxdepth 1 -name "*_metaschema.xml" -type f -print0)
done

exit $exitcode
