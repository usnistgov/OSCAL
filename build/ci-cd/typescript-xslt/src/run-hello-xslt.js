"use strict";
exports.__esModule = true;
var SaxonJS = require("saxon-js/SaxonJS2N.js");
var workingDir = process.cwd();
/*let xslt = 'hello-world.xsl'*/
/* const sysPath: string = 'file:///C:/Users/wap1/source/repos/NodejsTestConsole/src' */
var helloXML = workingDir + "/hello-world.xml";
var xsltFile = workingDir + "/hello-world.xsl";
var sefFile = workingDir + "/hello.sef.json";
console.log(workingDir);
/*let resultFile: URL = 'file:///C:/Users/wap1/source/repos/NodejsTestConsole/src/hello.html'*/
/*API docs: http://www.saxonica.com/saxon-js/documentation/index.html#!api/transform */
SaxonJS.transform({
    stylesheetLocation: sefFile,
    stylesheetBaseURI: xsltFile,
    sourceLocation: helloXML,
    sourceFileName: helloXML,
    destination: "stdout"
});
/*console.log(htmlout.principalResult)*/
/*    .then(output) {
    response.writeHead(200, { 'Content-Type': 'application/xml' });
    response.write(output.principalResult);
    response.end();
});  */
/*let message: string = "Hello World"
console.log(message)*/ 
