import  { fileConverter } from '../modules/convert-format-mod'
import { variablesProcessor } from '../modules';
import { argv, string } from 'yargs';

export const command = 'convert-format'
exports.desc = 'Usage: oscalcli convert-format [configs] [options]'
exports.builder = {
    outputFormat: {
        type: 'string',
        alias: 'output',
        describe: 'Converted File',
        demand: true,
    }
}
    
export const handler = async () => {
  //calls the Entry Function
    const {path} = await variablesProcessor(argv);
    const {outputFormat} = argv
fileConverter(path, outputFormat)
}
  