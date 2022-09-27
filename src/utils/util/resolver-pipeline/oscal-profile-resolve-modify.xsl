<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    exclude-result-prefixes="#all"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:mh="http://csrc.nist.gov/ns/message"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >

    <xsl:import href="message-handler.xsl"/>

    <xsl:key name="alteration-for-control-id" match="alter"         use="@control-id"/>
    <xsl:key name="addition-by-id-ref"        match="add"           use="@by-id"/>
    <xsl:key name="parameter-setting-for-id"  match="set-parameter" use="@param-id"/>

    <xsl:variable name="oscal-versionless-ns" select="'http://csrc.nist.gov/ns/oscal'"/>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="catalog">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates>
                <!-- $modifications tunnel parameter is used by templates for
                    param, control, and descendants of control. --> 
                <xsl:with-param name="modifications" tunnel="yes" select="child::modify"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="modify" as="empty-sequence()">
        <!-- No output is required, but invoke template to warn if set-parameter
            does not match anything. -->
        <xsl:apply-templates select="set-parameter"/>
    </xsl:template>

    <xsl:template match="set-parameter" as="empty-sequence()">
        <xsl:if test="not(@param-id = ancestor::catalog/descendant::param/@id)">
            <xsl:call-template name="mh:message-handler">
                <xsl:with-param name="text" expand-text="yes">set-parameter with param-id=&quot;{@param-id}&quot; does not match any param id.</xsl:with-param>
                <xsl:with-param name="message-type">Warning</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- priority to override template match="control//*" -->
    <xsl:template match="param" priority="2">
        <xsl:param name="modifications" tunnel="yes" as="element(modify)?" required="yes"/>
        <xsl:variable name="id" select="@id"/>
