#!/usr/bin/env node

import * as SaxonJS from "saxon-js/SaxonJS2N.js";

/*nameIn is a file named on the cl */
const process = require('process')
const nameIn: string = process.argv[2]

const implementationDir = '../../toolchains/xslt-M4'

/*
 * CL to compile hello-world.xsl as hello.sef.json
 * xslt3 -t -xsl:hello-world.xsl -export:hello.sef.json - nogo
*/

interface TransformRuntime {
    sourceFile: string;
    sefFile: string;
    xsltBase: string;
}

function locateFile(fileResource: string) {
    [implementationDir, fileResource].join('/')
 }

function executeTransform(runtime: TransformRuntime) {
    SaxonJS.transform({
        stylesheetFileName: locateFile(runtime.sefFile),
        stylesheetBaseURI: locateFile(runtime.xsltBase),
        sourceFileName: runtime.sourceFile,
        destination: "stdout",
        /*sourceText: helloString, - for testing */
        /*destination: "serialized",  - pick up from htmlout.principalResult */
        /* to write to file:
         * destination: "file",
         * baseOutputURI: resultFile*/
    })
}

let generateXSD = {
    sourceFile: nameIn,
    sefFile: 'SEF/make-xsd-sef.json',
    xsltBase: 'nist-metaschema-MAKE-XSD.xsl'
}

executeTransform( generateXSD )

/*let resultFile: string = [sysPath, 'result.xml'].join('/')*/

/*API docs: http://www.saxonica.com/saxon-js/documentation/index.html#!api/transform */


/*console.log(htmlout.principalResult) - pick up serialized output*/

/*    .then(output) {
    response.writeHead(200, { 'Content-Type': 'application/xml' });
    response.write(output.principalResult);
    response.end();
});  */

/*let message: string = "Hello World"
console.log(message)*/