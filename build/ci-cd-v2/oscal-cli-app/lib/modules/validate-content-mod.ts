import fs from 'fs';
import {join} from 'path';
import Ajv from 'ajv';
const libxmljs = require('libxmljs2-xsd');

import {colorCodes} from '../utils/init';
const {P_END, P_INFO, P_ERROR, P_OK, P_PATH, P_WARN} = colorCodes

export const validateContent = (
    configPaths: string[],
    artifactDir: string,
    workingDir: string,
    verbose: boolean,
) => {
    try {
        const projectRootDir = join(__dirname, '../../../../..');
        //artifactDir is the directory that contains the models that is to be validated by the schemas
        const artifactRootDir = artifactDir ? join(__dirname, `../../../../../../${artifactDir}`) : projectRootDir;
        //workingDir is the working directory you passed when generating the schemas
        const schemaRootDir = workingDir ? `${projectRootDir}/${workingDir}` : projectRootDir;

        console.log('');
        console.log(`${P_INFO}Validating Content${P_END}`);
        console.log(`${P_INFO}==================${P_END}`);
      //If verbose is true, display headers
        if (verbose === true) {
            console.log(`${P_INFO}Using OSCAL directory:${P_END} ${P_PATH}${schemaRootDir}${P_END}`);
            console.log(`${P_INFO}Using artifact directory:${P_END} ${P_PATH}${artifactRootDir}${P_END}`);
           }
      
          configPaths.forEach(config => {
            const configArray = config.split('|');
            const path = configArray[0];
            const format = configArray[1];
            const model = configArray[2];
            const convertToFormats = configArray[3];
      
            const pathArray = path.split('/*');
            const pathRoot = pathArray[0];
            const fileFinder = pathArray[1];
      
            let filesToProcess: string[];

            if(fileFinder) {
              filesToProcess = fs.readdirSync(`${artifactRootDir}/${pathRoot}`)
                .filter(file => file.endsWith(`${fileFinder}`))
                .map(fileName => `${pathRoot}/${fileName}`)
            }else{
                filesToProcess = [pathRoot];
            }  
            
            filesToProcess.map((fileName) => `${artifactRootDir}/${fileName}`).forEach((file, index) => {
              if (verbose === true) {
                console.log(`${P_INFO}Validating ${model} ${format} file:${P_END} ${P_PATH}'${filesToProcess[index]}'${P_END}.`);
              }
      
              const fileExtension = format === 'xml' ? 'xsd' : 'json';
              const schemaFile = `${format}/schema/oscal_${model}_schema.${fileExtension}`;
              const schema = `${schemaRootDir}/${schemaFile}`;
              
              //If format is XML
              if (format === 'xml') {
                if (!schema) {
                  console.log(`${P_ERROR}The XML schema must be provided as the first argument.${P_END}`)
                }
                if (!file) {
                  console.log(`${P_ERROR}The XML file must be provided as the second argument.${P_END}`)
                }
                
                //Uses libxmljs2-xsd for the XML validation
                const xsdSchemaPath = schema;
                const xsdSchema = libxmljs.parseFile(xsdSchemaPath)
                const xmlFileContent = fs.readFileSync(file, 'utf8');
                const validationErrors = xsdSchema.validate(xmlFileContent);

                if (validationErrors) {
                  console.log(`${P_ERROR}XML Schema validation failed for '${P_END}${P_PATH}${filesToProcess[index]}${P_ERROR}' using schema '${P_END}${P_PATH}${schemaFile}${P_ERROR}'.`);
                  process.exit(1);
                } else {
                  console.log(`${P_OK}XML Schema validation passed for '${P_END}${P_PATH}${filesToProcess[index]}${P_OK}'${P_END} ${P_OK}using schema '${P_END}${P_PATH}${schemaFile}${P_OK}'.`);
                }
              }
              //If format is JSON
             
               if (format === 'json') {
                if (!schema) {
                  console.log(`${P_ERROR}The JSON schema must be provided as the first argument.${P_END}`)
                }
                if (!file) {
                  console.log(`${P_ERROR}The JSON file must be provided as the second argument.${P_END}`)
                }
                
                //Uses AJV for the JSON validation
                const ajv = new Ajv();
                const jsonSchema = schema
                const jsonSchemaContent = fs.readFileSync(jsonSchema, 'utf8');
                const validate = ajv.compile(JSON.parse(jsonSchemaContent));
                const jsonContent = fs.readFileSync(file, 'utf8');
                const valid = validate(JSON.parse(jsonContent));
            
                if (!valid){
                  console.log(`${P_ERROR}JSON Schema validation failed for '${P_END}${P_PATH}${filesToProcess[index]}${P_ERROR}' using schema '${P_END}${P_PATH}${schemaFile}${P_ERROR}'.`);
                  console.log(`${file} is invalid.`);
                  process.exit(1);
                } else {
                  console.log(`${P_OK}JSON Schema validation passed for '${P_END}${P_PATH}${filesToProcess[index]}${P_OK}'${P_END} ${P_OK}using schema '${P_END}${P_PATH}${schemaFile}${P_OK}'.`);
                }
              }
            })
          });
      
        } catch (error) {
          console.log(error.message)
        }
}