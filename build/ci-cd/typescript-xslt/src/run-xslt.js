#!/usr/bin/env node
// import * as SaxonJS from "../node_modules/saxon-js/SaxonJS2N.js";
var SaxonJS = require('SaxonJS');
var workingDir = process.cwd();
/*nameIn is a file named on the cl */
var nameIn = process.argv[2];
/*const sysPath: string = 'file:///C:/Users/wap1/source/repos/NodejsTestConsole/src'*/
/*
 * CL to compile hello-world.xsl as hello.sef.json
 * xslt3 - t - xsl: hello-world.xsl -export: hello.sef.json - nogo
*/
var sourceXML = workingDir + "/{nameIn}";
var xsltFile = 'hello-world.xsl';
var sefFile = 'hello.sef.json';
/*API docs: http://www.saxonica.com/saxon-js/documentation/index.html#!api/transform */
SaxonJS.transform({
    stylesheetFileName: sefFile,
    stylesheetBaseURI: xsltFile,
    sourceFileName: sourceXML,
    /*sourceText: helloString, - for testing */
    /*destination: "serialized",  - pick up from htmlout.principalResult */
    destination: "stdout"
});
/*console.log(htmlout.principalResult) - pick up serialized output*/
/*    .then(output) {
    response.writeHead(200, { 'Content-Type': 'application/xml' });
    response.write(output.principalResult);
    response.end();
});  */
