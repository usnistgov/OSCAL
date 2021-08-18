import  { minifyJson  } from '../modules/minify-json-mod'
import { variablesProcessor } from '../modules';
import { argv } from 'yargs';

export const command = 'minify-json'
exports.desc = 'Usage: oscalcli minify-json [configs]'
exports.builder = {
  outputFile: {
    type: 'string',
    alias: 'f',
    describe: 'Minified File',
    demand: true,
  },
  dir: {
    type: 'string',
    alias: 'd',
    describe: 'Directory for Minified JSON',
    demand: false,
  }
}
export const handler = async () => {
  //calls the Entry Function
  const {path} = await variablesProcessor(argv);
  const {f, d} = argv
  minifyJson (path, f, d)
}
