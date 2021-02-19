process.cwd();

import fs from 'fs';
import {join} from 'path';
import {spawnSync} from 'child_process';

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
         // workingDir is the working directory you passed when generating the schemas
        const schemaRootDir = workingDir ? `${projectRootDir}/${workingDir}` : projectRootDir;
        // const configFileLocation = configFile ? configFile : `${projectRootDir}/build/ci-cd/config/content`;
        // const readConfigFile = fs.readFileSync(configFileLocation, 'utf8');
        // const configFileContent = readConfigFile.toString().replace(/#.*\s/g, '').split('\n').filter(Boolean);

        console.log('');
        console.log(`${P_INFO}Validating Content${P_END}`);
        console.log(`${P_INFO}==================${P_END}`);

        if (verbose === true) {
            console.log(`${P_INFO}Using OSCAL directory:${P_END} ${P_PATH}${schemaRootDir}${P_END}`);
            console.log(`${P_INFO}Using artifact directory:${P_END} ${P_PATH}${artifactRootDir}${P_END}`);
            // console.log(`${P_INFO}Using config file:${P_END} ${P_PATH}${configFileLocation}${P_END}`);
          }
      
          // configFileContent.forEach(config => {
          configPaths.forEach(config => {
            const configArray = config.split('|');
            const path = configArray[0];
            const format = configArray[1];
            const model = configArray[2];
            const convertToFormats = configArray[3];
      
            const pathArray = path.split('/*');
            const pathRoot = pathArray[0];
            const fileFinder = pathArray[1];
      
            let filesToProcess = null
            if(fileFinder) {
              filesToProcess = fs.readdirSync(`${artifactRootDir}/${pathRoot}`).filter(file => file.endsWith(`${fileFinder}`))
                .map(fileName => `${pathRoot}/${fileName}`)
            }  else {
              filesToProcess = [pathRoot];
            }  
      
            filesToProcess.map(fileName => `${artifactRootDir}/${fileName}`).forEach(file => {
              // const fileRelativePath = `${artifactRootDir}/${file}`;
              if (verbose === true) {
                console.log(`${P_INFO}Validating ${model} ${format} file ${P_END} ${P_PATH}${file}${P_END}`);
              }
      
              const fileExtension = format === 'xml' ? 'xsd' : 'json';
              const schema = `${schemaRootDir}/${format}/schema/oscal_${model}_schema.${fileExtension}`;
      
              if (format === 'xml') {
                if (!schema) {
                  console.log(`${P_ERROR}The XML schema must be provided as the first argument.${P_END}`)
                }
                if (!file) {
                  console.log(`${P_ERROR}The XML file must be provided as the second argument.${P_END}`)
                }
                // result=$(xmllint --noout --schema "$schema" "$file" 2>&1)
                const scriptArguments = [
                  '--noout',
                  `--schema ${schema}`,
                  `${file}`,
                  //`-o ${schemaRootDir}`,
                  // `-c ${configFileLocation}`,
                  // `-a ${artifactRootDir}`,
                  //`${verbose ? '-v' : ''}`,
                ];
      
                const result: any = spawnSync('xmllint', scriptArguments, {shell: true, stdio: 'inherit'});
      
                if (!result || result.status !== 0) {
                  console.log(`${P_ERROR}XML Schema validation failed for '${P_END}${P_PATH}${file}${P_END}${P_PATH} using schema ${schema}${P_END}${P_ERROR}'${P_END}.`);
      
                  process.exit(1);
                } else {
                  console.log(`${P_OK}XML Schema validation passed for '${P_END}${P_PATH}${file}${P_END}${P_PATH} using schema ${schema}${P_END}${P_OK}'${P_END}.`);
                }
              }
              else if (format === 'json') {
                if (!schema) {
                  console.log(`${P_ERROR}The JSON schema must be provided as the first argument.${P_END}`)
                }
                if (!file) {
                  console.log(`${P_ERROR}The JSON file must be provided as the second argument.${P_END}`)
                }
                // result=$(validate_json "$schema" "$file")
                const scriptArguments = [
                  `-s ${schema}`,
                  `-d ${file}`,
                  //`-o ${schemaRootDir}`,
                  // `-c ${configFileLocation}`,
                 // `-a ${artifactRootDir}`,
                 // `${verbose ? '-v' : ''}`,
                ];
      
                const result: any = spawnSync('ajv', scriptArguments, {shell: true, stdio: 'inherit'});
      
                if (!result || result.status !== 0) {
                  console.log(`${P_ERROR}JSON Schema validation failed for '${P_END}${P_PATH}${file}${P_END}${P_PATH} using schema ${schema}${P_END}${P_ERROR}'${P_END}.`);
      
                  if (result.status > 1) {
                    console.log(`${P_ERROR}Error running ajv.${P_END}`);
                  } else {
                    console.log(`${file} is invalid.`);
                  }
      
                  process.exit(1);
                } else {
                  console.log(`${P_OK}JSON Schema validation passed for '${P_END}${P_PATH}${file}${P_END}${P_PATH} using schema ${schema}${P_END}${P_OK}'${P_END}.`);
                }
              }
            })
          });
      
      
        } catch (error) {
          console.log(error.message)
        }
}