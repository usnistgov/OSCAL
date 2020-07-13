import {spawnSync} from 'child_process';
import fs from 'fs';

export const populateSchema = (oscalRootDirectory: string, format: string, base: string) => {
  try {
    const targetFiles = fs.readdirSync(`${oscalRootDirectory}/${format}/schema`)
    const sourceFiles = fs.readdirSync(`${oscalRootDirectory}/src/metaschema`)

    const getXMLSourceFiles = sourceFiles.filter(file => file.endsWith('xml'));

    //console.log('TARGET_FILES', targetFiles);
      
    const source = getXMLSourceFiles.find(file => file.startsWith(base));
    const target = targetFiles.find(file => file.startsWith(base));

    //console.log('SOURCE_FILE', source);
    //console.log('TARGET_FILE', target);

    if (source && target) {
      // ['--format', 'source', 'target', '--validate']
      const scriptArguments = [
        `--${format}`,
        `${oscalRootDirectory}/src/metaschema/${source}`,
        `${oscalRootDirectory}/${format}/schema/${target}`,
        '--validate'
      ]

      //console.log('scriptArguments:', scriptArguments)

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