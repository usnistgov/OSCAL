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
import {populateConvert} from './populate-convert';

// Set console log colors
const P_INFO = '\x1b[37m\x1b[1m'; // White
const P_OK = '\x1b[32m\x1b[1m'; // Green
const P_PATH = '\x1b[50m'; // Faded white
const P_WARN = '\x1b[33m\x1b[1m'; // Yellow
const P_ERROR = '\x1b[31m\x1b[1m'; // Red
const P_END = '\x1b[0m'; // Reset

// Set the root project root directory
let oscalRootDirectory: any = path.join(__dirname, '../..');

// Create a message log to be used with stdout and stderr
const usage = () => `
  Usage: node ${argv.$0} [options] [metaschema paths]

  -h, --help                        Display help
  -w DIR, --working-dir DIR         Generate artifacts in DIR
  -v                                Provide verbose output
`;

// Get the options parsed through command line interface using argv from the yargs module
const optionsFromCLI = Object.keys(argv);
// Define an array of acceptable options, which optionsFromCLI will be compared with for validation
const options = ['_', '$0', 'v', 'w', 'working-dir', 'workingDir', 'h', 'help'];

// Compare options parsed from the command line with the acceptable options defined above
const optionDifference = optionsFromCLI.find((option) => !options.includes(option));

// If an unacceptable option or working directory option was parsed without a value, terminate the process as an error
// Note an option parsed without a value will assume a value of 'true'
if (optionDifference || argv['w'] === true || argv['working-dir'] === true) {
  console.log('Failed parsing options.');
  process.stderr.write(usage());
  process.exit(1);
}

// If the options includes the help option, terminate the process
if (optionsFromCLI.includes('h') || optionsFromCLI.includes('help')) {
  process.stdout.write(usage());
  process.exit(0);
}

try {
  let workingDirectory: any;

  // If working directory is defined and has a value
  if (argv['w'] || argv['working-dir']) {
    // Assign the directory to a variable
    const parsedWorkingDir = argv['w'] || argv['working-dir'];
    // Create the directory defined from the command line interface
    fs.mkdirSync(`${parsedWorkingDir}`, {recursive: true});
    // Assign the relative path of the working directory to a variable
    workingDirectory = `${process.cwd()}/${parsedWorkingDir}`;
  }

  // Get all files in the metaschema directory
  const sourceFiles = fs.readdirSync(`${oscalRootDirectory}/src/metaschema`);
  // // Get only files with xml extensions in the metaschema directory
  const getXMLSourceFiles = sourceFiles.filter((file) => file.endsWith('xml'));

  console.log('');
  console.log(`${P_INFO}Generating XML <-> JSON Content Converters${P_END}`);
  console.log(`${P_INFO}==========================================${P_END}`);

  // If '-v' option is parsed, the value will default to true. Assign the value to the 'verbose' variable
  const verbose: any = argv.v;

  if (verbose === true) {
    console.log(`${P_INFO}Using working directory:${P_END} ${P_PATH}${oscalRootDirectory}${P_END}`);
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
    // Each Metaschema path is read from the config
    const metaSchemaRelativePath = schemaPathWithFormat[0]; // src/metaschema/file1.xml
    // Split each metaschema path into an array
    const metaSchemaRelativePathArray = metaSchemaRelativePath.split('/');
    const lengthOfPathArray = metaSchemaRelativePathArray.length
    // Get metaschema file name
    const metaschemaFile = metaSchemaRelativePathArray[lengthOfPathArray - 1];
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
          return console.log(`${P_ERROR}Generating converter from '${P_END}${sourceFormat.toUpperCase()}${P_ERROR}' to '${P_END}${targetFormat.toUpperCase()}${P_ERROR}' is unsupported for '${P_END}${P_PATH}${metaSchemaRelativePath}${P_END}${P_ERROR}'${P_END}.`);
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

        // Assign the convert file path to a variable for reusability purpose
        const convertFile = `${format}/convert/${base}_${sourceFormat}-to-${targetFormat}-converter.xsl`

        // Check if the metaschama defined in the config exists as a file in the metaschema directory
        const metaSchemaExist = getXMLSourceFiles.includes(metaschemaFile);

        if (metaSchemaExist) {
          // If working directory is defined
          if (workingDirectory) {
            /*
              Create the convert files in the respective XML and JSON directories, relative to the defined working directory.
              The target files (XML and JSON schemas) will be created here
            */
            fs.openSync(`${workingDirectory}/${convertFile}`, 'w');
            // populate the convert files
            populateConvert(oscalRootDirectory, workingDirectory, format, metaschemaFile, convertFile, verbose);
          } else { // If working directory is not defined
            /*
              Create the convert files in the respective XML and JSON directories, using project root directory as default.
              The target files will be created in the project root directory
            */
            fs.openSync(`${oscalRootDirectory}/${convertFile}`, 'w');
            // populate the schema files
            populateConvert(oscalRootDirectory, '', format, metaschemaFile, convertFile, verbose);
          }
        } else { // If metaschema does not exist
          console.log(`${P_ERROR}Metaschema does not exist: ${P_END}${P_PATH}${oscalRootDirectory}/${metaSchemaRelativePath}${P_END}`);
          console.log(`${P_ERROR}Generation of ${sourceFormat.toUpperCase()} to ${targetFormat.toUpperCase()} converter failed for '${P_END}${P_PATH}${metaSchemaRelativePath}${P_END}${P_ERROR}'${P_END}.`);
        }
      });
    }
  });
} catch (error) {
  console.error(error.message);
}