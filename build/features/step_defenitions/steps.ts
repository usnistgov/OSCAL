import { Given, Then, When } from "@cucumber/cucumber";
import { statSync } from 'fs';
import { resolve } from 'path';
import {execSync} from "child_process"
Given('the following directories by type:', function(dataTable:any) {
  this.dirsByType = {};
  dataTable.rows().forEach(([type, paths]:any) => {
    this.dirsByType[type] = paths.split(',');
  });
});

Given('the OSCAL CLI tool is installed', async function() {
  const success=execSync(`npx oscal-cli --version`)

  if (!success) throw new Error('OSCAL CLI not installed');
});

Given('the metaschema directory is {string}', function(dir) {
  this.metaschemaDir = dir;
});

When('I validate {string} content in {string}',{timeout:90000}, async function(type, path) {
  const metaschema = 'oscal_'+type+'_metaschema.xml';
  const metaschemaPath = `${this.metaschemaDir}/${metaschema}`;
  
  try {
    const output = execSync(`npx oscal-cli metaschema validate-content ${path} -m ${metaschemaPath}`, {
      stdio: 'pipe',
      encoding: 'utf-8'
    });
    this.result = { isValid: true, output };
  } catch (error:any) {
    this.result = { 
      isValid: false,
      error: error.message,
      stderr: error.stderr?.toString(),
      stdout: error.stdout?.toString()
    };
  }
 });

  Then('all validations should pass without errors', function() {
    if (!this.result.isValid) {
      throw new Error(`Validation failed:\n`+this.result.stderr);
    }
  });

