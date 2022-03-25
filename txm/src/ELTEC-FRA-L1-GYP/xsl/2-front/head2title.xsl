<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xd="http://www.pnp-software.com/XSLTdoc"
  xmlns:edate="http://exslt.org/dates-and-times"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="tei edate xd" version="2.0">
 
  <xd:doc type="stylesheet">
    <xd:copyright>2021, ENS de Lyon / IHRIM (Cactus)</xd:copyright>
    <xd:author>Serge Heiden slh@ens-lyon.fr</xd:author>
  </xd:doc>
  

  <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes"/>

  <xsl:template match="/ | @* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[tei:head]">
    <xsl:element name="{name()}" namespace="{namespace-uri()}">
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="title">
        <xsl:variable name="text" select="descendant::tei:head"/>
        <xsl:variable name="text_str" >
          <xsl:for-each select="$text" >
            <xsl:if test="position() > 1 "> </xsl:if>
            <xsl:value-of select="."/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="normalize-space($text_str)"/>
      </xsl:attribute>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>


