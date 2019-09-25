<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    exclude-result-prefixes="xs math m"
    version="3.0">
    
<!-- 
        
        Not to be used standalone, this XSLT is called by produce-xsd.xsl and produce-json-schema.xsl
    
    it depends on declarations for $root-name and for key('definitions-by-name') -->
    
    <xsl:output indent="yes"/>
    
    <xsl:strip-space elements="METASCHEMA define-flag define-field define-assembly remarks model choice"/>
    
    <xsl:variable name="verbose-warnings" as="xs:string">no</xsl:variable>
    <xsl:variable name="verbose" select="lower-case($verbose-warnings)=('yes','y','1','true')"/>
    
    <xsl:variable name="root-name" select="/METASCHEMA/@root/string(.)"/>
    
    <xsl:variable name="target-ns" select="/METASCHEMA/namespace/string()"/>
    
    <xsl:key name="definition-by-name" match="define-flag | define-field | define-assembly" use="@name"/>
    
    <xsl:template match="/">
        <!--<xsl:sequence select="$compleat"/>-->
        <!--<xsl:sequence select="$eligible"/>-->
        <xsl:sequence select="$composed-metaschema"/>
    </xsl:template>
    
<!-- pull all schemas together
     traverse from top level
       discard any definition that has a subsequent override
       definitions to be kept:
         include docs from <augment> elements
         annotate with home module
         expand @group-as on field | flag | assembly ?
     
     diagnostic mode
       notes when definitions are discarded or kept
         switch $verbose
       lists analysis of keepers and tossers? by analyzing $compleat
       alerts when formal-name or description is overridden in imports
     -->

    
    <!-- ====== ====== ====== ====== ====== ====== ====== ====== ====== ====== ====== ====== -->
    <!-- Pass One: assemble definitions -->
    
    <xsl:variable name="compleat" as="document-node()">
        <xsl:apply-templates mode="acquire" select="/">
            <xsl:with-param name="so-far" tunnel="true" select="document-uri(/)"/>
        </xsl:apply-templates>
    </xsl:variable>

    <xsl:mode name="acquire" on-no-match="shallow-copy"/>
    
    <xsl:template match="comment() | processing-instruction()" mode="acquire"/>
    
    <xsl:template match="METASCHEMA" mode="acquire">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="module" select="document-uri(/)"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- quitting traversal by cloning branch -->
    <xsl:template match="define-field | define-flag | define-assembly" mode="acquire">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="import" mode="acquire">
        <xsl:param name="so-far" tunnel="yes" required="yes"/>
        <xsl:variable name="uri" select="resolve-uri(@href,document-uri(/))"/>
        <xsl:choose>
            <xsl:when test="$uri = $so-far">
                <xsl:comment expand-text="true">Warning: circular import of { $uri } skipped</xsl:comment>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="document($uri)/METASCHEMA" mode="acquire">
                    <xsl:with-param name="so-far" select="$so-far,$uri"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- ====== ====== ====== ====== ====== ====== ====== ====== ====== ====== ====== ====== -->
    <!-- Pass Two: filter definitions (1) - eligible definitions are the last-declared with their name
         but we keep everything else including all 'augments' (documentation) for the next pass -->
    <xsl:variable name="eligible" as="document-node()">
        <xsl:apply-templates select="$compleat" mode="keep-eligible"/>
    </xsl:variable>

    <xsl:mode name="keep-eligible" on-no-match="shallow-copy"/>
    
    <xsl:template mode="keep-eligible" priority="10"
        match="define-field[   . is key('definition-by-name',@name)[last()]]
             | define-flag[    . is key('definition-by-name',@name)[last()]] 
             | define-assembly[. is key('definition-by-name',@name)[last()]]">
        <xsl:if test="$verbose">
            <xsl:message expand-text="true">KEEPING definition for '{ @name }' { replace(local-name(),'^define-','')} from { ancestor::METASCHEMA[1]/@module }</xsl:message>
        </xsl:if>
        <xsl:copy-of select="."/>
    </xsl:template>

    <!-- Tossing definitions we aren't keeping -->
    <xsl:template mode="keep-eligible"
        match="define-field | define-flag | define-assembly">
        <xsl:if test="$verbose">
            <xsl:message expand-text="true">TOSSING definition for '{ @name }' { replace(local-name(),'^define-','')}  from { ancestor::METASCHEMA[1]/@module }</xsl:message>
        </xsl:if>
    </xsl:template>
        
    <!-- ====== ====== ====== ====== ====== ====== ====== ====== ====== ====== ====== ====== -->
    <!-- Pass Three: filter definitions (1) - keep definitions actually used, with all docs
          (i.e. drops definitions 'never picked for a team') -->
    <!-- Also consolidates documentation - definitions that are kept, are also annotated
           with applicable 'augment' elements i.e. those belonging to ancestor metaschemas
           in the import hierarchy. -->
    
    <xsl:variable name="composed-metaschema" as="document-node()">
        <xsl:variable name="all-references" as="xs:string*">
            <xsl:apply-templates mode="collect-references" select="$eligible/METASCHEMA/*[@name=$root-name]">
                <xsl:with-param tunnel="yes" name="ref-stack" select="()"/>
            </xsl:apply-templates>
        </xsl:variable>
        <xsl:apply-templates select="$eligible" mode="digest">
            <xsl:with-param tunnel="yes" name="keepers" select="$all-references"/>
        </xsl:apply-templates>
    </xsl:variable>
    
    <xsl:mode name="digest" on-no-match="shallow-copy"/>
    
    <xsl:template match="METASCHEMA//METASCHEMA" priority="5" mode="digest">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="formal-name//text() | description//text() | p//text()" mode="digest">
        <xsl:value-of select="replace(.,'\s+',' ')"/>
    </xsl:template>
    
    <!-- Dropping augment elements since their contents are being consolidated. -->
    <xsl:template match="augment" mode="digest"/>

    <!-- Dropping metaschema superstructure from sub modules -->
    <xsl:template match="METASCHEMA//METASCHEMA/*" mode="digest"/>

    <xsl:template priority="10" match="define-assembly | define-field | define-flag" mode="digest">
        <xsl:param name="keepers" tunnel="yes" required="yes"/>
        <xsl:variable name="my-name" select="@name"/>
        <xsl:variable name="me-and-mine" select="ancestor::METASCHEMA/augment[@name=$my-name] | ."/>
        <xsl:if test="@name = $keepers">
            <xsl:copy>
                <xsl:call-template name="mark-module"/>
                <xsl:copy-of select="@*"/>
                <xsl:copy-of select="$me-and-mine[last()]/formal-name"/>
                <xsl:if test="$verbose and ($me-and-mine/formal-name != $me-and-mine/formal-name)">
                    <xsl:message expand-text="true">Formal name override for  { replace(local-name(),'^define-','')} '{ @name }': using "{ $me-and-mine[last()]/formal-name }"</xsl:message>
                </xsl:if>
                <xsl:copy-of select="$me-and-mine[last()]/description"/>
                <xsl:apply-templates mode="#current" select="json-key, json-value-key, flag"/>
                <xsl:copy-of select="$me-and-mine[last()]/allowed-values"/>
                <xsl:copy-of select="model"/>
                <xsl:apply-templates mode="#current" select="$me-and-mine/remarks">
                    <xsl:sort select="position()" order="descending"/><!-- reversing the order -->
                </xsl:apply-templates>
                <xsl:apply-templates mode="#current" select="$me-and-mine/example">
                    <xsl:sort select="position()" order="descending"/><!-- reversing the order -->
                </xsl:apply-templates>
            </xsl:copy>
        </xsl:if>
        <xsl:if test="$verbose and not(@name = $keepers)">
            <xsl:message expand-text="true">DISCARDING definition for '{ @name }' { replace(local-name(),'^define-','')} from { ancestor::METASCHEMA[1]/@module } (not being used)</xsl:message>
        </xsl:if>
    </xsl:template>
    
    <xsl:template mode="digest" match="augment/remarks | augment/example">
        <xsl:copy>
            <xsl:call-template name="mark-module"/>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template priority="10" mode="digest" match="example/description | example/remarks">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <!-- Casting all examples into the master metaschema's declared namespace. -->
    <xsl:template mode="digest" match="example//* | example//*">
        <xsl:element name="{ local-name() }" namespace="{ $target-ns }">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template mode="digest" match="flag | json-key | json-value-key">
        <xsl:copy>
            <xsl:copy-of select="key('definition-by-name',(@name|@ref))/@as-type"/>
            <!-- Allowing local datatype to override the definition's datatype -->
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template name="mark-module">
        <xsl:copy-of select="ancestor-or-self::METASCHEMA/@module"/>
    </xsl:template>
    
