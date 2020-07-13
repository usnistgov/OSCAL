import fs from 'fs';
import path from 'path'
import {populateSchema} from './populate-schema';

// set the current working directory 
const oscalRootDirectory = path.join(__dirname, '../..');

// locate the config file
const configFile = `${oscalRootDirectory}/build/ci-cd-v2/config/config-file`;

try {
  // reads the config file
  const readConfigFile = fs.readFileSync(configFile, 'utf8');

  // replace comments with empty string and convert readConfigFile to an array. Then remove empty strings
  const arrayOfConfigFile = readConfigFile.toString().replace(/#.*\s/g, '').split('\n').filter(Boolean);

  arrayOfConfigFile.forEach((schema) => {
    const schemaPathFormatConverterDocArray = schema.split('|');
    // path to meta schemas
    const metaSchemaPath = schemaPathFormatConverterDocArray[0]
    const metaSchemaPathArray = metaSchemaPath.split('/');
    // get the base file
    const base = metaSchemaPathArray[metaSchemaPathArray.length - 1].replace(/(_metaschema).*/g, '');
    const formatOptions = schemaPathFormatConverterDocArray[1];
    const convertOptions = schemaPathFormatConverterDocArray[2];

    //console.log('BASE:', base);

    if (formatOptions) {
      const formatArray = formatOptions.split(',');
      let convertArray: any;

      if (convertOptions) {
        // Conditional to check whether the convert pipe contains xml. If yes, use xsd as the extension for the file to be created in xml folder
        convertArray = convertOptions.includes('xml') ? convertOptions.replace(/xml/g, 'xsd').split(',')
                                                    : convertOptions.split(',');
      }

      formatArray.forEach((format, index, arr) => {
        // create the schema directories. recursive option helps to create a folder inside and folder. This only works for node 10^
        fs.mkdirSync(`${oscalRootDirectory}/${format}/schema`, {recursive: true});
        fs.mkdirSync(`${oscalRootDirectory}/${format}/convert`, {recursive: true});

        // create the schema files in the created directories
        fs.openSync(`${oscalRootDirectory}/${format}/schema/${base}_schema.${convertArray[index]}`, 'w');

        // console.log('HERE')
        // fsSystem();

      /* if (convertOptions) {
          // Conditional to create a convert file in a target folder.
          index === 0 ? fs.openSync(`${oscalRootDirectory}/${format}/convert/${base}_${arr[1]}-to-${arr[0]}-converter.xsl`, 'w')
                      : fs.openSync(`${oscalRootDirectory}/${format}/convert/${base}_${arr[0]}-to-${arr[1]}-converter.xsl`, 'w');
        }*/

        // populate the schema files
        populateSchema(oscalRootDirectory, format, base);
      });
    }
  }); 
} catch (error) {
  console.error(error.message)
}

