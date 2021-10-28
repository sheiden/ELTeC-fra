<?xml version="1.0"?>
<xsl:stylesheet
   version="2.0"
  xmlns:xd="http://www.pnp-software.com/XSLTdoc"
  xmlns:edate="http://exslt.org/dates-and-times"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="tei edate xd">
 
  <xd:doc type="stylesheet">
    <xd:short>
      Feuille de style d'ajout de lettrine. 
    </xd:short>
    <xd:author>sheiden, Serge Heiden, slh@ens-lyon.fr</xd:author>
    <xd:copyright>2016 ENS de Lyon, CNRS, University of Franche-Comté, Licensed under the terms of the GNU General Public License (http://www.gnu.org/licenses)</xd:copyright>
  </xd:doc>
  
  <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>
  
<xsl:template match="tei:p[tei:seg/@rend='decorInit']">
    <xsl:copy>
        <xsl:apply-templates select="@*"/>
        <xsl:attribute name="rend">txmlettrinep</xsl:attribute>
        <xsl:apply-templates select="node()"/>
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>