<!-- Mode 'collect references' collects a set of strings naming definitions
     we actually need, by traversing the definitions tree from the root;
     recursive models are accounted for -->
    <xsl:template match="define-assembly" mode="collect-references">
        <xsl:param name="ref-stack" tunnel="yes" required="yes"/>
        <xsl:if test="not(@name = $ref-stack)">
            <xsl:sequence select="@name, flag/@ref"/>
            <xsl:apply-templates select="model" mode="#current">
                <xsl:with-param tunnel="true" name="ref-stack" select="$ref-stack,@name"/>
            </xsl:apply-templates>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="define-field" mode="collect-references">
        <xsl:sequence select="@name, flag/@ref"/>
    </xsl:template>
    
    <xsl:template match="model | model//*" mode="collect-references">
        <xsl:apply-templates mode="#current"/>  
    </xsl:template>
    
    <!-- Matching inside the $distinct-definitions variable, so traversing only applicable definitions -->
    <xsl:template priority="10" match="field | assembly" mode="collect-references">
        <xsl:apply-templates select="key('definition-by-name',@ref,root())" mode="#current"/>
    </xsl:template>
        
    <!--hitting anything but a define-assembly, we are done collecting references-->
    <xsl:template match="* | text()" mode="collect-references"/>
    
</xsl:stylesheet>