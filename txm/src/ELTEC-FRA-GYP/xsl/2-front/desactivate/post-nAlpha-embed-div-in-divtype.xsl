<!--
Copyright © 2019 ENS de Lyon, CNRS, University of Franche-Comté
Licensed under the terms of the GNU General Public License (http://www.gnu.org/licenses)
@author sheiden
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Whenever you match any node or any attribute -->
  <xsl:template match="node()|@*">
    <!-- Copy the current node -->
    <xsl:copy>
      <!-- Including any attributes it has and any child nodes -->
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="*:div[@type='part']">    
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="part">
        <xsl:apply-templates select="@n"/>
        <xsl:apply-templates select="@nAlpha"/>
        <xsl:apply-templates select="@title"/>
        <xsl:apply-templates select="node()"/>
      </xsl:element>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="*:div[@type='chapter']">    
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="chapter">
        <xsl:apply-templates select="@n"/>
        <xsl:apply-templates select="@nAlpha"/>
        <xsl:apply-templates select="@title"/>
        <xsl:apply-templates select="node()"/>
      </xsl:element>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="*:div[@type='section']">    
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="section">
        <xsl:apply-templates select="@n"/>
        <xsl:apply-templates select="@nAlpha"/>
	<xsl:attribute name="title"><xsl:value-of select="normalize-space(*:p[1])"/></xsl:attribute>
        <xsl:apply-templates select="node()"/>
      </xsl:element>
    </xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>
