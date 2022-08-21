<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:mh="http://csrc.nist.gov/ns/message"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    exclude-result-prefixes="xs math o opr"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >

    <xsl:import href="message-handler.xsl"/>

    <xsl:variable name="true-content" as="xs:string+" select="('true','1')"/>

    <xsl:template match="* | @* | processing-instruction('message-handler')" mode="#all">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

<!-- TODO; exception handling such as unmatched document element (i.e., not already 'catalog' with 'selection' children)    -->
    <!-- With no combination rule, we simply emit parameters and controls -->
    <xsl:template match="/*" priority="1">
        <!-- emitting nothing as this is input is erroneous; a catalog will match one of the following
            templates not this one. -->
        
    </xsl:template>

    <!-- If there is no selection and no merge (i.e., we don't reach one of
        the higher-priority templates that match catalog), pass the catalog
        through unchanged. -->
    <xsl:template match="catalog" priority="2" as="element(catalog)">
        <xsl:copy-of select="."/>
    </xsl:template>

    <!-- If there is a selection but neither merge/as-is nor merge/custom,
        use flat structuring without grouping or hierarchy of controls. -->
    <xsl:template match="catalog[exists(selection)]" priority="10" as="element(catalog)">
        <catalog>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="metadata"/>

            <!-- For controls, first undo grouping and then undo nesting. -->
            <xsl:variable name="controls-ungrouped-but-nested">
                <xsl:apply-templates select="selection"/>
            </xsl:variable>
            <xsl:apply-templates select="$controls-ungrouped-but-nested/* | $controls-ungrouped-but-nested/*/descendant::control"
                mode="remove-nested-controls"/>

            <xsl:apply-templates select="processing-instruction('message-handler')"/>
            <xsl:apply-templates select="modify"/>
            <xsl:where-populated>
                <back-matter>
                    <xsl:sequence select="back-matter/* | selection/back-matter/*"/>
                </back-matter>
            </xsl:where-populated>
        </catalog>
    </xsl:template>
    
    <!-- Skip descendant controls as part of flat structuring. The template that
        initiates this mode outputs the descendants as siblings instead, so this
        skipping operation avoids redundancy.
        
        For other contexts, the 'remove-nested-controls' operation falls back
        to the generic template rule having mode="#all". -->
    <xsl:template match="control[control]" mode="remove-nested-controls">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="(* | @*) except control"/>
        </xsl:copy>
    </xsl:template>

    <!-- If there is a merge/as-is directive, we go down that branch.
        If there is also a merge/custom directive, we apply the
        higher-priority template instead of this one. -->
    <!-- Template return value is element(catalog) possibly preceded by a
        processing instruction from detect-multiple-structuring-directives. -->
    <xsl:template match="catalog[merge/as-is=$true-content]" priority="12" as="item()+">
        <xsl:call-template name="detect-multiple-structuring-directives"/>
        <catalog>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="metadata"/>
            <xsl:variable name="merged-selections">
                <xsl:call-template name="o:merge-groups-as-is">
                    <xsl:with-param name="merging" select="selection"/>
                </xsl:call-template>
            </xsl:variable>
            <!-- not copying the selection elements, only their contents -->
            <xsl:for-each select="$merged-selections/selection">
                <xsl:sequence select="* except back-matter"/>
            </xsl:for-each>
            <xsl:apply-templates select="processing-instruction('message-handler')"/>
            <!-- copying 'modify' unchanged through this transformation -->
            <xsl:apply-templates select="modify"/>
            <xsl:call-template name="combine-back-matter"/>
        </catalog>
    </xsl:template>


    <!-- If there is a merge/custom directive, we go down that branch. -->
    <!-- Template return value is element(catalog) possibly preceded by a
        processing instruction from detect-multiple-structuring-directives. -->
    <xsl:template match="catalog[exists(merge/custom)]" priority="13" as="item()+">
        <xsl:call-template name="detect-multiple-structuring-directives"/>
        <catalog>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="metadata"/>

            <xsl:apply-templates select="merge/custom" mode="o:custom-merge"/>

            <xsl:apply-templates select="processing-instruction('message-handler')"/>

            <!-- copying 'modify' unchanged through this transformation -->
            <xsl:apply-templates select="modify"/>
            <xsl:call-template name="combine-back-matter"/>
        </catalog>
    </xsl:template>

    <xsl:template name="detect-multiple-structuring-directives" as="processing-instruction()?">
        <xsl:context-item as="element(catalog)" use="required"/>
        <xsl:variable name="flat" as="element(flat)*" select="merge/flat[.=$true-content]"/>
        <xsl:variable name="as-is" as="element(as-is)*" select="merge/as-is[.=$true-content]"/>
        <xsl:variable name="custom" as="element(custom)*" select="merge/custom"/>
        <xsl:if test="count($flat) + count($as-is) + count($custom) gt 1">
            <xsl:call-template name="mh:message-handler">
                <xsl:with-param name="text">Found multiple structuring directives. Choose at most one from: flat (default), as-is, custom.</xsl:with-param>
                <xsl:with-param name="message-type">Error</xsl:with-param>
                <xsl:with-param name="terminate" select="true()"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="combine-back-matter" as="element(back-matter)?">
        <xsl:context-item as="element(catalog)" use="required"/>
        <xsl:where-populated>
            <back-matter>
                <!-- Using combination logic on back matter elements. -->
                <xsl:for-each-group select="back-matter/* | selection/back-matter/*" group-by="(@opr:id,@uuid,generate-id())[1]">
                    <xsl:variable name="last" as="element(resource)" select="current-group()[last()]"/>
                    <!-- The final phase needs the ability to keep unreferenced
                            back matter items based on keep instructions, so the merge
                            phase must preserve these items. -->
                    <xsl:variable name="keepers" as="element(resource)*"
                        select="current-group()[child::prop[@name='keep' and @value='always']]"/>
                    <xsl:call-template name="combine-elements">
                        <!-- Take last one in group because of spec requirement
                            id="req-backmatter-dupe". -->
                        <!-- Take last item with keep instruction, because
                            of spec requirement id="req-backmatter-keep". -->
                        <xsl:with-param name="who" select="$keepers[last()] | $last" as="element(resource)+"/>
                    </xsl:call-template>
                </xsl:for-each-group>
            </back-matter>
        </xsl:where-populated>
    </xsl:template>

    <xsl:template match="selection">
        <xsl:apply-templates select="param   | .//group/param"/>
        <xsl:apply-templates select="control | .//group/control"/>
    </xsl:template>

    <!-- Process children but do not copy <custom> tags themselves. -->
    <xsl:template match="custom" mode="o:custom-merge">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>

    <!-- Apply the requested ordering.
        Creating the properly combined sequence of inserted controls
        is in downstream template. -->
    <xsl:template match="insert-controls" mode="o:custom-merge">
        <xsl:variable name="inserted-controls" as="element()*">
            <xsl:apply-templates mode="#current"/>
        </xsl:variable>
        <xsl:variable name="keep-order" select="not(@order = ('descending','ascending'))" as="xs:boolean"/>
        <xsl:variable name="sort-order" select="@order[.='descending'],'ascending'"/>
        <!-- Setting sort-key to '1' sorts into given order -->
        <xsl:perform-sort select="$inserted-controls">
            <xsl:sort select="if ($keep-order) then '1' else @id" 
                order="{$sort-order[1]}"/>
        </xsl:perform-sort>
    </xsl:template>

    <xsl:include href="select-or-custom-merge.xsl"/>

    <!-- Combine selected controls.
        Creating the sequence of controls ($who) is in code shared with
        selection phase. -->
    <xsl:template match="include-all | include-controls" mode="o:custom-merge">
        <xsl:variable name="who" as="element(o:control)*">
            <xsl:apply-templates select="ancestor::*[last()]//selection" mode="o:select">
                <xsl:with-param tunnel="yes" name="import-instruction" select="ancestor::insert-controls"/>
            </xsl:apply-templates>
        </xsl:variable>
        <xsl:call-template name="combine-elements">
            <xsl:with-param name="who" select="$who"/>
        </xsl:call-template>
    </xsl:template>

    <!-- No-op because exclusion logic is handled in the code shared with
            selection phase. -->
    <xsl:template match="exclude-controls" mode="o:custom-merge"/>

    <!-- In o:select mode, process children of selection or group to reach
        controls, which are handled in select-or-custom-merge.xsl. -->
    <xsl:template match="selection | selection//group" mode="o:select">
        <xsl:apply-templates select="group | control" mode="#current"/>
    </xsl:template>

    <xsl:template name="o:merge-groups-as-is">
        <xsl:context-item as="element()" use="optional"/>
        <xsl:param name="merging" select="()" as="element()*"/>
        <xsl:for-each-group select="$merging" group-by="(@uuid,@opr:id,@id,generate-id())[1]">
            <xsl:variable name="merged" select="current-group()" as="element()+"/>
            <xsl:for-each select="$merged[1]">
                <xsl:copy copy-namespaces="no">
                    <xsl:apply-templates select="$merged/@*"/>
                    <xsl:apply-templates select="title"/>
                    <xsl:apply-templates select="$merged/(* except (title | param | control | group) )"/>

                    <xsl:call-template name="combine-elements">
                        <xsl:with-param name="who" select="$merged/param"/>
                    </xsl:call-template>
                    <xsl:call-template name="combine-elements">
                        <xsl:with-param name="who" select="$merged/control"/>
                    </xsl:call-template>

                    <xsl:call-template name="o:merge-groups-as-is">
                        <xsl:with-param name="merging" select="$merged/group[exists(descendant::control)]"/>
                    </xsl:call-template>

                </xsl:copy>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>

    <xsl:template name="combine-elements">
        <xsl:context-item as="element()" use="required"/>
        <xsl:param name="who" as="element()*"/>
        <xsl:apply-templates select="ancestor-or-self::catalog" mode="o:combine-elements">
            <xsl:with-param name="elements" select="$who"/>
        </xsl:apply-templates>
    </xsl:template>

    <!-- 'visitor pattern' uses the profile element as a handler for dispatching control merge logic
         for a set of controls.
         Think of this as a function "merge-elements" that merges an arbitrary set of elements
         with the combination method as an argument.
    -->

    <xsl:template priority="10" match="catalog[merge/combine/@method='merge']" mode="o:combine-elements">
        <xsl:param name="elements" as="element()*" required="yes"/>
        <!-- All the elements coming in have the same name but different opr:id
             we operate on controls and parameters (not groups or group contents otherwise) -->
        <!-- further, we assume all controls or all parameters -->
        <xsl:variable name="uri-qualified-name" as="function(*)"
            select="function($node as element()) as xs:string {
                'Q{' || namespace-uri($node) || '}' || local-name($node)
            }"/>
        <xsl:variable name="element-names" as="xs:string*"
            select="$elements ! $uri-qualified-name(.)"/>
        <xsl:if test="$element-names != $element-names">
            <!-- If we get here for a valid profile, it is an XSLT bug rather than a user error. -->
            <xsl:call-template name="mh:message-handler">
                <xsl:with-param name="text">Combining elements of different types is not supported.</xsl:with-param>
                <xsl:with-param name="message-type">Error</xsl:with-param>
                <xsl:with-param name="terminate" select="false()"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:for-each-group select="$elements" group-by="(@opr:id,@id,generate-id())[1]">
            <xsl:variable name="merged" select="current-group()" as="element()+"/>
            <xsl:for-each select="$merged[1]">
                <xsl:copy copy-namespaces="no">
                    <xsl:apply-templates select="$merged/@*"/>
                    <xsl:apply-templates select="$merged/*"/>
                </xsl:copy>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>

    <xsl:template priority="10" match="catalog[merge/combine/@method='use-first']" mode="o:combine-elements">
        <xsl:param name="elements" as="element()*" required="yes"/>
        <xsl:apply-templates select="$elements[1]"/>
    </xsl:template>

    <!--[merge/combine/@method='keep'] is the default handling -->
    <xsl:template priority="5" match="catalog" mode="o:combine-elements">
        <xsl:param name="elements" as="element()*" required="yes"/>
        <xsl:apply-templates select="$elements"/>
    </xsl:template>

    <!-- Scrubbing opr:id values on the way out - we don't need them. -->
    <xsl:template match="@opr:id"/>

</xsl:stylesheet>
