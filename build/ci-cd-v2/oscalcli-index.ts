#!/usr/bin/env node
"use strict";

import { join } from 'path'
const yargs = require('yargs')

yargs
    .commandDir(join(__dirname, 'oscal-cli-app', 'lib', 'commands'))
    .alias('help', 'h')
    .demandCommand()
    //Restricts use of other options not defined in modules
    .strictOptions()
    .recommendCommands()
    //.strictCommands()
    .argv;