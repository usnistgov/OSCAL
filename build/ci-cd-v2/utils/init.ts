import {basename} from "path"
// Set console log colors
const colorCodes = {
    P_INFO: '\x1b[37m\x1b[1m', // White
    P_OK: '\x1b[32m\x1b[1m', // Green
    P_PATH: '\x1b[50m', // Faded white
    P_WARN: '\x1b[33m\x1b[1m', // Yellow
    P_ERROR: '\x1b[31m\x1b[1m', // Red
    P_END: '\x1b[0m', // Reset
  }
  
 const setupCliInputs = (rootDir: string, argv: any) => {
    // Create a message log to be used with stdout and stderr
    const usage = () => `
      Usage: oscalcli ${basename(argv.$0).replace(".js","")} [options] [metaschema paths]
  
      -h, --help                        Display help
      -w DIR, --working-dir DIR         Generate artifacts in DIR (default: ${rootDir})
      -v                                Provide verbose output
    `;
  
    // Get the options parsed through command line interface using argv from the yargs module
    const optionsFromCLI = Object.keys(argv);
    // Define an array of acceptable options, which optionsFromCLI will be compared with for validation
    const options = ['_', '$0', 'v', 'w', 'working-dir', 'workingDir', 'h', 'help'];
  
    // Compare options parsed from command line with the acceptable options defined above
    const optionDifference = optionsFromCLI.find((option) => !options.includes(option));
  
    // If there is an unacceptable option or working directory option was parsed without a value, terminate the process as error
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
  }
  
  const createWorkingDir = (argv: any, fileSystem: any) => {
    // Assign the directory to a variable
    const parsedWorkingDir = argv['w'] || argv['working-dir'];
    // Create the directory defined from the command line interface
    fileSystem.mkdirSync(`${parsedWorkingDir}`, {recursive: true});
    // Assign the relative path of the working directory to a variable
    return `${process.cwd()}/${parsedWorkingDir}`;
  }
  
  export {
    colorCodes,
    setupCliInputs,
    createWorkingDir
  }