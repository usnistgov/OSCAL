import {spawnSync} from 'child_process';

export const populateConvert = (
  oscalRootDirectory: string,
  generatedConvertsDirectory: string,
  format: string,
  metaschemaFile: string,
  convertFile: string,
  verbose: boolean
) => {
  try {
    /*
      If generatedConvertsDirectory (working directory) is specified for schema generation, then use it as the working directory.
      This is where the target files will reside.
      If generatedConvertsDirectory is undefined or is an empty string, then use the root directory to create the target files
    */
    const workingDirectory = generatedConvertsDirectory ? generatedConvertsDirectory : oscalRootDirectory

    // Check whether script is specified to run in verbose mode
    const runMode: string = verbose === true ? '-v' : ''

    const validFormats = ['xml', 'json']
    let sourceFormat: string;
    let targetFormat: string;

    if (format === validFormats[0]) {
      sourceFormat = validFormats[1]
      targetFormat = validFormats[0]
    } else {
      sourceFormat = validFormats[0]
      targetFormat = validFormats[1]
    }

    // First setup the command line arguments for this script
    const scriptArguments = [
      `--source-format ${sourceFormat}`,
      `--target-format ${targetFormat}`,
      `${oscalRootDirectory}/src/metaschema/${metaschemaFile}`,
      `${workingDirectory}/${convertFile}`,
      `${runMode}`
    ];

    // spawnSync('command', ['arg1', 'arg2', 'arg3'], spawn_option)
    const result = spawnSync(`${oscalRootDirectory}/build/metaschema/scripts/generate-content-converter.sh`, scriptArguments, {shell: true, stdio: 'inherit'});
    if (!result || result.status === 1) {
      // If status === 1, then an error ocurred. Exit the process with the exit code of 1
      process.exit(1);
    }
  } catch (error) {
      console.error(error.message);
      process.exit(1);
  }
}