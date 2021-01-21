'use strict'

import  {convertFunction} from '../modules/generate-content-converters';

export const command = 'generate-converters'
export const desc = 'Usage: oscalcli generate-converters [metaschema paths] [options]'
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
    convertFunction(argv);
}
