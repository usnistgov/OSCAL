#!/bin/bash

validate_content() {
  local target_file="$1"; shift
  local target_format="$1"; shift
  local model="$1"; shift

  # validate target
  case $target_format in
  xml)
    target_schema="$WORKING_DIR/$target_format/schema/oscal_${model}_schema.xsd"
    result=$(validate_xml "$target_schema" "$target_file")
    ;;
  json)
    target_schema="$WORKING_DIR/$target_format/schema/oscal_${model}_schema.json"
    result=$(validate_json "$target_schema" "$target_file")
    ;;
  *)
    echo -e "${P_WARN}Unsupported schema format '${target_format^^}'.${P_END}"
    return 4;
    ;;
  esac

  cmd_exitcode=$?
  if [ $cmd_exitcode -ne 0 ]; then
    echo -e "${P_ERROR}${result}${P_END}"
    echo -e "${P_ERROR}${target_format^^} Schema validation failed for '${P_END}${target_file}${P_ERROR}' using schema '${P_END}${target_schema}${P_ERROR}'.${P_END}"
    return 2;
  else
    if [ "$VERBOSE" = "true" ]; then
      echo -e "${P_OK}${target_format^^} Schema validation passed for '${P_END}${target_file}${P_OK}'.${P_END}"
    fi
  fi
  return 0;
}

convert_to_format_and_validate() {
  local source_file="$1"; shift
  local target_file="$1"; shift
  local source_format="$1"; shift
  local target_format="$1"; shift
  local model="$1"; shift

  # get the schema to use for validating the target
  case $target_format in
  xml)
    target_converter="$WORKING_DIR/xml/convert/oscal_${model}_json-to-xml-converter.xsl"
    ;;
  json)
    target_converter="$WORKING_DIR/json/convert/oscal_${model}_xml-to-json-converter.xsl"
    ;;
  *)
    echo -e "${P_WARN}Unsupported target format '${target_format^^}'.${P_END}"
    return 3;
    ;;
  esac

  # convert source to target format
#  echo "Source: $source_file"
#  echo "Target: $target_file"
#  echo "Source Format: $source_format"
#  echo "Target Format: $target_format"
#  echo "Converter: $target_converter"

  result=$(convert_content "$source_file" "$target_file" "$source_format" "$target_format" "$target_converter")
  cmd_exitcode=$?
  if [ $cmd_exitcode != 0 ]; then
      echo -e "${P_ERROR}${result}${P_END}"
      echo -e "${P_ERROR}${source_format^^}->${target_format^^} conversion failed for '${P_END}${source_file}${P_ERROR}'.${P_END}"
      return 1;
  fi

  result=$(validate_content "$target_file" "$target_format" "$model")
  echo -ne "${result}"
  cmd_exitcode=$?
  if [ $cmd_exitcode != 0 ]; then
      return 1;
  fi
  return 0;
}

