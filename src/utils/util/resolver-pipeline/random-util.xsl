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

    <!-- Set $germ to a string for reproducible outputs of r:make-uuid.
         Pass in a blind value - and don't save it - for irreproducible outputs. -->

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

    <!-- r:make-uuid produces one v4 UUID. Output is repeatable for a given seed.
         If the random-number-generator() function is not available,
         this function returns an empty sequence. -->
    <xsl:function name="r:make-uuid" as="xs:string?">
        <xsl:param name="seed" as="item()"/>
        <xsl:sequence select="r:make-uuid-sequence($seed, 1)"/>
    </xsl:function>

    <!-- r:make-uuid-sequence produces a sequence of $seq-length v4 UUIDs.
         Output is repeatable for a given seed. If the random-number-generator()
         function is not available, this function returns an empty sequence. -->
    <xsl:function name="r:make-uuid-sequence" as="xs:string*">
        <xsl:param name="seed" as="item()"/>
        <xsl:param name="seq-length" as="xs:integer"/>
        <xsl:variable name="uuid-v4-template" as="xs:string">________-____-4___-=___-____________</xsl:variable>
        <!--                                                 a847eaab-cec8-41bd-98e2-02d02900b554            -->
        <xsl:sequence select="r:make-random-string-sequence($seed, $seq-length, $uuid-v4-template)"/>
    </xsl:function>

    <!-- r:make-random-string-sequence produces a sequence of $seq-length strings.
         The $template parameter specifies the pattern of characters in each
         string, where:
           * '_' becomes a random hex value 0-9a-f
           * '=' becomes one of '8','9','a','b' at random
           * Any other character is copied to the output string
         Output is repeatable for a given seed. If the random-number-generator()
         function is not available, this function returns an empty sequence. -->
    <xsl:function name="r:make-random-string-sequence" as="xs:string*">
        <xsl:param name="seed" as="item()"/>
        <xsl:param name="seq-length" as="xs:integer"/>
        <xsl:param name="template" as="xs:string"/>
        <xsl:sequence use-when="function-available('random-number-generator')">
            <xsl:variable name="PRNG" as="map(xs:string, item())" select="random-number-generator($seed)"/>
            <xsl:variable name="template-length" as="xs:integer" select="string-length($template)"/>
            <!-- Draw one long stream from PRNG, advancing state in each iteration. -->
            <xsl:variable name="random-chars" as="xs:string">
                <xsl:value-of>
                    <xsl:iterate select="(0 to ($seq-length * $template-length - 1))">
                        <xsl:param name="PRNG" as="map(xs:string, item())" select="$PRNG"/>
                        <xsl:variable name="this-char" as="xs:string"
                            select="substring($template, (1 + current() mod $template-length), 1)"/>
                        <xsl:apply-templates select="$this-char" mode="uuid-char">
                            <xsl:with-param name="PRNG" select="$PRNG"/>
                        </xsl:apply-templates>
                        <xsl:next-iteration>
                            <xsl:with-param name="PRNG" select="$PRNG?next()"/>
                        </xsl:next-iteration>
                    </xsl:iterate>
                </xsl:value-of>
            </xsl:variable>
            <!-- Divide $random-chars into nonoverlapping strings:
                $seq-length of them, each of length $template-length. -->
            <xsl:sequence select="for $idx in (0 to $seq-length - 1)
                return substring($random-chars, 1 + $idx * $template-length, $template-length)"/>
        </xsl:sequence>
    </xsl:function>

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
