<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:template match="node()|@*">
        <!-- Copy the current node -->
        <xsl:copy>
            <!-- Including any attributes it has and any child nodes -->
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*:w">
        <!--<xsl:variable name="ref">
	    <!-\- <xsl:text>Leviathan, </xsl:text>-\->
            <!-\- <xsl:value-of select="ancestor::*:TEI/*:teiHeader/*:fileDesc/*:titleStmt[1]/*:title[2]"/> -\->
            <xsl:choose>
                <xsl:when test="ancestor::*:div1[@type='part'][@n]">
                    <xsl:text>part </xsl:text>
                    <xsl:value-of select="ancestor::*:div1[@type='part']/@n"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="ancestor::*:div2[@type='chapter'][@n]">
                    <xsl:text>, ch. </xsl:text>
                    <xsl:value-of select="ancestor::*:div2[@type='chapter']/@n"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="preceding::*:pb[1][@n]">
                    <xsl:text>, p. </xsl:text>
                    <xsl:value-of select="preceding::*:pb[1]/@n"/>
                </xsl:when>
                <xsl:otherwise>, NP</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>-->
        <xsl:choose>
            <xsl:when test="preceding-sibling::*[1][self::*:seg[@rend='decorInit']]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <!--<xsl:attribute name="ref">
                        <xsl:value-of select="$ref"/>
                    </xsl:attribute>-->
                    <seg xmlns="http://www.tei-c.org/ns/1.0">
                        <xsl:value-of select="preceding-sibling::*[1]"/>
                    </seg>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test="parent::*:seg[@rend='decorInit']"></xsl:when>
            <xsl:when test="following-sibling::*[1][self::*:g[@ref='char:EOLhyphen']]">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <!--<xsl:attribute name="ref">
                        <xsl:value-of select="$ref"/>
                    </xsl:attribute>-->
                    <xsl:apply-templates/>
                    <!-- insert <lb/> here if appropriate -->
                    <xsl:apply-templates select="following::*:w[1]/node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test="preceding-sibling::*[1][self::*:g[@ref='char:EOLhyphen']]">
                <xsl:comment>Word end after line break: <xsl:value-of select="."/></xsl:comment>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <!--<xsl:attribute name="ref">
                        <xsl:value-of select="$ref"/>
                    </xsl:attribute>-->
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    
    
    
</xsl:stylesheet>
