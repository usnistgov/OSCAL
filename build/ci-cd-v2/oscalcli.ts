#!/usr/bin/env node
process.cwd();

import yargs from 'yargs';
import {spawnSync} from 'child_process';
import {join} from 'path';

const {argv} = yargs;

const scriptRunner = () => {
    let cliArguments: string[] = [];
    const command = argv._[0];
    const args = argv._.slice(1);
    cliArguments = cliArguments.concat(args);
    Object.keys(argv).forEach(key => {
        if (argv[key] && ['_', '$0'].indexOf(key) === -1){
            cliArguments = cliArguments.concat([`--${key}=${argv[key]}`]);
        }
    });

    const parseCliArguments = cliArguments.join(' ');
    const result = spawnSync(`node ${join(__dirname)}/${command}.js ${parseCliArguments}`, [], {shell: true, stdio: 'inherit'});
  
  if (!result || result.status === 1) {
      process.exit(1);
    }
  }
  
  yargs
    .command(
      'generate-schema',
      'Generate Oscal Schema',
      () => {
        return scriptRunner();
      }
     )
     .command(
      'generate-content-converters',
      'Generate Oscal Schema Content Converters',
      () => {
        return scriptRunner();
      }
     )
     .command(
      'validate-option',
      'Validate CLI Option',
      (cliOptions: any) => {
        cliOptions.option('help')
                  .option('verbose')
                  .option('w')
      },
      (result: any) => {
        if (result.w !== 'myDir') {
          console.log('Use the name "myDir" as the working directory')
        }
        else {
          console.log('Continue')
        }
      }
     )
     .command(
      '$0',
      'Oscal CLI Usage',
      () => {
        console.log(`
          Usage: oscalcli <command> [options]
        `)
      }
     )
    .argv