import fs from 'fs';
import {colorCodes} from '../utils/init'
import {join} from 'path';
import * as SAXONJS from 'saxon-js/saxonJS2N.js'

const {P_INFO, P_END, P_ERROR, P_OK, P_PATH, P_WARN,} = colorCodes

export const convertersFunc = (argv: any) => {
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
    console.log(`${P_INFO}Generating XML <-> JSON Content Converters${P_END}`);
    console.log(`${P_INFO}==========================================${P_END}`);

    const verbose: any = argv.v;

    if (verbose === true) {
      console.log(`${P_INFO}Using working directory:${P_END} ${P_PATH}${oscalRootDirectory}${P_END}`);
    }

    const metaSchemaArray = argv._.slice(1);

    if (!metaSchemaArray.length) {
      console.error(`${P_ERROR}You must specify the Metaschema to generate the converter for.${P_END}`);
      process.exit(1);
    }
   
    metaSchemaArray.forEach((metaschema: any) => {
      const [metaschemaFile] = metaschema.split('/').slice(-1);
      const metaschemaFileRootDir = 'src/metaschema'
      // Get the base of each metaschema file from the metaschema file name
      const base = metaschemaFile.replace(/(_metaschema).*/g, '');
      const validFormats = ['xml', 'json'];

      validFormats.forEach(async(format) => {
        // if format is xml then target is json else target is xml
        const sourceFormat = format === 'xml' ? 'json' : 'xml';
        // if format is json then target is xml else target is json
        const targetFormat = format === 'xml' ? 'xml' : 'json';

        /*
          Create the schema directories.
          Recursive option helps to create a new folder inside a non-existing folder.
          It also helps to update only target files in the created directory if the directory already existed.
          Recursive only works for node 10^
        */
        fs.mkdirSync(`${schemaRootDir}/${format}/convert`, {recursive: true});

        // Assign the schema file path to a variable for reusability purpose
        const convertFile = `${format}/convert/${base}_${sourceFormat}-to-${targetFormat}-converter.xsl`;

        // Get all files in the metaschema directory
        const sourceFiles = fs.readdirSync(`${oscalRootDirectory}/${metaschemaFileRootDir}`);
        // Get only files with xml extensions in the metaschema directory
        const getXMLSourceFiles = sourceFiles.filter((file) => file.endsWith('xml'));

        // Check if the metaschema passed via CLI exists as a file in the metaschema directory
        const metaSchemaExist = getXMLSourceFiles.includes(metaschemaFile);

        if (metaSchemaExist) {
          /*
            Create the schema files in the respective XML and JSON directories, relative to the working directory.
            The target files (XML and JSON schemas) will be created here
          */
          fs.openSync(`${schemaRootDir}/${convertFile}`, 'w');
   
          const PROVIDER_RESOURCE_DIR = `${oscalRootDirectory}/build/metaschema/toolchains/xslt-M4`;

         try {
          //const stylesheetFileName = `${PROVIDER_RESOURCE_DIR}/nist-metaschema-MAKE-${sourceFormat.toUpperCase()}-TO-${targetFormat.toUpperCase()}-CONVERTER.sef.json` 
          //const stylesheetBaseURI = `${PROVIDER_RESOURCE_DIR}/nist-metaschema-MAKE-${sourceFormat.toUpperCase()}-TO-${targetFormat.toUpperCase()}-CONVERTER.xsl`

          const stylesheetFileName = `${PROVIDER_RESOURCE_DIR}/mini-test.sef.json`
          const stylesheetBaseURI = `${PROVIDER_RESOURCE_DIR}/mini-test.xsl`

          const sourceFileName =  `${oscalRootDirectory}/${metaschemaFileRootDir}/${metaschemaFile}`
            if (verbose === true){
              console.log(`${P_INFO}Generating ${sourceFormat.toUpperCase()} to ${targetFormat.toUpperCase()} converter for '${P_END}${metaschema}${P_INFO}' as '${P_END}${convertFile}${P_INFO}'.${P_END}`)
            }
           const result = await SAXONJS.transform({
             stylesheetFileName,
             sourceFileName,
             stylesheetBaseURI,
             destination: "serialized"
           },'async')
           
           fs.writeFileSync(`${schemaRootDir}/${convertFile}`, result.principalResult)

          console.log(`${P_OK}Generated ${sourceFormat.toUpperCase()} to ${targetFormat.toUpperCase()} converter for '${P_END}${metaschema}${P_OK}' as '${P_END}${convertFile}${P_INFO}'.${P_END}`)
 

         } catch (error) {
           console.log(error.message)
           process.exit(1)
           
         }

        } else { // If metaschema does not exist
          console.log(`${P_ERROR}Metaschema does not exist: ${P_END}${P_PATH}${oscalRootDirectory}/${metaschema}${P_END}`);
          console.log(`${P_ERROR}Generation of ${sourceFormat.toUpperCase()} to ${targetFormat.toUpperCase()} converter failed for '${P_END}${P_PATH}${metaschema}${P_END}${P_ERROR}'${P_END}.`);
        }
      });
    });
  } catch (error) {
    console.error(error.message);
  }
}
