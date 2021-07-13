'use strict'

import {argv} from 'yargs';
import {validateContent} from '../modules/validate-content-mod';
import {variablesProcessor} from '../modules';

export const command = 'validate-content'
export const desc = 'Usage: oscalcli validate-content [arg] [options]'
export const builder = {
	'artifactDir': {
		type: 'string',
		alias: 'a',
		describe: 'Build source artifacts are stored in this location',
		demand: false
	},
	'oscalDir': {
		type: 'string',
		alias: 'o',
		describe: 'Directory where OSCAL schemas are located',
		demand: false
	},
	'workingDir': {
    alias: 'w',
    describe: 'Directory where processed contents are located',
    demand: false
  },
	verbose: {
		type: 'boolean',
		alias: 'v',
		describe: 'Produce verbose output',
		demand: false,
		default: false,
	},
	model: {
		type: 'string',
		alias: 'm',
		describe: 'Artifact model',
		demand: false,
	},
}
export const handler = async () => {
	const {paths, format, model, WORKING_DIR, VERBOSE} = await variablesProcessor(argv);

	validateContent(paths, format, model, WORKING_DIR, VERBOSE);
}

