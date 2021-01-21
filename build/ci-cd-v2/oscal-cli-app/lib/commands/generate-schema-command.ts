'use strict'

import  {schemaFunction} from '../modules/generate-schema';

export const command = 'generate-schema'
export const desc = 'Usage: oscalcli generate-schema [metaschema paths] [options]'
export const builder = {
    working_dir: {
        alias: 'w',
        describe: 'Generate artifacts in DIR',
        demand: false
    },
    verbose: {
        alias: 'v',
        describe: 'Provide verbose output',
        demand: false
    }
}
export const handler = function (argv: any) {
    schemaFunction(argv);
}
