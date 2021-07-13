import fs from 'fs';
import {join} from 'path';
import {colorCodes} from '../utils/init';
const {P_END, P_INFO} = colorCodes

export const variablesProcessor = async (argv: any) => {
  try {
    //arguments passed from the CLI
    const {
      artifactDir,
      oscalDir,
      workingDir,
      model,
      verbose,
      resolveProfiles,
    } = argv;
    let configFile: string = argv._[1];

    if (configFile.substr(-1) === '/') {
      configFile = configFile.slice(0, -1); // remove ending "/" so we have this 'src/examples/catalog/xml/*.xml'
    }
    //Assign values to the following variables
    const projectRootDir = join(__dirname, '../../../../../');

    const OSCAL_DIR = oscalDir ? `${process.cwd()}/${oscalDir}` : projectRootDir;
    const WORKING_DIR = workingDir ? `${process.cwd()}/${workingDir}` : projectRootDir;
    const ARTIFACT_DIR = artifactDir ? join(__dirname, `../../../../../../${artifactDir}`) : projectRootDir;
    const RESOLVE_PROFILES = resolveProfiles;
    const VERBOSE = verbose;
    //setup the log header if verbose is true
    if (VERBOSE) {
      console.log(`${P_INFO}Using OSCAL directory:${P_END} ${OSCAL_DIR}`);
      console.log(`${P_INFO}Using artifact directory:${P_END} ${ARTIFACT_DIR}`);
      console.log(`${P_INFO}Using working directory:${P_END} ${WORKING_DIR}`);
    }

    const dotIndex = configFile.lastIndexOf('.');
    const fileExtension = configFile.substr(dotIndex + 1);

    const format = fileExtension === 'xml' ? 'xml' : 'json';
    const convertToFormat = format === 'xml' ? 'json' : 'xml';

    const paths: string[] = [];

    const pathGlobArray = configFile.split('/*');
    const [pathStart, pathEnd] = pathGlobArray;
    const files = pathEnd ? fs.readdirSync(`${ARTIFACT_DIR}/${pathStart}`).filter(file => file.endsWith(`${pathEnd}`))
      : [`${configFile.replace(/.*\//g, '')}`];

    files.forEach((file: string) => paths.push(`${ARTIFACT_DIR}/${pathStart}/${file}`));

    return {
      paths, // ['src/dir/smallFile_catalog.xml', 'src/dir/mediumFile_catalog.xml', 'src/dir/largeFile_catalog.xml']
      format, // 'xml'
      model, // 'catalog'
      convertToFormat, // []
      OSCAL_DIR,
      WORKING_DIR,
      ARTIFACT_DIR,
      VERBOSE,
      RESOLVE_PROFILES,
    };
  } catch (error) {
    throw error.message;
  }
}