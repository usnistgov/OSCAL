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
import {populateSchema} from './populate-schema';

// set console log colors
const P_INFO = '\x1b[37m\x1b[1m'; // White
const P_OK = '\x1b[32m\x1b[1m'; // Green
const P_PATH = '\x1b[50m'; // Faded white
const P_WARN = '\x1b[33m\x1b[1m'; // Yellow
const P_ERROR = '\x1b[31m\x1b[1m'; // Red
const P_END = '\x1b[0m'; // Reset

// Get the options parsed through command line interface using argv from the yargs module
const optionsFromCLI = Object.keys(argv);
// Define an array of acceptable options, which optionsFromCLI will be compared with for validation
const options = ['_', '$0', 'v', 'w', 'working-dir', 'workingDir', 'h', 'help'];

// Set the root project root directory
let oscalRootDirectory: any = path.join(__dirname, '../..');

// Create a message log to be used with stdout and stderr
const usage = () => `
  Usage: node ${argv.$0} [options] [metaschema paths]

  -h, --help                        Display help
  -w DIR, --working-dir DIR         Generate artifacts in DIR  (default: ${oscalRootDirectory})
  -v                                Provide verbose output
`;

// Compare options parsed from command line with the acceptable options defined above
const optionDifference = optionsFromCLI.find(option => !options.includes(option));

// If there is an un-acceptable option or working directory option was parsed without a value, terminate the process as error
// Note an option parsed without a value will assume a value of 'true'
if (optionDifference || argv['w'] === true || argv['working-dir'] === true) {
  console.log('Failed parsing options.');
  process.stdout.write(usage());
  process.exit(1);
}

// If the options includes the help option, terminate the process
if (optionsFromCLI.includes('h') || optionsFromCLI.includes('help')) {
  process.stderr.write(usage());
  process.exit(0);
}

try {
  let workingDirectory: any;

  // If working directory is defined and has a value
  if (argv['w'] || argv['working-dir']) { // any directory name that is specified
    // Assign the directory to a variable
    const parsedWorkingDir = argv['w'] || argv['working-dir'];
    // Create the directory defined from the command line interface
    fs.mkdirSync(`${parsedWorkingDir}`,{recursive: true});
    // Assign the relative path of the working directory to a variable
    workingDirectory = `${process.cwd()}/${parsedWorkingDir}`;
   }

  // Get all files in the metaschema directory
  const sourceFiles = fs.readdirSync(`${oscalRootDirectory}/src/metaschema`);
  // Get only files with xml extensions in the metaschema directory
  const getXMLSourceFiles = sourceFiles.filter(file => file.endsWith('xml'));

  console.log('')
  console.log(`${P_INFO}Generating XML and JSON Schema${P_END}`)
  console.log(`${P_INFO}==============================${P_END}`)

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
    // if a metaschema is provided as a commandline argument, use it
    metaSchemaArray = readConfigFilesFromCLI.map((metaschemaPath: string) => `${metaschemaPath}|xml,json`);
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
    // Read the path for Each Metaschema from the config
    const metaSchemaPath = schemaPathWithFormat[0];
    // Split each metaschema path into an array
    const metaSchemaPathArray = metaSchemaPath.split('/');
    // Get metaschema file name
    const metaschemaFile = metaSchemaPathArray[metaSchemaPathArray.length - 1];
    // Get the base of each metaschema file from the metaschema file name
    const base = metaschemaFile.replace(/(_metaschema).*/g, '');

    // The second element after splitting at the '|' is the schema formats
    const formatOptions = schemaPathWithFormat[1];
   
    if (formatOptions) {
      // Split each formats at the comma sign to create an array of format to be used for schema generation in each iteration
      const formatArray = formatOptions.split(',');

      formatArray.forEach((format) => {
        // Define an array of valid formats to be used for validation purpose
        const validFormats = ['xml', 'json'];

        if (!validFormats.includes(format)) {
          return console.log(`${P_WARN}Unsupported schema format '${format.toUpperCase()}' schema for '${P_PATH}${metaSchemaPath}${P_END}${P_WARN}'${P_END}.`);
        }

        let fileExtension = format;
        // File extension defaults to the format currently in use for iteration. If xml is the current format, the use xsd
        if (format === 'xml') {
          fileExtension = 'xsd';
        }
        /*
          Create the schema directories. 
          Recursive option helps to create a new folder inside a non-existing folder. 
          It also helps to update only target files in the created directory if the directory already existed. 
          Recursive only works for node 10^
        */
        if (workingDirectory) {
          fs.mkdirSync(`${workingDirectory}/${format}/schema`, {recursive: true});
        } else {
          fs.mkdirSync(`${oscalRootDirectory}/${format}/schema`, {recursive: true});
        }

        // Assign the schema file path to a variable for reusability purpose
        const schemaFile = `${format}/schema/${base}_schema.${fileExtension}`;

        if (verbose === true) {
          console.log('');
          console.log(`${P_INFO}Generating ${format.toUpperCase()} schema for '${P_END}${P_PATH}${metaSchemaPath}${P_END}' as '${P_PATH}${schemaFile}${P_END}'.`);
        }

        // Check if the metaschame defined in the config exists as a file in the metaschema directory (these are the source files)
        const metaSchemaExist = getXMLSourceFiles.includes(metaschemaFile);

        if (metaSchemaExist) {
          // If working directory is defined 
          if (workingDirectory) {
            /*
              Create the schema files in the respective XML and JSON directories, relative to the defined working directory.
              The target files (XML and JSON schemas) will be created here
            */
            fs.openSync(`${workingDirectory}/${schemaFile}`, 'w');
            // populate the schema files
            populateSchema(oscalRootDirectory, workingDirectory, format, base, verbose);
          } else {
            /*
              Create the schema files in the respective XML and JSON directories, using project root directory as default.
              The target files will be created in the project root directory
            */
            fs.openSync(`${oscalRootDirectory}/${schemaFile}`, 'w');
            // populate the schema files
            populateSchema(oscalRootDirectory, '', format, base, verbose);
          }

          if (verbose === true) {
            console.log(`${P_OK}Generation of ${format.toUpperCase()} schema passed for '${P_END}${P_PATH}${metaSchemaPath}${P_END}${P_OK}'${P_END}.`);
          }
        } else { // If metaschema does not exist
          console.log(`${P_ERROR}Generation of ${format.toUpperCase()} schema failed for '${P_END}${P_PATH}${metaSchemaPath}${P_END}${P_ERROR}'${P_END}.`);
          console.log(`${P_ERROR}Metaschema does not exist: ${P_END}${P_PATH}${oscalRootDirectory}/${metaSchemaPath}${P_END}`);
        }
      });
    }
  });
} catch (error) {
  console.error(error.message);
}
