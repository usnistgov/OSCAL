<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math r"
    xmlns:r="http://csrc.nist.gov/ns/random" version="3.0">

    <!-- from the spec https://www.w3.org/TR/xpath-functions-31/#func-random-number-generator

declare %public function r:random-sequence($length as xs:integer) as xs:double* {
  r:random-sequence($length, fn:random-number-generator())
};

declare %private function r:random-sequence($length as xs:integer,
                                            $G as map(xs:string, item())) {
  if ($length eq 0)
  then ()
  else ($G?number, r:random-sequence($length - 1, $G?next()))
};

r:random-sequence(200);

v4 UUID
   hex fields 8 4 4 4 12
     place 13 = 4
     place 17 = 8-b

    -->
    <xsl:output indent="yes"/>

    <!-- set $germ to a string for reproducible outputs of r:make-uuid-sequence
         pass in a blind value - and don't save it - for irreproducible outputs -->

    <xsl:param name="germ" select="current-dateTime() || document-uri(/)"/>

    <!-- for testing random number features   -->
    <xsl:template match="/" name="xsl:initial-template" expand-text="true">
        <!--<uuid><xsl:value-of select="uuid:randomUUID()" xmlns:uuid="java:java.util.UUID"/></uuid>-->
        <randomness>
            <now>{ r:make-uuid(current-dateTime()) }</now>
            <germ>{ r:make-uuid($germ) }</germ>
            <a>{ r:make-uuid('a') }</a>
            <a>{ r:make-uuid('a') }</a>
            <b>{ r:make-uuid('b') }</b>
            <ten>
                <xsl:for-each select="r:make-uuid-sequence($germ, 10)">
                    <uuid>{ . }</uuid>
                </xsl:for-each>
            </ten>
        </randomness>
    </xsl:template>

    <xsl:function name="r:make-uuid-sequence" as="xs:string*">
        <xsl:param name="seed" as="item()"/>
        <xsl:param name="length" as="xs:integer"/>
        <xsl:sequence use-when="function-available('random-number-generator')" select="r:produce-uuid-sequence($length,random-number-generator($seed))"/>
    </xsl:function>

    <xsl:function name="r:produce-uuid-sequence" as="xs:string*">
        <xsl:param name="length" as="xs:integer"/>
        <xsl:param name="PRNG" as="map(xs:string, item())"/>
        <xsl:if test="$length gt 0">
            <xsl:sequence select="string($PRNG?number) => r:make-uuid()"/>
            <xsl:sequence select="r:produce-uuid-sequence($length - 1, $PRNG?next())"/>
        </xsl:if>
    </xsl:function>

    <!-- make-uuid produces a UUID for a given seed - the same UUID every time for the same seed -->
    <xsl:function name="r:make-uuid" as="xs:string?">
        <xsl:param name="seed" as="item()"/>
        <xsl:sequence use-when="function-available('random-number-generator')" select="r:produce-uuid($uuid-v4-template, random-number-generator($seed))"/>
    </xsl:function>

    <!--$template is a string to serve as a template for the UUID syntax
        $PRNG is a pseudo-random-number generator produced by fn:random-number-generator() -->
    <xsl:function name="r:produce-uuid" as="xs:string">
        <xsl:param name="template" as="xs:string"/>
        <xsl:param name="PRNG" as="map(xs:string, item())"/>
        <xsl:value-of>
            <xsl:apply-templates select="substring($template, 1, 1)" mode="uuid-char">
                <xsl:with-param name="PRNG" select="$PRNG"/>
            </xsl:apply-templates>
            <xsl:if test="matches($template, '.')">
                <xsl:sequence select="r:produce-uuid(substring($template, 2), $PRNG?next())"/>
            </xsl:if>
        </xsl:value-of>
    </xsl:function>

    <xsl:variable name="uuid-v4-template" as="xs:string">________-____-4___-=___-____________</xsl:variable>
    <!--                                                 a847eaab-cec8-41bd-98e2-02d02900b554            -->
    <!-- replacements for UUID v4:
           '_' becomes a random hex value 0-9a-f
           '=' becomes one of '8','9','a','b' at random
           any other character is copied -->

    <xsl:variable name="hex-digits" select="tokenize('0 1 2 3 4 5 6 7 8 9 a b c d e f', ' ')"/>

    <xsl:template match=".[. = '_']" mode="uuid-char">
        <xsl:param name="PRNG" as="map(xs:string, item())"/>
        <xsl:sequence select="$PRNG?permute($hex-digits)[1]"/>
    </xsl:template>

    <xsl:template match=".[. = '=']" mode="uuid-char">
        <xsl:param name="PRNG" as="map(xs:string, item())"/>
        <xsl:sequence select="$PRNG?permute(('8', '9', 'a', 'b'))[1]"/>
    </xsl:template>

</xsl:stylesheet>
