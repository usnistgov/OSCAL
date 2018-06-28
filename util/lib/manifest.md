

#### framework-enhance.xsl

XSLT stylesheet version 3.0 (2 templates)

Purpose: Enhances OSCAL tagging with *purported* links by performing lookups in a catalog and rewriting the links as resolved. A demonstration.

Runtime parameter `catalog-path` as xs:string

Runtime parameter `frameworkURI` as xs:string

Runtime parameter `key-property` as xs:string

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

#### directory-manifest.xsl

XSLT stylesheet version 3.0 (12 templates)

Runtime parameter `dirpath` as xs:string

#### literalizer.xsl

XSLT stylesheet version 3.0 (3 templates)

#### oscal-functions.xsl

XSLT stylesheet version 2.0 (0 templates)

#### OSCAL-finalize.xsl

XSLT stylesheet version 3.0 (3 templates)

Runtime parameter `xslt-process` as xs:string

#### manifest-reorder.xsl

XSLT stylesheet version 3.0 (2 templates)

#### produce-directory-manifest.xpl

XProc pipeline version 1.0 (3 steps)

Runtime dependency: `directory-manifest.xsl`

Runtime dependency: `manifest-reorder.xsl`

Runtime dependency: `html-to-markdown.xsl`

#### utility.xq

#### make-xslt.xq