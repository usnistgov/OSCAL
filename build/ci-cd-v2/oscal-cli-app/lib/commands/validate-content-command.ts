'use strict'

import {validateContent} from '../modules/validate-content-mod';

export const command = 'validate-content'
export const desc = 'Usage: oscalcli validate-content [schema] [config-file] [options]'
//export const desc = 'Usage: oscalcli validate-content [artifact-dir] [option1] [option2] [artifacts] [option3] [oscal-dir]'
export const builder = {
    'oscal-dir': {
        type: 'string',
        alias: 'o',
        describe: 'Directory where schemas are located',
        demand: false
    },
    verbose: {
        type: 'boolean',
        alias: 'v',
        describe: 'Provide verbose output',
        demand: false
    },
    'config-file': {
        type: 'string',
        alias: 'c',
        describe: 'The config file location',
        demand: false
    },
    'artifact-dir': {
        type: 'string',
        alias: 'a',
        describe: 'Build source artifact are stored in this location',
        demand: false
    }
}
export const handler = function (argv: any) {
    const {a: artifactDir, o: oscalDir, v: verbose, _} = argv;
    const configPaths = _.slice(1)
    validateContent(configPaths, artifactDir, oscalDir, verbose);
}
