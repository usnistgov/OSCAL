#!/usr/bin/env node
"use strict";

import { join } from 'path'
import yargs from 'yargs'

yargs
    .commandDir(join(__dirname, 'oscal-cli-app', 'lib', 'commands'))
    .alias('help', 'h')
    .demandCommand()
    .strict()
    .argv;