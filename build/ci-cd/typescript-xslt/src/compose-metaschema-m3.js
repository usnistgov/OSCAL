#!/usr/bin/env node
"use strict";
exports.__esModule = true;
var SaxonJS = require("../node_modules/saxon-js/SaxonJS2N.js");
//const SaxonJS = require('SaxonJS');
var workingDir = process.cwd();
/*nameIn is a file named on the cl */
var nameIn = process.argv[2];
/*
 * CL to compile hello-world.xsl as hello.sef.json
 * xslt3 - t - xsl: hello-world.xsl -export: hello.sef.json - nogo
*/
/* we should not be using variables for this, but instead looking these values up
   in some sort of maintainable configuration perhaps via a Typescript interface object
*/
var sourceFile = workingDir + "/" + nameIn;
// is there any better way to trim ".xml" off the end of a string? using a regex here
var resultFile = sourceFile.replace(/\.xml$/, '') + '_composed.xml';
// this will be passed as the source location of the XSLT for internal use
var composeXSLTFile = 'xslt/metaschema-m3-compose.xsl';
// the same resource compiled as SEF, in this directory
var composeSEFFile = 'metaschema-m3-compose.sef.json';
/*API docs: http://www.saxonica.com/saxon-js/documentation/index.html#!api/transform */
SaxonJS.transform({
    stylesheetFileName: composeSEFFile,
    stylesheetBaseURI: composeXSLTFile,
    sourceFileName: sourceFile,
    /*sourceText: helloString, - for testing */
    /*destination: "serialized",  - pick up from htmlout.principalResult */
    destination: "file",
    baseOutputURI: resultFile
});
/*console.log(htmlout.principalResult) - pick up serialized output*/
/*    .then(output) {
    response.writeHead(200, { 'Content-Type': 'application/xml' });
    response.write(output.principalResult);
    response.end();
});  */
