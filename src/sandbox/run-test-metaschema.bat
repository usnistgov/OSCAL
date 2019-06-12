@echo off

rem Produces Metaschema artifacts from an OSCAL Metaschema metaschema
rem Including XML and JSON schemas, conversion utilities (XSLTs) and Markdown documentation

set METASCHEMAXML=oscal-test-metaschema.xml
set BASENAME=oscal-test

set OSCALDIR=../..

rem if [[ ! -v SAXON_HOME ]]; then
rem     echo "SAXON_HOME is not set"
rem     exit 1
rem elif [[ -z "$SAXON_HOME" ]]; then
rem     echo "SAXON_HOME is set to the empty string"
rem     exit 1
rem fi

set SAXON=C:\Users\wap1\Downloads\Saxon\saxon.jar

rem if [ ! -f $SAXON ]; then
rem     echo "The saxon library was not found at: $SAXON!"
rem     exit 1
rem fi

rem Saxon CL documented here: http://www.saxonica.com/documentation9.8/using-xsl/commandline.html

set LIBDIR=%OSCALDIR%/build/metaschema
set XSDDIR=.
set JSONDIR=.
set UTIL_DIR=%OSCALDIR%/util
set CONVERSION_DIR=.
set DOCSDIR=docs

set MAKE_XSD=java -jar %SAXON% -s:%METASCHEMAXML% -o:%XSDDIR%/%BASENAME%-schema.xsd -xsl:%LIBDIR%/xml/produce-xsd.xsl
set MAKE_JSC=java -jar %SAXON% -s:%METASCHEMAXML% -o:%JSONDIR%/%BASENAME%-schema.json -xsl:%LIBDIR%/json/produce-json-schema.xsl

set MAKE_XMLCONV=java -jar %SAXON% -s:%METASCHEMAXML% -o:%CONVERSION_DIR%/%BASENAME%-xml-converter.xsl -xsl:%LIBDIR%/xml/produce-xml-converter.xsl
set MAKE_JSONCONV=java -jar %SAXON% -s:%METASCHEMAXML% -o:%CONVERSION_DIR%/%BASENAME%-json-converter.xsl  -xsl:%LIBDIR%/json/produce-json-converter.xsl


set XMLDOCS_XSLT=java -jar %SAXON% -s:%METASCHEMAXML% -o:%LIBDIR%/temp/%BASENAME%-xml-docs-md.xsl -xsl:%LIBDIR%/xml/produce-xml-documentor.xsl
set DOC_XML=java -jar %SAXON% -s:%METASCHEMAXML% -o:%DOCSDIR%/%BASENAME%_xml.md -xsl:%LIBDIR%/temp/%BASENAME%-xml-docs-md.xsl

set JSONDOCS_XSLT=java -jar %SAXON% -s:%METASCHEMAXML% -o:%LIBDIR%/temp/%BASENAME%-json-docs-md.xsl -xsl:%LIBDIR%/json/produce-json-documentor.xsl example-converter-xslt-path=%CONVERSION_DIR%/%BASENAME%-xml-converter.xsl
set DOC_JSON=java -jar %SAXON% -s:%METASCHEMAXML% -o:%DOCSDIR%/%BASENAME%_json.md -xsl:%LIBDIR%/temp/%BASENAME%-json-docs-md.xsl example-converter-xslt-path=oscal-test-xml-converter.xsl


rem set NEWDOC_XML=java -jar %SAXON% -s:%METASCHEMAXML% -o:%DOCSDIR%/%BASENAME%_2_xml.md -xsl:%LIBDIR%/xml/produce-and-run-xml-documentor.xsl

echo Now ...
echo.

@echo on
rem echo Producing JSON and XML schemas and tools from %METASCHEMAXML% ...
rem echo
%MAKE_XSD%
echo _ Made XSD ________________________ %XSDDIR%/%BASENAME%-schema.xsd
%MAKE_JSC%
echo _ Made JSON Schema ________________ %JSONDIR%/%BASENAME%-schema.json
%MAKE_XMLCONV%
echo _ Made XML-to-JSON converter ______ %CONVERSION_DIR%/%BASENAME%-xml-converter.xsl
%MAKE_JSONCONV%
echo _ Made JSON-to-XML converter ______ %CONVERSION_DIR%/%BASENAME%-json-converter.xsl


%XMLDOCS_XSLT%
%DOC_XML%

%JSONDOCS_XSLT%
%DOC_JSON%
echo _ Made XML and JSON documentation _ %DOCSDIR%/%BASENAME%_xml.md %DOCSDIR%/%BASENAME%_json.md
echo.
