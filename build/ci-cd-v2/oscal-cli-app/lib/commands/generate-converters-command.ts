'use strict'

import { convertersFunc } from '../modules/generate-converters-mod';

export const command = 'generate-converters'
export const desc = 'Usage: oscalcli generate-converters [metaschema paths] [options]'
export const builder = {
	'working-dir': {
		type: 'string',
		alias: 'w',
		describe: 'Generate artifacts in DIR',
		demand: false
	},
	verbose: {
		type: 'boolean',
		alias: 'v',
		describe: 'Provide verbose output',
		demand: false
	}
}
export const handler = function (argv: any) {
	convertersFunc(argv);
}
