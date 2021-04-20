'use strict'

import { boolean } from 'yargs'
import {generateSchema} from '../modules/generate-schema-mod'

export const command = 'generate-schema'
export const desc = 'Usage: oscalcli generate-schema [metaschema paths] [options]'
export const builder = {
    'working-dir': {
        alias: 'w',
        describe: 'Generate artifacts in DIR',
        demand: false
    },
    verbose: {
        type: 'boolean',
        alias: 'v',
        describe: 'Provide verbose output',
        demand: false
    },
    validate: {
        type: 'boolean',
        describe: 'Provide verbose output',
        demand: false
    }
}
export const handler = function (argv: any) {
    generateSchema(argv);
}
