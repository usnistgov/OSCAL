'use strict'

const {validateSchema} = require('../modules/validate-schema-mod');

export const command = 'validate-schema'
export const desc = 'Usage: oscalcli validate-schema [schemaFile] [options]'
export const builder = {
  'working_dir': {
    alias: 'w',
    describe: 'Directory where schema is located',
    demand: false
  },
}
export const handler = function (argv: any) {
  const {w: workingDir} = argv;
  const schemaFile = argv._[1];

  validateSchema('', schemaFile, workingDir);
}
