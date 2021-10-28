<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:edate="http://exslt.org/dates-and-times"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:xd="http://www.pnp-software.com/XSLTdoc"
  exclude-result-prefixes="tei edate xd"
  version="2.0">

  <xd:doc type="stylesheet">
    <xd:copyright>2021, ENS de Lyon / IHRIM (Cactus)</xd:copyright>
    <xd:author>Serge Heiden slh@ens-lyon.fr</xd:author>
  </xd:doc>

  <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="no"/> 

  <!-- by default, copy -->  
  <xsl:template match="*">      
        <xsl:copy>
          <xsl:apply-templates select="*|@*|processing-instruction()|comment()|text()"/>
        </xsl:copy>    
  </xsl:template>
  
  <xsl:template match="*" mode="position"><xsl:value-of select="count(preceding-sibling::*)"/></xsl:template>

  <xsl:template match="@*|comment()|processing-instruction()">
    <xsl:copy/>
  </xsl:template>

  <!-- use the source filename as the text ID -->
  <xsl:variable name="filename">
    <xsl:analyze-string select="document-uri(.)" regex="^(.*)/([^/]+)\.xml$">
      <xsl:matching-substring>
        <xsl:value-of select="regex-group(2)"/>
      </xsl:matching-substring>
    </xsl:analyze-string>
  </xsl:variable>
  
  <xsl:template match="*:w">

    <!-- default concordance reference -->
    <xsl:variable name="ref">
      <!-- text identifier -->
      <xsl:value-of select="$filename"/>
      <!-- chapter number -->
      <xsl:if test="ancestor::*:chapter[1]/@n">
          <xsl:text>, </xsl:text>
        <xsl:value-of select="ancestor::*:chapter[1]/@n"/>
      </xsl:if>
      <!-- page number -->
      <xsl:if test="preceding::*:pb[1]/@n">
        <xsl:text>, p.</xsl:text><xsl:value-of select="preceding::*:pb[1]/@n"/>
      </xsl:if>
  </xsl:variable>
 
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="ref"><xsl:value-of select="$ref"/></xsl:attribute>
      <xsl:apply-templates select="*|processing-instruction()|comment()|text()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
