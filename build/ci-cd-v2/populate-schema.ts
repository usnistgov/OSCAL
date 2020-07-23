import {spawnSync} from 'child_process';
import fs from 'fs';

export const populateSchema = (oscalRootDirectory: string, generatedSchemaDirectory: string, format: string, base: string, verbose: boolean) => {
  try {
    // if directory is specified for schema generation, then use it as the working directory, This is where the target files will reside.
    const workingDirectory = generatedSchemaDirectory ? generatedSchemaDirectory : oscalRootDirectory

    // check whether script is specified to run in verbose mode
    const runMode: string = verbose === true ? '-v' : ''

    // create an array of the target files
    const targetFiles = fs.readdirSync(`${workingDirectory}/${format}/schema`)
    // create an array of the source files
    const sourceFiles = fs.readdirSync(`${oscalRootDirectory}/src/metaschema`)

    // get only files with xml extensions in the metaschema directory
    const getXMLSourceFiles = sourceFiles.filter(file => file.endsWith('xml'));

    const source = getXMLSourceFiles.find(file => file.startsWith(base));
    const target = targetFiles.find(file => file.startsWith(base));

    // console.log('SOURCE_FILE', source);
    // console.log('TARGET_FILE', target);

    // ['--format', 'source', 'target', '--validate']
    if (source && target) {
      // We need to call the script that does the actual schema generation
      // first setup the commandline arguments for this script

      const scriptArguments = [
        `--${format}`,
        `${oscalRootDirectory}/src/metaschema/${source}`,
        `${workingDirectory}/${format}/schema/${target}`,
        '--validate',
        `${runMode}`
      ]

      // console.log('scriptArguments:', scriptArguments)

      // spawnSync('command', ['arg1', 'arg2', 'arg3'], spawn_option)
      const result = spawnSync(`${oscalRootDirectory}/build/metaschema/scripts/generate-schema.sh`, scriptArguments, {shell: true, stdio: 'inherit'});
      if (!result || result.status === 1) {
        process.exit(1);
      }
    }
  } catch (error) {
      console.error(error);
      process.exit(1);
  }
}
