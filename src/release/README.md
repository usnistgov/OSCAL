# Using OSCAL

NIST developed the Open Security Controls Assessment Language (OSCAL) as a machine-readable data exchange format. It enables organizations to express and exchange detailed cybersecurity content in either Extensible Markup Language (XML) or JavaScript Object Notation (JSON).

NIST defined and governs the core OSCAL syntax, which includes cyber security content that is universal across industries and compliance regimes. NIST further designed OSCAL to be extended by other organizations to address industry-specific, compliance-specific, or organization-specific content. Please see the _Extending OSCAL_ section for more information.

## OSCAL Adoption

For OSCAL compliance, mechanisms interpreting or generating OSCAL content _must_ honor the core syntax described at [https://pages.nist.gov/OSCAL/docs/schemas/](https://pages.nist.gov/OSCAL/docs/schemas/).

While not mandatory, organizations adopting OSCAL are encouraged to use NIST-published validation and translation mechanisms. The validation mechanism ensures XML and JSON files are OSCAL-compliant, while the translation mechanism converts OSCAL content from either format to the other. An automated governance process enables NIST to ensure these mechanisms remain aligned with the latest OSCAL syntax.

## Standards

NIST makes validation and conversion mechanisms available using the following established standards:

|   | **OSCAL Syntax Validation**|
| --- | :---: |
| **XML** | XML Schema Definition Language (XSD) 1.1 <br /> [ [https://www.w3.org/TR/xmlschema11-1/ ](https://www.w3.org/TR/xmlschema11-1/ )] |
| **JSON** | JSON Schema, draft-07 <br /> [ [https://json-schema.org/](https://json-schema.org/) ] |

|    | **OSCAL File Conversion** |
| --- | :---: |
| **XML & JSON** | Extensible Stylesheet Language Transformation (XSLT) 3.0 <br /> [ [https://www.w3.org/TR/2017/REC-xslt-30-20170608/](https://www.w3.org/TR/2017/REC-xslt-30-20170608/)]<br /><br />XPath 3.1<br />[[https://www.w3.org/TR/xpath-31/](https://www.w3.org/TR/xpath-31/) ] |

**IMPORTANT** : XSLT 3.0 and XPath 3.1 are only required when using NIST published tools to convert OSCAL files between JSON and XML. Any version of XSLT or XPath may be used when transforming or querying OSCAL files for other reasons. Later versions offer more robust capabilities. There are several JSON query capabilities available, such as JSONPath [[https://restfulapi.net/json-jsonpath/](https://restfulapi.net/json-jsonpath/)]; however, no one capability has emerged as a clear standard as of this publication.

## Available Tools and Resources

There are many tools available to validate and manipulate XML and JSON content using these standards. This includes both open source and commercial tools, as well as standard capabilities available in many programming languages.

The following tools are used by the NIST OSCAL Team and are known to work with OSCAL. This is neither an exhaustive list of available tools, nor an endorsement. OSCAL adopters are encouraged to do their own research and select the resources that are best for their specific needs and budget. OSCAL adopters are also responsible for ensuring their compliance with any licensing requirements.

| **Tool** | **Commercial** | **Open-Source** | **NOTES** |
| :---: | :---: | :---: | :--- |
| **oXygen XML Editor** | Yes |   | [https://www.oxygenxml.com/](https://www.oxygenxml.com/)<br />A commercial tool with a graphical user interface for working with XML, XSLT, XSD and related capabilities. |
| **xmllint** |   | Yes | [http://xmlsoft.org/xmllint.html](http://xmlsoft.org/xmllint.html)<br />Linux-based open source tool for XML management and manipulation.<br />xmllint can be run on Windows with a Linux subsystem. |
| **Saxon-HE (Home Edition)** |   | Yes | [http://www.saxonica.com/](http://www.saxonica.com/)<br />Saxon-HE offers the latest XSLT processing, and is fully open-source without technical support.<br /><br />Saxon-HE is available via [SourceForge](https://sourceforge.net/projects/saxon/files/Saxon-HE/9.9/) and Maven. It supports XSLT 3.0 and XPath 3.1.Java and .NET modules are available, which can be run from the command line or integrated into applications.<br /><br />Saxonica also offers Saxon PE and EE versions, which are commercial products with technical support and redistribution rights. |
| **Another JSON Schema Validator (AJV)** |   | Yes | [https://ajv.js.org/](https://ajv.js.org/)<br />Java-based open source tool for validating JSON files are compliant with JSON schema files.|
| **node.js** |   | Yes | [https://nodejs.org](https://nodejs.org)<br />An asynchronous event driven JavaScript runtime, required to run AJV above.|
| **Document Object Model (DOM) (aka DOMDocument) ** |   | Yes | [https://www.w3.org/DOM/](https://www.w3.org/DOM/)<br />A standard object-oriented model for manipulating XML files, which is built into many modern programming languages.DOM can manipulate XML content. Most implementations can also perform OSCAL syntax validation using OSCAL-published XSD files; however. Unfortunately, most implementations can only process XSLT and XPath 1.0 transformations, which is insufficient to use OSCAL&#39;s XSLT 3.0-based transformation files. |

OSCAL Usage Examples
====================

The following examples demonstrate the use of OSCAL.

Syntax Validation
-----------------

This examples uses **xmllint** to perform validation of the XML syntax within an OSCAL file using a NIST-published [XML Schema file](https://github.com/usnistgov/OSCAL/tree/master/xml/schema). Each layer has its own XSD file for validation.

```
export schema="./oscal_catalog_schema.xsd"
export file="./catalog.xml"
xmllint --noout --schema schema file
```

This examples uses the **DOMDocument** model to perform validation of the XML syntax within an OSCAL file using a NIST-published [XML Schema file](https://github.com/usnistgov/OSCAL/tree/master/xml/schema). Each layer has its own XSD file for validation. (Example PHP code provided. Similar DOMDocument syntax is available in many popular programming languages, including VisualBasic/VBscript, PHP, and Python.)

```
// Enable user error handling
libxml_disable_entity_loader(false);
libxml_use_internal_errors(true);

$ns_alias = "oscal";
$oscal_schema_file = "c:\path\to\validation\file\oscal_catalog_schema.xsd";
$oscal_file = "c:\path\to\oscal\content\file\catalog.xml";

// Creates a memory object to handle the XML file
$oscal = new DOMDocument();
		
// Preserving white space is an option in the XML spec. 
// NOTE: Make sure this aligns with OSCAL's recommendation.
$oscal->preserveWhiteSpace = true; 
		
// Load the file and only proceed if there were no errors.
if (! $oscal->load($oscal_file) === false) { 

    // This just will let us see properly indented XML if we display it
    $oscal->formatOutput = true;		

    // OSCAL XML documents must have a namespace declared
    $ns = $oscal->documentElement->namespaceURI;

    if ($oscal->schemaValidate($oscal_schema_file)) {
        echo "ALL SYNTAX IS VALID!";
    } else {
        echo "SYNTAX VALIDATION ERRORS:";
        echo ("<br /><br />\n\n");
        $errors = libxml_get_errors();
        foreach ($errors as $error) {
            switch ($error->level) {
                case LIBXML_ERR_WARNING:
                    echo "Warning ";
                    break;
                case LIBXML_ERR_ERROR:
                    echo "Error ";
                    break;
                case LIBXML_ERR_FATAL:
                    echo "Fatal Error ";
                    break;
                }
                echo $error->code;
                echo ("<br />\n");
                echo $error->message;
                echo ("<br /><br />\n\n");
        }
        libxml_clear_errors();
    }
}

```

This examples uses **AJV** to perform validation of the **JSON** syntax within an OSCAL file using a NIST-published [JSON Schema file](https://github.com/usnistgov/OSCAL/tree/master/json/schema). Each layer has its own XSD file for validation.

```
export schema="./oscal_catalog_schema.xsd"
export file="./catalog.xml"
ajv validate -s $schema -d $file --extend-refs=true --verbose
```

Conversion
----------
This example uses Saxon HE to convert an OSCAL XML file to JSON using a NIST published [XML to JSON XSLT file](https://github.com/usnistgov/OSCAL/tree/master/json/convert).

```
@echo off
cls
REM Path and file name to Java processor
set javaprocessor="java"

REM Path and file name of XSLT processor .jar file
set xmlprocessor=".\saxon9he.jar"

REM Path and file name of NIST OSCAL XSLT Conversion File 
set xslfile=".\oscal-catalog-xml-to-json-converter.xsl"

%javaprocessor% -jar %xmlprocessor% -s:%1 -o:%2 -xsl:%xslfile% json-indent=yes
```

This example uses Saxon HE to convert an OSCAL JSON file to XML using a NIST-published [JSON to XML XSLT file](https://github.com/usnistgov/OSCAL/tree/master/xml/convert).

```
@echo off
cls
REM Path and file name to Java processor
set javaprocessor="java"

REM Path and file name of XML processor .jar file
set xmlprocessor=".\saxon9he.jar"

REM Path and file name of NIST OSCAL XSLT Conversion File
set xslfile=".\oscal-catalog-json-to-xml-converter.xsl"

REM JSON file is a runtime parameter to the XSLT processor

%javaprocessor% -jar %xmlprocessor% -o:"%2" -xsl:%xslfile% -lt  json-file="%1
```

# Extending OSCAL

OSCAL is designed to meet common cybersecurity information needs across multiple compliance regimes. It also provides organizations the ability to add information fields where OSCAL does not natively have an appropriate field. Always try to use a native OSCAL field first, and only extend OSCAL when no native syntax meets your organization&#39;s needs.

Extending OSCAL is accomplished through the use of &quot;prop&quot; and &quot;part&quot; elements. These may be added as child elements under any OSCAL element. &quot;prop&quot; should be used where there is one data item to represent, such as a title or date. &quot;part&quot; should be used where there is more than one piece of data that must be represented, such as an address containing street, city, state, and zip code.

Both &quot;prop&quot; and &quot;part&quot; have the following attributes available:

- @ns (required when extending OSCAL)
- @name (required when extending OSCAL)
- @class (optional –used to identify related part and prop elements)

Optionally, &quot;part&quot; elements may also use an @id attribute.

Tools that process OSCAL content are not required to interpret unrecognized OSCAL extensions; however, OSCAL-compliant tools much not modify or remove unrecognized extensions, unless there is a compelling reason to do so, such as data sensitivity.

### Best Practices and Recommendations for Extending OSCAL

Any organization that extends OSCAL should consistently assign @ns with a value that represents the organization, and then ensure each @name has a value that is unique. As a result, the combination of @ns and @name should always be unique and unambiguous, even when mixed with extensions from other organizations. @ns is required to ensure two different organizations can use the same value for @name without conflict.

For example, if FedRAMP and DoD both extend OSCAL, FedRAMP will ensure every &quot;part&quot; and &quot;prop&quot; added by FedRAMP has @ns=′fedramp′, while the DoD will ensure every &quot;part&quot; and &quot;prop&quot; added by DoD has @ns=′usdod′. If both FedRAMP and DoD need to add a status field for different reasons, there would be no conflict because:

- the FedRAMP extension would look like this:
\&lt;part ns=′fedramp′ name=′status′\&gt;Something FedRAMP Cares About\&lt;/part\&gt;
- while the DoD extension would look like this:
\&lt;part ns=′usdod′ name=′status′\&gt;Something DoD Cares About\&lt;/part\&gt;

Each organization is responsible for governance of their extensions, and is strongly encouraged to publish their extensions as standards to their user community. In the example above, FedRAMP is responsible for ensuring consistent use of @name values everyplace @ns=′fedramp′ exists. Similarly, DoD is responsible for ensuring consistent use of @name values everyplace @ns=′usdod′ exists.

# The OSCAL Roadmap
The most recent and complete OSCAL Roadmap is always available here:
[https://pages.nist.gov/OSCAL/learnmore/roadmap/](https://pages.nist.gov/OSCAL/learnmore/roadmap/)

# Future OSCAL Compatibility Commitment
The NIST OSCAL Team recognizes the impact of syntax changes to a complex emerging language, and takes care to minimize the impact of any necessary changes. Syntax will only change where there is a compelling need to do so. To the greatest extend practical, OSCAL files will be future compatible. 

Of course, NIST can not anticipate all issues or feedback. In rare cases, NIST may need to make exceptions to address a compelling issue. In these instances, NIST will do everything practical to minimize the impact to early adopters, and document any changes where impacts are unavoidable.

NIST encourages early adoption and feedback in the form of an issue posted to the NIST OSCAL GitHub page. If appropriate, we ask you add a comment to an [existing relevant issue](https://github.com/usnistgov/OSCAL/issues), and only create a new issue where no relevant issue exists. 

In general early adopters can count on the following, from the milestone release to the first official 1.0 release of OSCAL:
- All capabilities available in the milestone release will be available in the 1.0 release.
- Any data element modeled in the milestone release will be modeled in the 1.0 release. Typically with the same syntax. 
- Deferred features, such as cryptographic validation, will be implemented with minimal impact to the milestone release syntax. Most will be implemented as optional extensions with no impact to the milestone release.

Please direct any questions, comments, concerns, or kudos to [oscal@nist.gov](oscal@nist.gov) 