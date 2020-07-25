//allow to run js file from anywhere using the path where the script file is located
//process.chdir(__dirname);
//allow to run js script processes from the current workingDirectory and creates files in the current directory
process.cwd();

import fs from 'fs';
import path from 'path'
import {argv} from 'yargs'
import {populateSchema} from './populate-schema';

// set console log colors
const P_INFO = '\x1b[37m\x1b[1m'; // White
const P_OK = '\x1b[32m\x1b[1m' // Green
const P_PATH = '\x1b[50m'; // Faded white
const P_WARN = '\x1b[33m\x1b[1m'; // Yellow
const P_ERROR = '\x1b[31m\x1b[1m' // Red
const P_END = '\x1b[0m'; // Reset

// Setup the commandline argument parsing via yargs argv
const optionsFromCLI = Object.keys(argv)
const options = ['_', '$0', 'v', 'w', 'working-dir', 'workingDir', 'h', 'help']

// set the current working directory
let oscalRootDirectory: any = path.join(__dirname, '../..');

const usage = () => `
  Usage: node ${argv.$0} [options] [metaschema paths]

  -h, --help                        Display help
  -w DIR, --working-dir DIR         Generate artifacts in DIR  (default: ${oscalRootDirectory})
  -v                                Provide verbose output
`;

const optionDifference = optionsFromCLI.find(option => !options.includes(option))

if (optionDifference || argv['w'] === true || argv['working-dir'] === true) {
  // unknown option
  // const invalid = optionDifference.length === 1 ? `-${optionDifference}` : `--${optionDifference}`
  // console.log(`${P_ERROR}Unhandled option: ${invalid}${P_END}`)
  console.log('Failed parsing options.')
  process.stdout.write(usage());
  process.exit(1)
}

if (optionsFromCLI.includes('h') || optionsFromCLI.includes('help')) {
  process.stderr.write(usage())
  process.exit(0)
}

try {
  let workingDirectory: any;

  if (argv['w'] || argv['working-dir']) { // any directory name that is specified
    const parsedWorkingDir = argv['w'] || argv['working-dir']
   // const currentDirectory = path.join(__dirname, '.')
    // set the working directory
    fs.mkdirSync(`${parsedWorkingDir}`,{recursive: true});
    workingDirectory = `${process.cwd()}/${parsedWorkingDir}`
    //workingDirectory = fs.mkdirSync(`${currentDirectory}/${parsedWorkingDir}`);
   console.log('Show Current Directory', process.cwd())
    console.log('Show Working Directory', workingDirectory)
    console.log('Show parsedWorkingDir', parsedWorkingDir)
  }

  // Read the metaschema directory
  const sourceFiles = fs.readdirSync(`${oscalRootDirectory}/src/metaschema`)

  // get only files with xml extensions in the metaschema directory
  const getXMLSourceFiles = sourceFiles.filter(file => file.endsWith('xml'));

  console.log('')
  console.log(`${P_INFO}Generating XML and JSON Schema${P_END}`)
  console.log(`${P_INFO}==============================${P_END}`)

  // if verbose, have the generation script generate verbose messages
  const verbose: any = argv.v

  if (verbose === true) {
    console.log(`${P_INFO}Using working directory:${P_END} ${P_PATH}${oscalRootDirectory}${P_END}`)
  }

  // Establish which metaschema to process, either: the commandline argument or the config file
  let metaSchemaArray: string[];
  const readConfigFilesFromCLI = argv._

  if (readConfigFilesFromCLI.length) {
    // if a metaschema is provided as a commandline argument, use it
    metaSchemaArray = readConfigFilesFromCLI.map((metaschemaPath: string) => `${metaschemaPath}|xml,json`)
  } else {
    // locate the config file
    const configFile = `${oscalRootDirectory}/build/ci-cd-v2/config/config-file`;
    // use the paths defined in the config file
    const readConfigFile = fs.readFileSync(configFile, 'utf8');
    // replace comments with empty string and convert readConfigFile to an array. Then remove empty strings
    metaSchemaArray = readConfigFile.toString().replace(/#.*\s/g, '').split('\n').filter(Boolean);
  }

  metaSchemaArray.forEach((schema) => {
    const schemaPathWithFormat = schema.split('|');
    // path to metaschemas files
    const metaSchemaPath = schemaPathWithFormat[0]
    const metaSchemaPathArray = metaSchemaPath.split('/');
    // get metaschema file
    const metaschemaFile = metaSchemaPathArray[metaSchemaPathArray.length - 1]
    // get the base of each metaschema file
    const base = metaschemaFile.replace(/(_metaschema).*/g, '');
    const formatOptions = schemaPathWithFormat[1];

    if (formatOptions) {
      // split on commas to determine which schema to generate and iterate
      const formatArray = formatOptions.split(',');

      formatArray.forEach((format) => {
        const validFormats = ['xml', 'json'];

        if (!validFormats.includes(format)) {
          return console.log(`${P_WARN}Unsupported schema format '${format.toUpperCase()}' schema for '${P_PATH}${metaSchemaPath}${P_END}${P_WARN}'${P_END}.`)
        }

        let fileExtension = format;

        if (format === 'xml') {
          fileExtension = 'xsd'
        }
        // create the schema directories. recursive option helps to create a folder within a folder. This only works for node 10^
        if (workingDirectory) {
          fs.mkdirSync(`${workingDirectory}/${format}/schema`, {recursive: true});
        } else {
          fs.mkdirSync(`${oscalRootDirectory}/${format}/schema`, {recursive: true});
        }

        const schemaFile = `${format}/schema/${base}_schema.${fileExtension}`

        if (verbose === true) {
          console.log('')
          console.log(`${P_INFO}Generating ${format.toUpperCase()} schema for '${P_END}${P_PATH}${metaSchemaPath}${P_END}' as '${P_PATH}${schemaFile}${P_END}'.`)
        }

        const metaSchemaExist = getXMLSourceFiles.includes(metaschemaFile);

        if (metaSchemaExist) {
          if (workingDirectory) {
            // create the schema files in the respective XML and JSON directories
            fs.openSync(`${workingDirectory}/${schemaFile}`, 'w');
            // populate the schema files
            populateSchema(oscalRootDirectory, workingDirectory, format, base, verbose);
          } else {
            // create the schema files in the respective XML and JSON directories
            fs.openSync(`${oscalRootDirectory}/${schemaFile}`, 'w');
            // populate the schema files
            populateSchema(oscalRootDirectory, '', format, base, verbose);
          }

          // console.log(`${P_OK}Schema validation passed for '${P_END}${P_PATH}${oscalRootDirectory}/${schemaFile}${P_END}${P_OK}'${P_END}.`)
          if (verbose === true) {
            console.log(`${P_OK}Generation of ${format.toUpperCase()} schema passed for '${P_END}${P_PATH}${metaSchemaPath}${P_END}${P_OK}'${P_END}.`)
          }
        } else {
          console.log(`${P_ERROR}Generation of ${format.toUpperCase()} schema failed for '${P_END}${P_PATH}${metaSchemaPath}${P_END}${P_ERROR}'${P_END}.`)
          console.log(`${P_ERROR}Metaschema does not exist: ${P_END}${P_PATH}${oscalRootDirectory}/${metaSchemaPath}${P_END}`)
        }
      });
    }
  });
} catch (error) {
  console.error(error.message);
}
