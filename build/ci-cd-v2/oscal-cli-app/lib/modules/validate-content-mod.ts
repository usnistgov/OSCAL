import fs from 'fs';
import Ajv from 'ajv';
const libxmljs = require('libxmljs2-xsd');
import {colorCodes} from '../utils/init';
const {P_END, P_INFO, P_ERROR, P_OK, P_PATH, P_WARN} = colorCodes;

// validate_content(target_file_pretty, 'json', model, OSCAL_DIR); => // validate_content([target_file_pretty], ['json'], [model], OSCAL_DIR, VERBOSE);
export const validateContent = (
  paths: string[],
  format: string,
  model: string,
  WORKING_DIR: string,
  VERBOSE: boolean,
) => {
  try {
    console.log('');
    console.log(`${P_INFO}Validating Content${P_END}`);
    console.log(`${P_INFO}==================${P_END}`);

    paths.forEach((path: string) => {
      if (VERBOSE) {
        console.log(`${P_INFO}Validating ${model} ${format} file:${P_END} ${P_PATH}'${path}'${P_END}.`);
      }

      const validatorFileExtension = format === 'xml' ? 'xsd' : 'json';
      const schemaFile = `${format}/schema/oscal_${model}_schema.${validatorFileExtension}`;
      const schemaValidator = `${WORKING_DIR}/${schemaFile}`;

      if (!schemaValidator) {
        console.log(`${P_ERROR}The ${format.toUpperCase()} schema must be provided as the first argument.${P_END}`)
      }

      if (format === 'xml') {
        const xsdSchemaPath = schemaValidator;
        const xsdSchema = libxmljs.parseFile(xsdSchemaPath)
        const xmlFileContent = fs.readFileSync(path, 'utf8');
        const validationErrors = xsdSchema.validate(xmlFileContent);

        if (validationErrors) {
          console.log(`${P_ERROR}XML Schema validation failed for '${P_END}${P_PATH}${path}${P_ERROR}' using schema '${P_END}${P_PATH}${schemaFile}${P_ERROR}'.`);
          process.exit(1);
        } else {
          console.log(`${P_OK}XML Schema validation passed for '${P_END}${P_PATH}${path}${P_OK}'${P_END} ${P_OK}using schema '${P_END}${P_PATH}${schemaFile}${P_OK}'.`);
        }
      }

      if (format === 'json') {
        const ajv = new Ajv();
        const jsonSchema = schemaValidator
        const jsonSchemaContent = fs.readFileSync(jsonSchema, 'utf8');
        const validate = ajv.compile(JSON.parse(jsonSchemaContent));
        const jsonContent = fs.readFileSync(path, 'utf8');
        const valid = validate(JSON.parse(jsonContent))

        return valid
        // if (!valid){
        //   console.log(`${P_ERROR}JSON Schema validation failed for '${P_END}${P_PATH}${filesToProcess[index]}${P_ERROR}' using schema '${P_END}${P_PATH}${schemaFile}${P_ERROR}'.`);
        //   console.log(`${file} is invalid.`);
        //   process.exit(1);
        // } else {
        //   console.log(`${P_OK}JSON Schema validation passed for '${P_END}${P_PATH}${filesToProcess[index]}${P_OK}'${P_END} ${P_OK}using schema '${P_END}${P_PATH}${schemaFile}${P_OK}'.`);
        // }

      }
    });
  } catch (error) {
    console.log(error.message);
  }
}
