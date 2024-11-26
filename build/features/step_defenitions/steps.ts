import { Given, Then, When } from "@cucumber/cucumber";
import { formatSarifOutput, isOscalExecutorInstalled } from 'oscal';
import { validateDirectory, validateDocument } from "oscal/dist/validate";
import {statSync} from 'fs'
import {resolve} from 'path'
Given('the following directories by type:', function(dataTable:any) {
  this.dirsByType = {};
  dataTable.rows().forEach(([type, paths]:any) => {
    this.dirsByType[type] = paths.split(',');
  });
});

Given('the OSCAL CLI tool is installed', async function() {
  const success = await isOscalExecutorInstalled("oscal-cli");
  if (!success) throw new Error('OSCAL CLI not installed');
});

Given('the metaschema directory is {string}', function(dir) {
  this.metaschemaDir = dir;
});

When('I validate {string} content in {string}',{timeout:90000}, async function(type, path) {

  const metaschema = 'oscal_'+type+'_metaschema.xml' ;
  const metaschemaPath = `${this.metaschemaDir}/${metaschema}`;
 // Check if path is directory
 const isDirectory = path.includes("http")?false:statSync(path).isDirectory();
 const quiet = false;
 this.result = isDirectory ? 
   await validateDirectory(path, {module: resolve(metaschemaPath),quiet}, 'oscal-cli') :
   await validateDocument(path, {module: resolve(metaschemaPath),quiet}, 'oscal-cli');
});
Then('all validations should pass without errors', function() {
  if (!this.result.isValid) {
    throw new Error(`Validation failed: ${formatSarifOutput(this.result.log).replace(/\u001b\[[0-9;]*m/g, '')}`);
  }
});

