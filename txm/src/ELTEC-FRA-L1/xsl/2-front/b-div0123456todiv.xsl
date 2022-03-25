<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xd="http://www.pnp-software.com/XSLTdoc"
  xmlns:edate="http://exslt.org/dates-and-times"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:txm="http://textometrie.org/ns/1.0"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.tei-c.org/ns/1.0"
  version="2.0">

  <xd:doc type="stylesheet">
    <xd:copyright>2017, ENS de Lyon / IHRIM (Cactus), Licensed under the terms of the GNU General Public License (http://www.gnu.org/licenses)</xd:copyright>
    <xd:author>Serge Heiden slh@ens-lyon.fr</xd:author>
  </xd:doc>


  <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="no"/> 
  
  <!-- General patterns: all elements, attributes, comments and processing instructions are copied -->
  
  <xsl:template match="*">      
        <xsl:copy>
          <xsl:apply-templates select="*|@*|processing-instruction()|comment()|text()"/>
        </xsl:copy>    
  </xsl:template>
  
  <xsl:template match="*" mode="position"><xsl:value-of select="count(preceding-sibling::*)"/></xsl:template>

  <xsl:template match="@*|comment()|processing-instruction()">
    <xsl:copy/>
  </xsl:template>

  <xsl:template match="*:div0|*:div1|*:div2|*:div3|*:div4|*:div5|*:div6">
    <div xmlns="http://www.tei-c.org/ns/1.0">
      <xsl:attribute name="divType"><xsl:value-of select="name()"/></xsl:attribute>
      <xsl:apply-templates select="*|@*|processing-instruction()|comment()|text()"/>
    </div>
  </xsl:template>

</xsl:stylesheet>

