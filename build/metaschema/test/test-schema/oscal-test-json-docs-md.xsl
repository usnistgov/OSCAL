<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/2005/xpath-functions"
                xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
                version="3.0"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes" method="text" use-character-maps="delimiters"/>
   <!-- METASCHEMA docs production -->
   <!-- XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX -->
   <xsl:import href="file:/home/wendell/Documents/OSCAL/build/metaschema/test/test-schema/oscal-test-xml-converter.xsl"/>
   <xsl:import href="metaschema-json-html.xsl"/>
   <xsl:output method="text"/>
   <xsl:param name="json-file" as="xs:string?" select="()"/>
   <xsl:param name="json-indent" as="xs:string">yes</xsl:param>
   <xsl:template match="/">
      <xsl:variable name="html">
         <xsl:apply-imports/>
      </xsl:variable>
      <xsl:apply-templates select="$html" mode="md"/>
   </xsl:template>
   <xsl:template match="m:example">
      <div class="example">
         <xsl:variable name="json-xml">
            <xsl:apply-templates select="* except m:*" mode="xml2json"/>
         </xsl:variable>
         <xsl:variable name="rectified">
            <xsl:apply-templates select="$json-xml" mode="rectify"/>
         </xsl:variable>
         <xsl:apply-templates select="m:description"/>
         <pre class="json">
            <xsl:value-of select="xml-to-json($rectified,$write-options)"/>
         </pre>
         <xsl:apply-templates select="m:remarks"/>
      </div>
   </xsl:template>
   <!-- XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX -->FAKEUP Testing Schemaoscal-testA test schema for prototyping and demonstrating the metaschema feature set.BaseWrapper for other stuffThe kit can have all kinds of Things.feature set for testing (schemas):
          enforcement of addressability constraints (distinctiveness of values)feature set for conversions: 'succinct JSON'; mapping nodes to element types in collapsed syntax.Also to do: find a case of variability in controls and show it off... parts?BaseWrapper for other stuffA thing can be whatever: flags, fields of various sorts mixed and not, and assemblies.
        Also the various sorts of addressing should be demonstrated. The model described should be demonstrated in companion instances (XML and JSON), which can in turn be used as targets for mutual conversion.RequiredMixed content? here be content?Single string (required)As it saysAn example in a remote documentSingle stringAs it saysSingle string but with mixed contentAs it saysA single occurrence of a plural (ha)As it saysOnly one plural, but possibly mixed.As it saysChunkAs it saysChunk among chunksAs it saysOne ChoiceAs it saysAnother ChoiceAs it saysA string flagAs it saysAn IDAs it says</xsl:stylesheet>
