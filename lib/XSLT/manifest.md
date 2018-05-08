

#### framework-enhance.xsl

XSLT stylesheet version 3.0 (2 templates)

Purpose: Enhances OSCAL tagging with *purported* links by performing lookups in a catalog and rewriting the links as resolved. A demonstration.

Runtime parameter `catalog-path` as xs:string

Runtime parameter `frameworkURI` as xs:string

Runtime parameter `key-property` as xs:string

#### profile-resolver.xsl

XSLT stylesheet version 3.0 (32 templates)

Purpose: from OSCAL profile input, produce a representation of all controls called with insertions, alterations, modifications and settings applied.

Dependencies: working links to valid control catalogs in OSCAL XML.

#### profile-basic-display.xsl

XSLT stylesheet version 1.0 (1 template)

Compile-time dependency (xsl:import) `oscal-basic-display.xsl`

#### generic-filter-by-prop.xsl

XSLT stylesheet version 3.0 (1 template)

Compile-time dependency (xsl:include) `oscal-functions.xsl`

Runtime parameter `selector` as xs:string

Runtime parameter `value` as xs:string

#### oscal-write-declarations.xsl

XSLT stylesheet version 3.0 (5 templates)

#### oscal-digest.xsl

XSLT stylesheet version 2.0 (4 templates)

#### html-to-markdown.xsl

XSLT stylesheet version 3.0 (18 templates)

#### literalizer.xsl

XSLT stylesheet version 3.0 (3 templates)

#### oscal-functions.xsl

XSLT stylesheet version 2.0 (0 templates)

#### OSCAL-finalize.xsl

XSLT stylesheet version 3.0 (3 templates)

Runtime parameter `xslt-process` as xs:string

#### cast-JSON-to-XML/OpenControl/param-insert.xsl

XSLT stylesheet version 3.0 (3 templates)

Compile-time dependency (xsl:import) `../lib/XSLT/profile-resolver.xsl`

Runtime parameter `resource-file` as xs:string

#### cast-JSON-to-XML/OpenControl/json-reader.xsl

XSLT stylesheet version 3.0 (1 template)

Runtime parameter `json-file` as xs:string

#### cast-JSON-to-XML/OpenControl/map-refine.xsl

XSLT stylesheet version 3.0 (18 templates)

#### cast-JSON-to-XML/OpenControl/index-to-catalog.xsl

XSLT stylesheet version 3.0 (3 templates)

Compile-time dependency (xsl:import) `../lib/XSLT/profile-resolver.xsl`

Runtime parameter `resource-file` as xs:string

#### cast-JSON-to-XML/OpenControl/analysis.xsl

XSLT stylesheet version 3.0 (1 template)

Runtime parameter `json-file` 

#### cast-JSON-to-XML/OpenControl/enhance.xsl

XSLT stylesheet version 3.0 (9 templates)

#### cast-JSON-to-XML/OpenControl/json-abstract-map.xsl

XSLT stylesheet version 3.0 (2 templates)

#### cast-XML-to-JSON/oscal-json-write.xsl

XSLT stylesheet version 3.0 (1 template)

Compile-time dependency (xsl:import) `oscal-json-map.xsl`

#### cast-XML-to-JSON/oscal-json-map.xsl

XSLT stylesheet version 3.0 (35 templates)

#### cast-XML-to-JSON/tinkering.xsl

XSLT stylesheet version 3.0 (1 template)

#### cast-XML-to-JSON/json-write.xsl

XSLT stylesheet version 3.0 (1 template)

#### cast-XML-to-JSON/analysis/json-reader.xsl

XSLT stylesheet version 3.0 (1 template)

Runtime parameter `json-file` as xs:string

#### cast-XML-to-JSON/analysis/json-abstract-map.xsl

XSLT stylesheet version 3.0 (2 templates)

#### HTML/oscal-browser-display.xsl

XSLT stylesheet version 1.0 (60 templates)

#### HTML/oscal-for-bootstrap-html.xsl

XSLT stylesheet version 1.0 (84 templates)

#### HTML/oscal-basic-display.xsl

XSLT stylesheet version 1.0 (29 templates)

#### HTML/html-finalize.xsl

XSLT stylesheet version 3.0 (2 templates)

Runtime parameter `xslt-process` as xs:string

#### HTML/oscal-with-nav-display.xsl

XSLT stylesheet version 1.0 (71 templates)

#### XSL-FO/OSCAL-simple-fo.xsl

XSLT stylesheet version 2.0 (22 templates)

#### cast-JSON-to-XML/OpenControl/acquire-JSON.xpl

XProc pipeline version 1.0 (8 steps)

Runtime dependency: `../lib/XSLT/profile-resolver.xsl`

Runtime dependency: `json-reader.xsl`

Runtime dependency: `json-abstract-map.xsl`

Runtime dependency: `map-refine.xsl`

Runtime dependency: `enhance.xsl`

Runtime dependency: `index-to-catalog.xsl`

Runtime dependency: `param-insert.xsl`

Runtime dependency: `analysis.xsl`

#### cast-XML-to-JSON/jsonify-oscal-xml.xpl

XProc pipeline version 1.0 (3 steps)

Purpose: From XML OSCAL, produces equivalent JSON OSCAL.

Input: OSCAL XML

Output: JSON rendition of same (*except*)

Runtime dependency: `oscal-json-map.xsl`

XSLT stylesheet version 3.0 (1 template)

#### cast-XML-to-JSON/analysis/acquire-JSON.xpl

XProc pipeline version 1.0 (2 steps)

Runtime dependency: `json-reader.xsl`

Runtime dependency: `json-abstract-map.xsl`

#### cast-JSON-to-XML/

#### cast-XML-to-JSON/

#### HTML/

#### XSL-FO/

#### cast-JSON-to-XML/OpenControl/

#### cast-XML-to-JSON/fragment.xml

#### cast-XML-to-JSON/dino-profile-temp.xml

#### cast-XML-to-JSON/SP800-53-3controls-json.xml

#### cast-XML-to-JSON/json-sample.xml

#### cast-XML-to-JSON/31-patched-messy-target.xml

#### cast-XML-to-JSON/SP800-53-3controls.xml

#### cast-XML-to-JSON/xpath-xml-to-json.sh

#### cast-XML-to-JSON/oscal-xml-to-json.sh

#### cast-XML-to-JSON/SP800-53-3controls.json

#### cast-XML-to-JSON/analysis/fragment.json

#### cast-XML-to-JSON/analysis/

#### cast-XML-to-JSON/analysis/xml-json.xsd

#### HTML/oscal-html-fancy.css