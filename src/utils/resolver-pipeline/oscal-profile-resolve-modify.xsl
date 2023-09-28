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

    <xsl:template match="node() | @* | processing-instruction('message-handler')">
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

    <xsl:template match="modify" as="processing-instruction()*">
        <!-- No output is required, but invoke template to warn if set-parameter
            does not match anything. -->
        <xsl:apply-templates select="set-parameter"/>
    </xsl:template>

    <xsl:template match="set-parameter" as="processing-instruction()?">
        <xsl:if test="not(@param-id = ancestor::catalog/descendant::param/@id)">
            <xsl:call-template name="mh:message-handler">
                <xsl:with-param name="text" expand-text="yes">set-parameter with param-id=&quot;{@param-id}&quot; does not match any param id.</xsl:with-param>
                <xsl:with-param name="message-type">Warning</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- The match="control//*" template is responsible for inserting other
        param elements before or after a param context node, while this template
        is responsible for processing this param element. -->
    <xsl:template name="process-param">
        <xsl:context-item as="element(param)" use="required"/>
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

    <!-- This template implements these cases:
        a) Implicit binding to a control as a whole.
        b) The special case in explicit binding where <add> targets the same
           control that <alter> targets. Handling is as in (a), per #1311.
        c) The special case in explicit binding where <add> targets a control that is
           a descendant of the control that <alter> targets.

        Compare with the match="control//*" template, which implements explicit binding
        to a control descendant that is not itself a control. -->
    <xsl:template match="control" priority="2">
        <xsl:param name="modifications" tunnel="yes" as="element(modify)?" required="yes"/>
        <!--<xsl:variable name="modifications" select="/*/modify"/>-->
        <xsl:variable name="id" select="@id"/>
        <xsl:variable name="descendant-or-self-ids" select="descendant-or-self::*/@id"/>

        <!-- $implicit-patches-to-id represents both the implicit <add> and explicit <add by-id="id_from_alter">. -->
        <!-- condition not(@by-id != $id) includes any addition without an @by-id, or whose @by-id is the control id -->
        <xsl:variable name="implicit-patches-to-id" as="element(add)*"
            select="$modifications/key('alteration-for-control-id',$id,.)/add[not(@by-id != $id)]"/>

        <xsl:variable name="explicit-patches-to-id-targeting-non-match" as="element(add)*"
            select="$modifications/key('alteration-for-control-id',$id,.)/add[@by-id and not(@by-id=$descendant-or-self-ids)]"/>
        <xsl:for-each select="$explicit-patches-to-id-targeting-non-match">
            <!-- Error case: An alter element targets this control, but the add element does not match anything in this control. -->
            <xsl:call-template name="mh:message-handler">
                <xsl:with-param name="text" expand-text="yes">The by-id value does not match anything. Error in element {serialize(.)}.</xsl:with-param>
                <xsl:with-param name="message-type">Error</xsl:with-param>
                <xsl:with-param name="terminate" select="true()"/>
            </xsl:call-template>
        </xsl:for-each>

        <!-- Data type of the next variable is element(add)*, or a PI in the error case. -->
        <xsl:variable name="explicit-patches-to-id-targeting-ancestor" as="item()*"
            select="oscal:patches-to-id-targeting-ancestor(., $modifications) except $implicit-patches-to-id"/>
        <xsl:for-each select="$explicit-patches-to-id-targeting-ancestor[self::add and not(@position = ('before','after'))]">
            <!-- Error case: An alter element targets an ancestor of this control, and the add element tries to add a control inside this control. -->
            <xsl:call-template name="mh:message-handler">
                <xsl:with-param name="text" expand-text="yes">When &lt;add> targets a child control, supported positions are 'before' and 'after', which add a sibling control. Error in element {serialize(.)}.</xsl:with-param>
                <xsl:with-param name="message-type">Error</xsl:with-param>
                <xsl:with-param name="terminate" select="true()"/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- If an upstream computation found an error or warning, pass it along. -->
        <xsl:sequence select="$explicit-patches-to-id-targeting-ancestor[self::processing-instruction('message-handler')]"/>

        <xsl:for-each select="$implicit-patches-to-id[@position = ('before','after')]">
            <!-- Error case: Implicit binding with 'before' or 'after'. -->
            <xsl:call-template name="mh:message-handler">
                <xsl:with-param name="text" expand-text="yes">When &lt;add> targets the same control targeted by &lt;alter&gt;, supported positions are 'starting' and 'ending', which add content strictly within the targeted control. Error in element {serialize(.)}.</xsl:with-param>
                <xsl:with-param name="message-type">Error</xsl:with-param>
                <xsl:with-param name="terminate" select="true()"/>
            </xsl:call-template>            
        </xsl:for-each>
        <xsl:choose>
            <xsl:when test="ancestor::control and oscal:removable(.,$modifications) and
                (exists($explicit-patches-to-id-targeting-ancestor) or exists($implicit-patches-to-id))">
                <xsl:call-template name="mh:message-handler">
                    <xsl:with-param name="text" expand-text="yes">Cannot insert content in control with id=&quot;{$id}&quot; because it is being removed.</xsl:with-param>
                    <xsl:with-param name="message-type">Error</xsl:with-param>
                    <xsl:with-param name="terminate" select="true()"/>
                </xsl:call-template>            
            </xsl:when>
            <xsl:otherwise>
                <!-- Special case of explicit binding: Insert control(s) before this one. -->
                <xsl:copy-of select="($explicit-patches-to-id-targeting-ancestor[@position='before'])/*[self::control]"/>

                <!-- In this control, insert content as indicated by <add> and copy everything else. -->
                <!-- The result might have elements in an invalid sequence, but the final phase adjusts that. -->                
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:apply-templates select="title" mode="#current"/>
                    <xsl:copy-of select="($implicit-patches-to-id[@position='starting'])/*"/>
    
                <xsl:apply-templates select="* except title" mode="#current"/>
                <!--<xsl:message expand-text="true">{ string-join((* except title)/(name() || '#' || @id), ', ') }</xsl:message>-->
    
                    <!-- Insert content at end of this control, if position is 'ending' or if no valid position is given. -->
                    <xsl:copy-of select="($implicit-patches-to-id[
                        @position = 'ending' or oscal:no-valid-position-given(@position)
                        ])/*"/>
    
            </xsl:copy>
                
                <!-- Special case of explicit binding: Insert control(s) after this one. -->
                <xsl:copy-of select="($explicit-patches-to-id-targeting-ancestor[@position='after'])/*[self::control]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Return true if and only if the input is not an attribute with a valid position value. -->
    <xsl:function name="oscal:no-valid-position-given" as="xs:boolean">
        <xsl:param name="position" as="attribute(position)?"/>
        <xsl:sequence select="boolean(
            not($position = ('before','after','starting','ending'))
            )"/>
    </xsl:function>

    <!-- Find <add> elements that reference the $here element by ID,
        from the given <modify> element. -->
    <!-- Return value is element(add)*, or a PI in the error case. -->
    <xsl:function name="oscal:patches-to-id-targeting-ancestor" as="item()*">
        <xsl:param name="here" as="element()"/>
        <xsl:param name="modifications" as="element(modify)?"/>
        <xsl:variable name="first-ancestor-control" select="$here/ancestor::control[1]" as="element(control)?"/>
        <xsl:variable name="alterations" as="element(alter)*"
            select="$modifications/key('alteration-for-control-id',$first-ancestor-control/@id,.)"/>
        <xsl:variable name="same-element-type" as="function(*)"
            select="function($elem1, $elem2) as xs:boolean {
            local-name($elem1)=local-name($elem2) and namespace-uri($elem1)=namespace-uri($elem2)
            }"/>
        <!-- Key retrievals scoped to alterations -->
        <xsl:variable name="all-patches-meeting-id-criteria" as="element(add)*"
            select="$alterations/key('addition-by-id-ref',$here/@id,.)"/>
        <!-- Do error handling and compute output sequence -->
        <xsl:for-each select="$all-patches-meeting-id-criteria">
            <xsl:choose>
                <xsl:when test="parent::alter/@control-id = $here/@id">
                    <!-- alter and add target the same ID. Formally, this is explicit binding
                        but treat as implicit binding. -->
                    <xsl:sequence select="."/>
                </xsl:when>
                <xsl:when test="not(@position = ('before','after')) or
                    (every $element-to-add in child::* satisfies $same-element-type($element-to-add, $here))">
                    <!-- Typical explicit binding case, and selection type and insertion type match. --> 
                    <xsl:sequence select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="mh:message-handler">
                        <xsl:with-param name="text" expand-text="yes">When position="{./@position}", the target element and the elements to add must have the same element type. This element is {$here/name()} and element to add is {*[1]/name()}. Error in element {serialize(.)}.</xsl:with-param>
                        <xsl:with-param name="message-type">Error</xsl:with-param>
                        <xsl:with-param name="terminate" select="true()"/>
                    </xsl:call-template>                    
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>

    <!-- This template is for explicit binding to a descendant of a control. -->
    <xsl:template match="control//*">
        <xsl:param name="modifications" tunnel="yes" as="element(modify)?" required="yes"/>
        <xsl:variable name="this" as="element()" select="."/>
        <!--<xsl:variable name="modifications" select="/*/modify"/>-->

        <xsl:variable name="same-element-type" as="function(*)"
            select="function($elem1, $elem2) as xs:boolean {
                local-name($elem1)=local-name($elem2) and namespace-uri($elem1)=namespace-uri($elem2)
            }"/>
        <!-- Data type of the next variable is element(add)*, or a PI in the error case. -->
        <xsl:variable name="patches-to-id" select="oscal:patches-to-id-targeting-ancestor($this, $modifications)" as="item()*"/>
        <!-- If an upstream computation found an error or warning, pass it along. -->
        <xsl:sequence select="$patches-to-id[self::processing-instruction('message-handler')]"/>

        <!-- $patches-before contains 'add' elements marked as patching before this element, by this element's @id -->
        <xsl:variable name="patches-before" select="$patches-to-id[@position='before']" as="element(add)*"/>
        <xsl:variable name="patches-before-same-element-type" as="element(add)*"
            select="$patches-before[$same-element-type(./*[1],$this)]"/>
        <xsl:copy-of select="$patches-before-same-element-type/*"/>
        <!-- When position="before|after", selection type must equal insertion type. -->

        <xsl:variable name="removable" as="xs:boolean"
            select="oscal:removable(.,$modifications)"/>
        <xsl:if test="not($removable)">
            <xsl:copy>
                <xsl:apply-templates select="@*" mode="#current"/>
                <xsl:apply-templates select="title" mode="#current"/>

                <xsl:variable name="patches-starting" select="$patches-to-id[@position='starting']"/>
                <xsl:copy-of select="$patches-starting/*"/>

                <xsl:choose>
                    <xsl:when test="self::param"> 
                        <xsl:variable name="processed-param">
                            <xsl:call-template name="process-param"/>
                        </xsl:variable>
                        <xsl:sequence select="$processed-param/param/node()"/>
                    </xsl:when>
                    <xsl:otherwise>
                <xsl:apply-templates select="node() except title" mode="#current"/>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:variable name="patches-ending" select="$patches-to-id[@position='ending' or oscal:no-valid-position-given(@position)]"/>
                <xsl:copy-of select="$patches-ending/*"/>
            </xsl:copy>
        </xsl:if>

        <!-- $patches-after contains 'add' elements marked as patching after this element, by this element's @id -->
        <xsl:variable name="patches-after" select="$patches-to-id[@position='after']"/>
        <xsl:variable name="patches-after-same-element-type" as="element(add)*"
            select="$patches-after[$same-element-type(./*[1],$this)]"/>
        <xsl:copy-of select="$patches-after-same-element-type/*"/>

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
