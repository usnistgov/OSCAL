'use strict'

import  {schemaFunction} from '../modules/generate-schema';

export const command = 'generate-schema'
export const desc = 'Usage: oscalcli command [options] [metaschema paths]'
export const builder = {
    working_dir: {
        alias: 'w',
        describe: 'Generate artifacts in DIR',
        demand: false
    },
    help: {
        alias: 'h',
        describe: 'Display help',
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
