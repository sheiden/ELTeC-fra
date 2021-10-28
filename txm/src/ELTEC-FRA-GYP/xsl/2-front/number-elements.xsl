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

  <xsl:template match="@*">
    <xsl:copy>
    </xsl:copy>
  </xsl:template>
    
  <xsl:template match="*[local-name()!='text']">    
      <xsl:copy>
        <xsl:apply-templates select="@*"/>
        <xsl:attribute name="tn"><xsl:number level="single"/></xsl:attribute>
        <xsl:apply-templates select="node()"/>
      </xsl:copy>
  </xsl:template>

  <xsl:template match="*:text">    
      <xsl:copy>
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates select="node()"/>
      </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
