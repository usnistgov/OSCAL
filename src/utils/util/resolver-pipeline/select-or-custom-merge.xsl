<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math o"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">

    <xsl:include href="oscal-profile-resolve-functions.xsl"/>

    <!-- A control is included if it is selected by the provided import instruction -->
    <xsl:template match="control" mode="o:select" as="element(o:control)?">
        <xsl:param name="import-instruction" tunnel="yes" required="yes"/>
        <xsl:choose>
            <xsl:when test="o:selects($import-instruction,.)">
                <xsl:copy copy-namespaces="no">
                    <xsl:call-template name="add-process-id"/>
                    <xsl:apply-templates mode="#current" select="node() | @*"/>
                </xsl:copy>
           </xsl:when>
           <xsl:otherwise>
               <!-- Visit child controls in case they are selected using
                   with-parent-controls="no". -->
               <xsl:apply-templates mode="#current" select="control"/>
           </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="add-process-id" as="attribute(opr:id)">
        <xsl:param name="context" select="." as="element()"/>
        <xsl:attribute name="opr:id" namespace="http://csrc.nist.gov/ns/oscal/profile-resolution">
            <xsl:value-of
                select="concat(opr:catalog-identifier($context/root()/(o:catalog|o:profile)), '#', $context/(@id, generate-id())[1])"/>
        </xsl:attribute>
    </xsl:template>

    <!-- Function o:selects($importing,$candidate) returns a true or false
         depending on whether the import calls the candidate control  -->
    
    <!-- @with-child-controls='yes' is recursive - given on a control it brings all control descendants, not only children   -->
    <xsl:function name="o:selects" as="xs:boolean">
        <xsl:param name="importing" as="element()"/><!-- o:import in selection phase, o:insert-controls in merge phase -->
        <xsl:param name="candidate" as="element(o:control)"/>
        <xsl:variable name="include-reasons" as="xs:boolean+">
            <!-- we are not optimizing for performance here; nothing is done to prevent all checks even if the first passes -->
            <!--<xsl:sequence select="empty($importing/include)"/>-->
            <xsl:sequence select="exists($importing/include-all)"/>
            <xsl:sequence select="some $c in ($importing/include-controls/with-id)
                satisfies ($c = $candidate/@id)"/>
            <xsl:sequence select="some $c in ($importing/include-controls[o:calls-parents(.)]/with-id)
                satisfies ($c = $candidate/descendant::control/@id)"/>
            <xsl:sequence select="some $c in ($importing/include-controls[o:calls-children(.)]/with-id)
                satisfies ($c = $candidate/ancestor::control/@id)"/>
            <xsl:sequence select="some $m in ($importing/include-controls/matching[@pattern != ''])
                satisfies (matches($candidate/@id,$m/@pattern/o:glob-as-regex(string(.)) ))"/>
            <xsl:sequence select="some $m in ($importing/include-controls[o:calls-parents(.)]/matching[@pattern != '']), $a in $candidate/descendant::control 
                satisfies (matches($a/@id,$m/@pattern/o:glob-as-regex(string(.))))"/>
            <xsl:sequence select="some $m in ($importing/include-controls[o:calls-children(.)]/matching[@pattern != '']), $a in $candidate/ancestor::control 
                satisfies (matches($a/@id,$m/@pattern/o:glob-as-regex(string(.))))"/>
        </xsl:variable>
        <xsl:variable name="exclude-reasons" as="xs:boolean+">
            <xsl:sequence select="exists($candidate/parent::control) and $importing/include-all/@with-child-controls='no'"/>
            <xsl:sequence select="some $c in ($importing/exclude-controls/with-id) satisfies ($c = $candidate/@id)"/>
            <xsl:sequence select="some $c in ($importing/exclude-controls[o:calls-parents(.)]/with-id)
                satisfies ($c = $candidate/descendant::control/@id)"/>
            <xsl:sequence select="some $c in ($importing/exclude-controls[o:calls-children(.)]/with-id)
                satisfies ($c = $candidate/ancestor::control/@id)"/>
            <xsl:sequence select="some $m in ($importing/exclude-controls/matching[@pattern != ''])
                satisfies (matches($candidate/@id,$m/@pattern/o:glob-as-regex(string(.))))"/>
            <xsl:sequence select="some $m in ($importing/exclude-controls[o:calls-parents(.)]/matching[@pattern != '']), $a in $candidate/descendant::control
                satisfies (matches($a/@id,$m/@pattern/o:glob-as-regex(string(.))))"/>
            <xsl:sequence select="some $m in ($importing/exclude-controls[o:calls-children(.)]/matching[@pattern != '']), $a in $candidate/ancestor::control
                satisfies (matches($a/@id,$m/@pattern/o:glob-as-regex(string(.))))"/>
        </xsl:variable>
        <!-- predicate [.] filters reasons as booleans -->
        <xsl:sequence select="exists($include-reasons[.]) and empty($exclude-reasons[.])"/>
    </xsl:function>
    
    <xsl:function name="o:calls-children" as="xs:boolean">
        <xsl:param name="caller" as="element()"/>
        <xsl:sequence select="$caller/@with-child-controls='yes'"/>
    </xsl:function>
    
    <xsl:function name="o:calls-parents" as="xs:boolean">
        <xsl:param name="caller" as="element()"/>
        <xsl:sequence select="not($caller/@with-parent-controls='no')"/>
    </xsl:function>

    <xsl:function name="opr:catalog-identifier" as="xs:string">
        <xsl:param name="catalog-or-profile" as="element()"/>
        <xsl:sequence select="$catalog-or-profile/(@uuid,document-uri(root(.)))[1]"/>
    </xsl:function>

</xsl:stylesheet>
