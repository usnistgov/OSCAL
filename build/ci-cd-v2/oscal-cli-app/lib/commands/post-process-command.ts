import { post_process_content } from '../modules/post-process-mod'
import { variablesProcessor } from '../modules';
import { argv } from 'yargs';
import { Console } from 'console';

export const command = 'post-process-content'
exports.desc = 'Usage: oscalcli post-process-content [configs] [options]'
exports.builder = {
  'workingDir': {
    alias: 'w',
    describe: 'Directory where processed contents are located',
    demand: false
  },
  'oscalDir': {
    alias: 'o',
    describe: 'Project root directory',
    demand: false
  },
  verbose: {
    alias: 'v',
    describe: 'Provide verbose output',
    demand: false,
    type: 'boolean',
    default: false
  },
  resolveProfiles: {
    describe: 'Provide verbose output',
    demand: false,
    type: 'boolean'
  },
  'artifactDir': {
    type: 'string',
    alias: 'a',
    describe: 'Source artifacts are stored here',
    demand: false
  },
  
}

export const handler = async () => {
  //calls the Entry Function
  const {
   // formats,
  // conversion_formats,
    paths,
    WORKING_DIR,
    OSCAL_DIR,
    VERBOSE,
   // models, // array containing one element
  } = await variablesProcessor(argv);
  
  console.log(
  //  formats[0],
  //  conversion_formats[0],
    paths[0],
  //  models[0],
    WORKING_DIR,
    OSCAL_DIR,
    VERBOSE,
  );

}
 