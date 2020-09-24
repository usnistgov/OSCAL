/*
  Allow JS file to run from anywhere by targeting the script relative path.
  Files and Directories are created using the 'file location' as the reference point
*/
//process.chdir(__dirname);

/*
  Allow JS file to run from anywhere by targeting the script relative path.
  Files and Directories are created using the 'current working directory' as the reference point
*/
process.cwd();

import fs from 'fs';
import path from 'path';
import {argv} from 'yargs';
import {populateConvert} from './utils/populate-convert-v2';
import {colorCodes, setupCliInputs, createWorkingDir} from './utils/init'

// Set the root project root directory
let oscalRootDirectory: any = path.join(__dirname, '../..');

// initialize the setup script
setupCliInputs(oscalRootDirectory, argv);

try {
  let workingDirectory: any;

  // If working directory is defined and has a value
  if (argv['w'] || argv['working-dir']) {
    // Assign the relative path of the working directory to a variable
    workingDirectory = createWorkingDir(argv, fs)
  }

  console.log('');
  console.log(`${colorCodes.P_INFO}Generating XML <-> JSON Content Converters${colorCodes.P_END}`);
  console.log(`${colorCodes.P_INFO}==========================================${colorCodes.P_END}`);

  // If '-v' option is parsed, the value will default to true. Assign the value to the 'verbose' variable
  const verbose: any = argv.v;

  if (verbose === true) {
    console.log(`${colorCodes.P_INFO}Using working directory:${colorCodes.P_END} ${colorCodes.P_PATH}${oscalRootDirectory}${colorCodes.P_END}`);
  }

  // Get an array of arguments parsed from command line interface (the args should be the configs)
  let metaSchemaArray: string[];
  const readConfigFilesFromCLI = argv._;

  // Establish which metaschema to process, either: the command line argument or the config file
  if (readConfigFilesFromCLI.length) {
    // if a metaschema is provided as a command line argument, use it
    metaSchemaArray = readConfigFilesFromCLI.map((metaschemaPath: string) => `${metaschemaPath}|xml,json|xml,json`);
  } else {
    // Locate the config file using relative path from the project root directory
    const configFile = `${oscalRootDirectory}/build/ci-cd-v2/config/config-file`;
    // Read the config file to get it's content
    const readConfigFile = fs.readFileSync(configFile, 'utf8');
    // Convert readConfigFile to string. Replace comments with an empty string. Convert readConfigFile to an array. Then remove all empty strings
    metaSchemaArray = readConfigFile.toString().replace(/#.*\s/g, '').split('\n').filter(Boolean);
  }

  metaSchemaArray.forEach((schema) => {
    const schemaPathWithFormat = schema.split('|');
    // Each Metaschema path read from the config
    const metaSchemaFullPath = schemaPathWithFormat[0];
    // Split each metaschema path into an array
    const metaSchemaFullPathArray = metaSchemaFullPath.split('/');
    const lengthOfPathArray = metaSchemaFullPathArray.length
    // Get metaschema file name
    const metaschemaFile = metaSchemaFullPathArray[lengthOfPathArray - 1];
    // Get the root directory of the metaschema
    const metaschemaFileRootDir = metaSchemaFullPathArray.slice(0, lengthOfPathArray - 1).join('/');
    // Get the base of each metaschema file from the metaschema file name
    const base = metaschemaFile.replace(/(_metaschema).*/g, '');

    // The third element after splitting at the '|' is the schema formats to be used for convert files
    const convertOptions = schemaPathWithFormat[2];


    if (convertOptions) {
      // Split each formats at the comma sign to create an array of format to be used for schema generation in each iteration
      const convertArray = convertOptions.split(',');

      convertArray.forEach((format, index, convertFormats) => {
        let sourceFormat: string;
        let targetFormat: string;

        if (index === 0) {
          sourceFormat = convertFormats[1]
          targetFormat = convertFormats[0]
        } else {
          sourceFormat = convertFormats[0]
          targetFormat = convertFormats[1]
        }

        // Define an array of valid formats to be used for validation purpose
        const validFormats = ['xml', 'json'];

        if (!validFormats.includes(format)) {
          return console.log(`${colorCodes.P_ERROR}Generating converter from '${colorCodes.P_END}${sourceFormat.toUpperCase()}${colorCodes.P_ERROR}' to '${colorCodes.P_END}${targetFormat.toUpperCase()}${colorCodes.P_ERROR}' is unsupported for '${colorCodes.P_END}${colorCodes.P_PATH}${metaSchemaFullPath}${colorCodes.P_END}${colorCodes.P_ERROR}'${colorCodes.P_END}.`);
        }

        /*
          Create the schema directories.
          Recursive option helps to create a new folder inside a non-existing folder.
          It also helps to update only target files in the created directory if the directory already existed.
          Recursive only works for node 10^
        */
        if (workingDirectory) {
          fs.mkdirSync(`${workingDirectory}/${format}/convert`, {recursive: true});
        } else {
          fs.mkdirSync(`${oscalRootDirectory}/${format}/convert`, {recursive: true});
        }

        // Assign the schema file path to a variable for reusability purpose
        const convertFile = `${format}/convert/${base}_${sourceFormat}-to-${targetFormat}.xsl`

        // Get all files in the metaschema directory
        const sourceFiles = fs.readdirSync(`${oscalRootDirectory}/${metaschemaFileRootDir}`);
        // Get only files with xml extensions in the metaschema directory
        const getXMLSourceFiles = sourceFiles.filter((file) => file.endsWith('xml'));

        // Check if the metaschame defined in the config exists as a file in the metaschema directory
        const metaSchemaExist = getXMLSourceFiles.includes(metaschemaFile);

        if (metaSchemaExist) {
          // If working directory is defined
          if (workingDirectory) {
            /*
              Create the schema files in the respective XML and JSON directories, relative to the defined working directory.
              The target files (XML and JSON schemas) will be created here
            */
            fs.openSync(`${workingDirectory}/${convertFile}`, 'w');
            // populate the schema files
            populateConvert(oscalRootDirectory, workingDirectory, metaschemaFileRootDir, format, metaschemaFile, convertFile, verbose);
          } else { // If working directory is not defined
            /*
              Create the schema files in the respective XML and JSON directories, using project root directory as default.
              The target files will be created in the project root directory
            */
            fs.openSync(`${oscalRootDirectory}/${convertFile}`, 'w');
            // populate the schema files
            populateConvert(oscalRootDirectory, '', metaschemaFileRootDir, format, metaschemaFile, convertFile, verbose);
          }
        } else { // If metaschema does not exist
          console.log(`${colorCodes.P_ERROR}Metaschema does not exist: ${colorCodes.P_END}${colorCodes.P_PATH}${oscalRootDirectory}/${metaSchemaFullPath}${colorCodes.P_END}`);
          console.log(`${colorCodes.P_ERROR}Generation of ${sourceFormat.toUpperCase()} to ${targetFormat.toUpperCase()} converter failed for '${colorCodes.P_END}${colorCodes.P_PATH}${metaSchemaFullPath}${colorCodes.P_END}${colorCodes.P_ERROR}'${colorCodes.P_END}.`);
        }
      });
    }
  });
} catch (error) {
  console.error(error.message);
}
