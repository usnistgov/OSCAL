import  { minifyJson  } from '../modules/minify-json-mod'
import { variablesProcessor } from '../modules';
import { argv } from 'yargs';

export const command = 'minify-json'
exports.desc = 'Usage: oscalcli minify-json [configs]'
exports.builder = {
  // outputFormat: {
  //   type: 'string',
  //   alias: 'output',
  //   describe: 'Minified File',
  //   demand: true,
  // }
}
export const handler = async () => {
  //calls the Entry Function
  const {path} = await variablesProcessor(argv);
  //const {outputFormat} = argv
  minifyJson (path)
}
