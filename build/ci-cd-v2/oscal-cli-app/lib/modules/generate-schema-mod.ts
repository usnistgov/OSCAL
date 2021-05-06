import fs from 'fs';
import {colorCodes} from '../utils/init'
import {validateSchema} from './validate-schema-mod'
import {join} from 'path';
import * as SAXONJS from 'saxon-js/saxonJS2N.js'

const {P_END, P_INFO, P_ERROR, P_OK, P_PATH, P_WARN} = colorCodes

export const generateSchema = async(argv: any) => {
  try {
    const oscalRootDirectory: any = join(__dirname, '../../../../..');
    const workingDir: any = argv['w'] || argv['working-dir'];

    let workingDirectory: any

    if (workingDir) {
      //Assign the directory to a variable
      const parsedWorkingDir = workingDir;
      //Create the directory defined from the command line interface
      fs.mkdirSync(`${parsedWorkingDir}`, {recursive: true});
      //Assign the relative path of the working directory to a variable
      workingDirectory = `${process.cwd()}/${parsedWorkingDir}`;
    }
  
    //If working directory is defined and has a value
    const schemaRootDir = workingDirectory ? workingDirectory : oscalRootDirectory;

    console.log('');
    console.log(`${P_INFO}Generating XML and JSON Schema${P_END}`);
    console.log(`${P_INFO}==============================${P_END}`);

    // If '-v' option is parsed, the value will default to true. Assign the value to the 'verbose' variable
    const verbose: any = argv.v;
    const validate: any = argv.validate;

    if (verbose === true) {
      console.log(`${P_INFO}Using working directory:${P_END} ${P_PATH}${schemaRootDir}${P_END}`);
      console.log(`${P_INFO}Using cache directory:${P_END} ${P_PATH}${oscalRootDirectory}/.metaschema-cache${P_END}`);
    }

     // Get an array of arguments parsed from command line interface (the args should be the configs)
    const metaSchemaArray: string[] = argv._.slice(1)
    
    if (!metaSchemaArray.length) {
      console.error(`${P_ERROR}You must specify the Metaschema to generate the schema for.${P_END}`);
      process.exit(1);
    }
    
    metaSchemaArray.forEach(async(metaSchema) => {
      const validFormats = ['xml', 'json'];
      validFormats.forEach(async(format) => {
        const metaSchemaPathArray = metaSchema.split('/');
        // Get metachema file name
        const metaschemaFile = metaSchemaPathArray[metaSchemaPathArray.length - 1];
        // Get the base of each metaschema file from the metaschema file name
        const base = metaschemaFile.replace(/(_metaschema).*/g, '');
        /*
        Create the schema directories.
        Recursive option helps to create a new folder inside a non-existing folder.
        It also helps to update only target files in the created directory if the directory already existed.
        Recursive only works for node 10^
        */
        fs.mkdirSync(`${workingDirectory}/${format}/schema`, {recursive: true});

        const sourceFiles = fs.readdirSync(`${oscalRootDirectory}/src/metaschema`);
        // Get only files with xml extensions in the metaschema directory
        const getXMLSourceFiles = sourceFiles.filter((file) => file.endsWith('xml'));
        const metaSchemaExist = getXMLSourceFiles.includes(metaschemaFile);

        let fileExtension = format;
        // File extension defaults to the format currently in use for iteration. If xml is the current format, then use xsd
        if (format === 'xml') {
          fileExtension = 'xsd';
        }
        const schemaFile = `${format}/schema/${base}_schema.${fileExtension}`;

        if (metaSchemaExist) {
          fs.openSync(`${schemaRootDir}/${schemaFile}`, 'w');

          const sourcePath = `${oscalRootDirectory}/src/metaschema/${metaschemaFile}`;
          const targetPath = `${schemaRootDir}/${schemaFile}`;

          // ****************************************************************************
          // Added New Code for Schema Generation using SAXONJS - 2/16/21
          // ****************************************************************************
          const PROVIDER_RESOURCE_DIR = `${oscalRootDirectory}/build/metaschema/toolchains/xslt-M4`;
      
          const stylesheet = format ===  'xml' ? `${PROVIDER_RESOURCE_DIR}/nist-metaschema-MAKE-XSD.xsl`
          : `${PROVIDER_RESOURCE_DIR}/nist-metaschema-MAKE-JSON-SCHEMA.xsl`

          const sefFile = format === 'xml' ? `${PROVIDER_RESOURCE_DIR}/nist-metaschema-MAKE-XSD.sef.json`
          : `${PROVIDER_RESOURCE_DIR}/nist-metaschema-MAKE-JSON-SCHEMA.sef.json`
          //********************************************************************************** */

          // const stylesheet = format ===  'xml' ? `${PROVIDER_RESOURCE_DIR}/mini-test.xsl`
          // : `${PROVIDER_RESOURCE_DIR}/mini-test.xsl`

          // const sefFile = format === 'xml' ? `${PROVIDER_RESOURCE_DIR}/mini-test.sef.json`
          // : `${PROVIDER_RESOURCE_DIR}/mini-test.sef.json`

            try {
              const result = await SAXONJS.transform({
               stylesheetFileName: `${sefFile}`,
               stylesheetBaseURI: `${stylesheet}`,
               sourceFileName: `${sourcePath}`,
               destination: "serialized",
               }, "async")

              if (!verbose){
                console.log(`${P_INFO}Generating ${format.toUpperCase()} schema for metaschema:${P_END} ${metaSchema}`)
              }

              if (verbose){
                console.log(`${P_INFO}Generating ${format.toUpperCase()} schema for metaschema:${P_END} '${metaSchema}' as '${schemaFile}'`)
              }

              fs.writeFileSync(`${targetPath}`, result.principalResult.toString());               
                
              if (verbose === true) {
                console.log(`${P_OK}Generation of ${format.toUpperCase()} schema passed for '${P_END}${P_PATH}${metaSchema}${P_END}${P_OK}'${P_END}.`);
              } 
          
              if (!verbose)  {
                console.log(`${P_OK}Schema generation complete for '${P_END}${P_PATH}${oscalRootDirectory}/${metaSchema}${P_END}${P_OK}' as '${P_END}${targetPath}${P_OK}', which is valid.${P_END}.`);
              }

              //If --validate is used on the CLI validate JSON and XML schemas
              if (validate === true) {
                validateSchema(schemaRootDir, `${base}_schema.${fileExtension}`, '');
                console.log(`${base}_schema.${fileExtension}`)
              } 

            } catch (error) {
                console.log(error.message)
                process.exit(1)
            }
 
      } else {
        console.log(`${P_ERROR}Generation of ${format.toUpperCase()} schema failed for '${P_END}${P_PATH}${metaSchema}${P_END}${P_ERROR}'${P_END}.`);
        console.log(`${P_ERROR}Metaschema does not exist: ${P_END}${P_PATH}${oscalRootDirectory}/${metaSchema}${P_END}`);
      }
      });
    });
  } catch (error) {
    console.error(error.message);
  }
}