<!-- depending on 'merge' behavior there could be multiple settings. combine/use-first should keep only the first setting in the first profile with such a setting. combine/merge should remove all duplicates by value. combine/keep should keep all parameter settings contents even when results are invalid. These operations are assumed to be performed in the merge phase. -->
        <xsl:variable name="settings" as="element(set-parameter)*"
            select="$modifications/key('parameter-setting-for-id',$id,.)"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <!--param contains: prop, link, label, usage, constraint, guideline, value or select, remarks
            set-parameter contains: prop, link, label, usage, constraint, guideline, value or select-->
            
            <!-- Any prop with a uuid value replaces an earlier one with that uuid.
                Gather them in order in a document, and then determine which ones
                to suppress from output. -->
            <xsl:variable name="all-props" as="document-node()">
                <xsl:document>
                    <xsl:sequence select="prop, $settings/prop"/>
                </xsl:document>
            </xsl:variable>
            <xsl:sequence select="$all-props/prop[not(@uuid = following-sibling::prop/@uuid)]"/>
            <xsl:sequence select="link, $settings/link"/>
            <xsl:sequence select="(label, $settings/label)[last()]"/>
            <xsl:sequence select="(usage, $settings/usage)[last()]"/>
            <xsl:sequence select="constraint,$settings/constraint"/>
            <xsl:sequence select="guideline, $settings/guideline"/>
            <xsl:sequence select="(value, select, $settings/(value,select))[last()]"/>
            <xsl:sequence select="remarks"/>
        </xsl:copy>
    </xsl:template>

    <!-- When matching a control, insert content as indicated by <add> and copy everything else. -->

    <xsl:template match="control" priority="2">
        <xsl:param name="modifications" tunnel="yes" as="element(modify)?" required="yes"/>
        <!--<xsl:variable name="modifications" select="/*/modify"/>-->
        <xsl:variable name="id" select="@id"/>
        <xsl:variable name="patches-to-id-targeting-ancestor" select="oscal:patches-to-id-targeting-ancestor(., $modifications)" as="element(add)*"/>
        <!-- condition not(@by-id != $id) includes any addition without an @by-id, or whose @by-id is the control id -->
        <xsl:variable name="implicit-patches-to-id" select="$modifications/key('alteration-for-control-id',$id,.)/add[not(@by-id != $id)]" as="element(add)*"/>

        <xsl:copy-of select="$patches-to-id-targeting-ancestor[@position = 'before']/*"/><xsl:message>got here! removable is <xsl:sequence select="oscal:removable(./*[1],$modifications)"/></xsl:message>
        <xsl:if test="not(ancestor::control and oscal:removable(.,$modifications))">
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:apply-templates select="title" mode="#current"/>
                <xsl:copy-of select="(
                    $implicit-patches-to-id[@position=('before','starting')] | 
                    $patches-to-id-targeting-ancestor[@position='starting']
                    )/*"/>
    
                <xsl:apply-templates select="* except title" mode="#current"/>
                <!--<xsl:message expand-text="true">{ string-join((* except title)/(name() || '#' || @id), ', ') }</xsl:message>-->
    
                <xsl:copy-of select="(
                    $implicit-patches-to-id[not(@position = ('before','starting'))] | 
                    $patches-to-id-targeting-ancestor[empty(@position) or @position='ending' or not(@position=('before','after','starting','ending'))]
                    )/*"/><!-- TODO: Revisit after approach to #1311 is clarified -->
    
            </xsl:copy>
        </xsl:if>
        <xsl:copy-of select="$patches-to-id-targeting-ancestor[@position = 'after']/*"/>
    </xsl:template>

    <!-- Find <add> elements that reference the $here element by ID,
        from the given <modify> element. -->
    <xsl:function name="oscal:patches-to-id-targeting-ancestor" as="element(add)*">
        <xsl:param name="here" as="element()"/>
        <xsl:param name="modifications" as="element(modify)?"/>
        <xsl:variable name="controls" select="$here/ancestor-or-self::control" as="element(control)*"/>
        <xsl:variable name="alterations" as="element(alter)*"
            select="for $control in $controls return $modifications/key('alteration-for-control-id',$control/@id,.)"/>
        <!-- Key retrievals scoped to alterations...   -->
        <xsl:sequence select="$alterations/key('addition-by-id-ref',$here/@id,.)"/>
    </xsl:function>

    <xsl:template match="control//*">
        <xsl:param name="modifications" tunnel="yes" as="element(modify)?" required="yes"/>
        <!--<xsl:variable name="modifications" select="/*/modify"/>-->
        <xsl:variable name="patches-to-id" select="oscal:patches-to-id-targeting-ancestor(., $modifications)" as="element(add)*"/>

        <!-- $patches-before contains 'add' elements marked as patching before this element, by its @id -->
        <xsl:variable name="patches-before" select="$patches-to-id[@position='before']"/>

        <xsl:copy-of select="$patches-before/*"/>
        <xsl:if test="not(oscal:removable(.,$modifications))">
            <xsl:copy>
                <xsl:apply-templates select="@*" mode="#current"/>
                <xsl:apply-templates select="title" mode="#current"/>

                <xsl:variable name="patches-starting" select="$patches-to-id[@position='starting']"/>
                <xsl:copy-of select="$patches-starting/*"/>

                <xsl:apply-templates select="node() except title" mode="#current"/>

                <xsl:variable name="patches-ending" select="$patches-to-id[empty(@position) or @position='ending' or not(@position=('before','after','starting','ending'))]"/>
                <xsl:copy-of select="$patches-ending/*"/>
            </xsl:copy>
        </xsl:if>

        <!-- Reverse logic for 'after' patches. -->
        <xsl:variable name="patches-after" select="$patches-to-id[@position='after']"/>
        <xsl:copy-of select="$patches-after/*"/>

    </xsl:template>

    <!-- Return true if the $who element is meant to be removed, according to $mods -->
    <xsl:function name="oscal:removable" as="xs:boolean">
        <xsl:param name="who" as="element()"/><!-- Descendant of control -->
        <xsl:param name="mods" as="element(modify)?"/>
        <xsl:variable name="home" as="element()+" select="$who/ancestor::control"/>
        <xsl:variable name="alterations" as="element(alter)*" select="$mods/key('alteration-for-control-id',$home/@id,.)"/>
        <xsl:variable name="removals" as="element(remove)*" select="$alterations/remove"/>        
        <xsl:sequence select="some $r in $removals satisfies oscal:remove-match($who,$r)"/>
    </xsl:function>

    <!-- For a given element $who and removal element $removal, return true if $removal indicates
        that $who should be removed. In practice, $who is a descendant of control. -->
    <!-- $removal has this form, where attributes that appear must have nonempty values:
        <remove by-item-name="..." by-id="..." by-class="..." by-name="..." by-ns=".."/>-->
    <xsl:function name="oscal:remove-match" as="xs:boolean">
        <xsl:param name="who" as="element()"/>
        <xsl:param name="removal" as="element(remove)"/>
        <xsl:variable name="item-okay" as="xs:boolean"  select="empty($removal/@by-item-name) or ($removal/@by-item-name = local-name($who))"/>
        <xsl:variable name="id-okay" as="xs:boolean"    select="empty($removal/@by-id)    or ($removal/@by-id = $who/@id)"/>
        <xsl:variable name="name-okay" as="xs:boolean"  select="empty($removal/@by-name)  or ($removal/@by-name = $who/@name)"/>
        <xsl:variable name="ns-okay" as="xs:boolean"    select="empty($removal/@by-ns[not(. = $oscal-versionless-ns)])
            or ($removal/@by-ns = $who/@ns/normalize-space(.))"/>
        <xsl:variable name="oscal-ns-okay" as="xs:boolean" select="empty($removal/@by-ns[. = $oscal-versionless-ns])
            or (($who/@ns/normalize-space(.) = $oscal-versionless-ns) or empty($who/@ns))"/>
        <xsl:variable name="class-okay" as="xs:boolean" select="empty($removal/@by-class) or ($removal/@by-class = $who/@class)"/>
        <xsl:variable name="removal-includes-specifier" as="xs:boolean" select="exists($removal/(@by-item-name|@by-id|@by-name|@by-ns|@by-class))"/>
        <xsl:sequence select="$removal-includes-specifier and ($item-okay and $id-okay and $name-okay and $ns-okay and $oscal-ns-okay and $class-okay)"/>
    </xsl:function>

</xsl:stylesheet>
