<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:v="http://csrc.nist.gov/ns/version"
    exclude-result-prefixes="xs v" version="3.0">

    <!-- Reference for Semantic Versioning 2.0.0: semver.org -->

    <!-- Regular expression to check that a string is a valid semantic version, from semver.org.
         Capture groups: cg1 = major, cg2 = minor, cg3 = patch, cg4 = pre-release and cg5 = buildmetadata-->
    <xsl:variable name="semver-regexp" as="xs:string"
        select="'^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$'"/>

    <!-- Compare two semantic version strings for precedence.
        
        Parameters:
        * $A: Version string, assumed valid according to Semantic Versioning 2.0.0.
        * $B: Version string, assumed valid according to Semantic Versioning 2.0.0.

        Return values, imitating the XPath compare() function for strings:
        * -1 if $A is older than $B
        *  0 if $A and $B indicate the same version, not counting build metadata
        *  1 if $A is newer than $B
    -->
    <xsl:function name="v:compare" as="xs:integer">
        <xsl:param name="A" as="xs:string"/>
        <xsl:param name="B" as="xs:string"/>

        <!-- This two-parameter function assumes both strings are valid. -->
        <xsl:if test="not(matches($A, $semver-regexp))">
            <xsl:message terminate="yes" expand-text="yes">{$A} is not a valid semantic version.</xsl:message>
        </xsl:if>
        <xsl:if test="not(matches($B, $semver-regexp))">
            <xsl:message terminate="yes" expand-text="yes">{$B} is not a valid semantic version.</xsl:message>
        </xsl:if>

        <!-- Remove build metadata, which is irrelevant for precedence. -->
        <xsl:variable name="remove-build-metadata" as="function(*)" select="
            function ($str as xs:string) as xs:string {
            replace($str, '\+.*$', '')
            }"/>
        <xsl:variable name="A-trunc" as="xs:string" select="$remove-build-metadata($A)"/>
        <xsl:variable name="B-trunc" as="xs:string" select="$remove-build-metadata($B)"/>
        <xsl:variable name="A-numeric-parts" as="xs:integer+"
            select="v:version-to-xyz(normalize-space($A-trunc), false()) ! xs:integer(.)"/>
        <xsl:variable name="B-numeric-parts" as="xs:integer+"
            select="v:version-to-xyz(normalize-space($B-trunc), false()) ! xs:integer(.)"/>

        <!-- Check if the x.y.z parts of $A and $B differ. After finding a difference,
            break out of the loop because the remainder of the string is irrelevant. -->
        <xsl:variable name="comparison-of-xyz" as="xs:integer?">
            <xsl:iterate select="(1, 2, 3)">
                <xsl:variable name="index" select="."/>
                <xsl:variable name="A-this-part" as="xs:integer" select="$A-numeric-parts[$index]"/>
                <xsl:variable name="B-this-part" as="xs:integer" select="$B-numeric-parts[$index]"/>
                <xsl:choose>
                    <xsl:when test="$A-this-part lt $B-this-part">
                        <!-- $A is older -->
                        <xsl:sequence select="xs:integer(-1)"/>
                        <xsl:break/>
                    </xsl:when>
                    <xsl:when test="$A-this-part gt $B-this-part">
                        <!-- $A is newer -->
                        <xsl:sequence select="xs:integer(1)"/>
                        <xsl:break/>
                    </xsl:when>
                </xsl:choose>
            </xsl:iterate>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$A-trunc eq $B-trunc">
                <xsl:sequence select="xs:integer(0)"/>
            </xsl:when>
            <xsl:when test="exists($comparison-of-xyz)">
                <!-- $A and $B differ in their x.y.z pattern. No need to consider pre-release descriptors. -->
                <xsl:sequence select="$comparison-of-xyz"/>
            </xsl:when>
            <xsl:when test="(contains($A-trunc, '-')) and not(contains($B-trunc, '-'))">
                <!-- $A and $B have the same x.y.z pattern, and only $A has a pre-release descriptor. $A is older. -->
                <xsl:sequence select="xs:integer(-1)"/>
            </xsl:when>
            <xsl:when test="not(contains($A-trunc, '-')) and (contains($B-trunc, '-'))">
                <!-- $A and $B have the same x.y.z pattern, and only $B has a pre-release descriptor. $B is older. -->
                <xsl:sequence select="xs:integer(1)"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- $A and $B differ only in their pre-release descriptors, which both exist and which we compare here. -->
                <xsl:variable name="A-pre-release-parts" as="xs:string+"
                    select="$A-trunc => substring-after('-') => tokenize('\.')"/>
                <xsl:variable name="B-pre-release-parts" as="xs:string+"
                    select="$B-trunc => substring-after('-') => tokenize('\.')"/>
                <xsl:variable name="comparison-of-pre-release" as="xs:integer?">
                    <xsl:iterate select="1 to max( (count($A-pre-release-parts), count($B-pre-release-parts)) )">
                        <xsl:variable name="index" select="."/>
                        <xsl:variable name="A-this-part" as="xs:string?" select="$A-pre-release-parts[$index]"/>
                        <xsl:variable name="B-this-part" as="xs:string?" select="$B-pre-release-parts[$index]"/>
                        <xsl:variable name="has-non-numeric" as="function(*)" select="
                            function ($str as xs:string) as xs:boolean {
                            matches($str, '[a-zA-Z-]')
                            }"/>
                        <xsl:choose>
                            <xsl:when test="empty($A-this-part)">
                                <!-- $A doesn't have this part (and $B does, or else $index would exceed max(...) in xsl:iterate). $B is newer. -->
                                <xsl:sequence select="xs:integer(-1)"/>
                                <xsl:break/>
                            </xsl:when>
                            <xsl:when test="empty($B-this-part)">
                                <!-- $B doesn't have this part (and $A does). $A is newer. -->
                                <xsl:sequence select="xs:integer(1)"/>
                                <xsl:break/>
                            </xsl:when>
                            <!-- Beyond this point, $A and $B have nonempty items to compare. -->
                            <xsl:when test="$A-this-part eq $B-this-part">
                                <!-- Skip to next iteration. -->
                            </xsl:when>
                            <xsl:when test="($has-non-numeric($A-this-part)) and not($has-non-numeric($B-this-part))">
                                <!-- $A is newer because numeric identifiers have lower precedence than non-numeric identifiers. -->
                                <xsl:sequence select="xs:integer(1)"/>
                                <xsl:break/>
                            </xsl:when>
                            <xsl:when test="not($has-non-numeric($A-this-part)) and ($has-non-numeric($B-this-part))">
                                <!-- $B is newer because numeric identifiers have lower precedence than non-numeric identifiers. -->
                                <xsl:sequence select="xs:integer(-1)"/>
                                <xsl:break/>
                            </xsl:when>
                            <!-- Beyond this point, both identifiers are all-numeric or neither is all-numeric. -->
                            <xsl:when test="$has-non-numeric($A-this-part)">
                                <xsl:sequence select="compare($A-this-part, $B-this-part)"/>
                                <xsl:break/>
                            </xsl:when>
                            <xsl:when test="number($A-this-part) lt number($B-this-part)">
                                <xsl:sequence select="xs:integer(-1)"/>
                                <xsl:break/>
                            </xsl:when>
                            <xsl:when test="number($A-this-part) gt number($B-this-part)">
                                <xsl:sequence select="xs:integer(1)"/>
                                <xsl:break/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:iterate>
                </xsl:variable>
                <xsl:sequence select="$comparison-of-pre-release"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <!-- Compare two strings for precedence according to Semantic Versioning 2.0.0.
        If the strings are not valid version strings, then they must be modifiable
        in specific ways to produce valid version strings. 

        Parameters:
        * $A: Version string.
        * $B: Version string.
        * $options: Map that determines ways in which the function can handle
          $A and $B if they are not valid version strings. The default behavior
          if any option is omitted or false is not to allow the handling described.

          Keys in $options map:
          * 'normalize-space': If true, normalize space in each string.
          * 'supply-missing-zeros': If true, supply missing y or z as zero.
          * 'remove-leading-zeros': If true, remove leading zeros from x, y, or z.
          * 'allow-empty-string': If true, empty string is allowed and considered the
            oldest possible version.

        Return values, imitating the XPath compare() function for strings:
        * -1 if $A is older than $B
        *  0 if $A and $B indicate the same version, not counting build metadata
        *  1 if $A is newer than $B
    -->
    <xsl:function name="v:compare" as="xs:integer">
        <xsl:param name="A" as="xs:string"/>
        <xsl:param name="B" as="xs:string"/>
        <xsl:param name="options" as="map(*)?"/>
        <xsl:choose>
            <xsl:when test="($A = '' or $B = '') and $options('allow-empty-string')">
                <xsl:sequence select="compare($A, $B)"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- Modify $A and $B as $options indicates, and call the v:compare
                    function implementation that assumes valid inputs. At that point,
                    if either input is still not a valid Semantic Version 2.0.0
                    string, that function will issue a fatal error. -->
                <xsl:sequence select="v:compare(
                    v:normalize-version($A, $options),
                    v:normalize-version($B, $options)
                    )"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- Modify $str as the $options map indicates, in an effort to make $str
        a valid Semantic Versioning 2.0.0 string.

        Parameters:
        * $str: String.
        * $options: Map that determines modifications the function applies to
          $str. The default behavior if any option is omitted or false is not
          to perform the modification described.

          Keys in $options map:
          * 'normalize-space': If true, normalize space in $str.
          * 'supply-missing-zeros': If true, supply missing y or z as zero.
          * 'remove-leading-zeros': If true, remove leading zeros from x, y, or z.        
    -->
    <xsl:function name="v:normalize-version" as="xs:string">
        <xsl:param name="str" as="xs:string"/>
        <xsl:param name="options" as="map(*)"/>
        <xsl:sequence select="$str
            => v:normalize-space-option($options('normalize-space'))
            => v:supply-missing-zeros($options('supply-missing-zeros'))
            => v:remove-leading-zeros($options('remove-leading-zeros'))
            "/>
    </xsl:function>

    <!-- ======================================= -->
    <!-- Helper functions -->

    <!-- Normalize space in $str, if $option is true. If $option
        is false or empty, return $str unchanged.
    
        Assumptions about content of $str: None
    -->
    <xsl:function name="v:normalize-space-option" as="xs:string">
        <xsl:param name="str" as="xs:string"/>
        <xsl:param name="option" as="xs:boolean?"/>
        <xsl:sequence select="if ($option) then normalize-space($str) else $str"/>
    </xsl:function>

    <!-- Supply missing zeros in y or z spots of $str if $option is true,
        e.g., convert 1.2 to 1.2.0 and 1 to 1.0.0. If $option is false
        or empty, return $str unchanged.
    
        Assumptions about content of $str: Series of one to three nonnegative numeric
        identifiers separated by dots, optionally followed by a hyphen and
        more string content.
    -->
    <xsl:function name="v:supply-missing-zeros" as="xs:string">
        <xsl:param name="str" as="xs:string"/>
        <xsl:param name="option" as="xs:boolean?"/>
        <xsl:choose>
            <xsl:when test="$option">
                <xsl:variable name="prerelease-part" as="xs:string"
                    select="substring-after($str,'-')"/>
                <xsl:variable name="modified-xyz-part" as="xs:string"
                    select="$str
                    => v:version-to-xyz(true())
                    => string-join('.')
                    "/>
                <xsl:sequence select="
                    if ($prerelease-part != '')
                    then concat($modified-xyz-part, '-', $prerelease-part)
                    else $modified-xyz-part
                    "/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="$str"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- Remove leading zeros from numeric identifiers in $str if
        $option is true. If $option is false or empty, return
        $str unchanged.
        
        Assumptions about content of $str: Series of dot-separated
        identifiers, optionally followed by a hyphen and another
        series of dot-separated identifiers.
    -->
    <xsl:function name="v:remove-leading-zeros" as="xs:string">
        <xsl:param name="str" as="xs:string"/>
        <xsl:param name="option" as="xs:boolean?"/>
        <xsl:choose>
            <xsl:when test="$option">
                <xsl:variable name="xyz-part" as="xs:string" select="replace($str, '\-.*$', '')"/>
                <xsl:variable name="prerelease-part" as="xs:string" select="substring-after($str, '-')"/>
                <!-- If $str contains no hyphens, $xyz-part equals $str and $prerelease part equals ''. -->

                <!-- Tokenize string by dots, and remove leading zeros from each identifier
                    that is a nonnegative number with at least one leading zero. -->
                <xsl:variable name="identifier-seq-without-leading-zeros" as="function(*)"
                    select="function($s as xs:string) as xs:string* {
                    for $part in tokenize($s, '\.')
                    return
                        if (matches($part,'^0[0-9]+$'))
                        then xs:string(xs:integer($part))
                        else $part
                    }"/>
                <xsl:variable name="modified-xyz-parts" as="xs:string+"
                    select="$identifier-seq-without-leading-zeros($xyz-part)"/>
                <xsl:variable name="modified-prerelease-parts" as="xs:string*"
                    select="$identifier-seq-without-leading-zeros($prerelease-part)"/>

                <!-- Join the individual identifiers with dots, and then join the xyz string to the 
                    prerelease string with a hyphen. The purpose of the [.] predicate is to
                    make $modified-prerelease-part-or-empty-seq an empty sequence rather than
                    an empty string, in case there is no prerelease part. That way, the return
                    value of this function does not have a trailing hyphen (e.g., 1.2.3-) in that case. -->
                <xsl:variable name="modified-prerelease-part-or-empty-seq" as="xs:string?"
                    select="string-join($modified-prerelease-parts, '.')[.]"/>
                <xsl:sequence select="string-join(
                    (string-join($modified-xyz-parts, '.'), $modified-prerelease-part-or-empty-seq),
                    '-')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="$str"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- Parse a version string, $ver, and return 3 numbers as strings.
        Choice of error handling:
        * If $supply-missing-zeros is true, use zero for 2nd or 3rd number
          if it is missing from $ver.
        * If $supply-missing-zeros is false, error if 2nd or 3rd number is missing.

        Example: $ver='1.2.3'. Returns ('1', '2', '3').
        Example: $ver='1.2', $supply-missing-zeros=true. Returns ('1', '2', '0').
        Example: $ver='1.2', $supply-missing-zeros=false. Returns error.
        
        Assumptions about content of $ver: Series of one to three nonnegative
        numeric identifiers separated by dots, optionally followed by more
        string content that the function ignores.
    -->
    <xsl:function name="v:version-to-xyz" as="xs:string+">
        <xsl:param name="ver" as="xs:string"/>
        <xsl:param name="supply-missing-zeros" as="xs:boolean"/>
        <xsl:analyze-string select="$ver" regex="^([0-9]+)(\.([0-9]+))?(\.([0-9]+))?">
            <xsl:matching-substring>
                <xsl:sequence select="regex-group(1)"/>
                <xsl:choose>
                    <xsl:when test="$supply-missing-zeros">
                        <!-- Second and third numbers if present, or zero as default-->
                        <xsl:sequence select="(regex-group(3), '0')[.][1]"/>
                        <xsl:sequence select="(regex-group(5), '0')[.][1]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- Second and third numbers. If either one is not present,
                        these instructions will return an empty string. Note that an
                        empty string cannot be converted to xs:integer. -->
                        <xsl:sequence select="regex-group(3)"/>
                        <xsl:sequence select="regex-group(5)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:function>
</xsl:stylesheet>