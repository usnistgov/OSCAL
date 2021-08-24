import  { minifyJson  } from '../modules/minify-json-mod'
import { variablesProcessor } from '../modules';
import { argv } from 'yargs';

export const command = 'minify-json'
exports.desc = 'Usage: oscalcli minify-json [configs] [options]'
exports.builder = {
  outputFile: {
    type: 'string',
    alias: 'o',
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
  const {o, d} = argv
  minifyJson (path, o, d)
}
