import {spawnSync} from 'child_process';
import fs from 'fs';

export const populateSchema = (
  oscalRootDirectory: string,
  generatedSchemaDirectory: string,
  metaschemaFileRootDir: string,
  format: string,
  base: string,
  verbose: boolean
) => {
  try {
     /*
      If generatedSchemaDirectory (working directory) is specified for schema generation, then use it as the working directory.
      This is where the target files will reside.
      If generatedSchemaDirectory is undefined or is an empty string, then use the root directory to create the target files
    */
    const workingDirectory = generatedSchemaDirectory ? generatedSchemaDirectory : oscalRootDirectory;

    // check whether script is specified to run in verbose mode
    const runMode: string = verbose === true ? '-v' : '';

    // create an array of the target files
    const targetFiles = fs.readdirSync(`${workingDirectory}/${format}/schema`);
    // create an array of the source files
    const sourceFiles = fs.readdirSync(`${oscalRootDirectory}/${metaschemaFileRootDir}`);

    // Get only files with xml extensions in the metaschema directory
    const getXMLSourceFiles = sourceFiles.filter(file => file.endsWith('xml'));

    // Get files with name ending with the base that is in use at the current iteration
    const source = getXMLSourceFiles.find(file => file.startsWith(base));
    const target = targetFiles.find(file => file.startsWith(base));

    // ['--format', 'source', 'target', '--validate']
    if (source && target) {
      // First, setup the commandline arguments for this script
      const scriptArguments = [
        `--${format}`,
        `${oscalRootDirectory}/${metaschemaFileRootDir}/${source}`,
        `${workingDirectory}/${format}/schema/${target}`,
        '--validate',
        `${runMode}`
      ];

      // spawnSync('command', ['arg1', 'arg2', 'arg3'], spawn_option)
      const result = spawnSync(`${oscalRootDirectory}/build/metaschema/scripts/generate-schema.sh`, scriptArguments, {shell: true, stdio: 'inherit'});
      if (!result || result.status === 1) {
        // If status === 1, then an error ocurred. Exit the process with the exit code of 1
        process.exit(1);
      }
    }
  } catch (error) {
      console.error(error.message);
      process.exit(1);
  }
}