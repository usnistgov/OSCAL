#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/../../ci-cd/common-environment.sh"
fi
source $OSCALDIR/build/ci-cd/init-validate-json.sh
source $OSCALDIR/build/ci-cd/schematron-init.sh

if [ -z "$1" ]; then
  working_dir="$OSCALDIR"
else
  working_dir="$1"
fi
echo "${P_INFO}Working in '${P_END}${working_dir}${P_INFO}'.${P_END}"

# configuration
TEST_DIR="$OSCALDIR/build/metaschema/unit-testing"
TEST_BUILD_DIR="$working_dir/metaschema/unit-testing"
METASCHEMA_LIB_DIR="$OSCALDIR/build/metaschema/lib"
METASCHEMA_SCHEMA="$METASCHEMA_LIB_DIR/metaschema.xsd"
METASCHEMA_SCHEMATRON="$METASCHEMA_LIB_DIR/metaschema-check.sch"
DEBUG="true"

# Generate metaschema schematron
compiled_schematron="$TEST_BUILD_DIR/metaschema-check-compiled.xsl"
build_schematron "$METASCHEMA_SCHEMATRON" "$compiled_schematron"
cmd_exitcode=$?
if [ $cmd_exitcode -ne 0 ]; then
  echo "${P_ERROR}Compilation of Schematron '$METASCHEMA_SCHEMATRON' failed.${P_END}"
  exit 1
fi
cp "$METASCHEMA_LIB_DIR/metaschema-compose.xsl" "$TEST_BUILD_DIR"

exitcode=0
while IFS= read -d $'\0' -r dir ; do 
  echo "$dir"
  unit_test_dir=$(basename -- "$dir")
  echo "${P_INFO}Processing unit test collection: ${unit_test_dir}.${P_END}"

  while IFS= read -d $'\0' -r metaschema ; do
    metaschema_file=$(basename -- "$metaschema")
    base="${metaschema_file/_metaschema.xml/}"
    path=${metaschema%/*} # remove filename

    if [ "$DEBUG" != "true" ]; then
      # first validate the metaschema
      echo "${P_INFO}Validating Metaschema '$metaschema'.${P_END}"
      xmllint --nowarning --noout --schema "$METASCHEMA_SCHEMA" "$metaschema"
      cmd_exitcode=$?
      if [ $cmd_exitcode -ne 0 ]; then
        echo "${P_ERROR}Metaschema '$metaschema' is not schema valid.${P_END}"
        exitcode=1
      else
        svrl_result="$TEST_BUILD_DIR/$unit_test_dir/${metaschema_file}.svrl"
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
      schema="$TEST_BUILD_DIR/$unit_test_dir/${base}_schema.json"

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

    # diff the generated schema with the expected schema
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
    done < <(find "$dir" -name "${base}_test_*.json" -mindepth 1 -maxdepth 1 -type f -print0)
  done < <(find "$dir" -name "*_metaschema.xml" -mindepth 1 -maxdepth 1 -type f -print0)
done < <(find "$TEST_DIR" -mindepth 1 -maxdepth 1 -type d -print0)
