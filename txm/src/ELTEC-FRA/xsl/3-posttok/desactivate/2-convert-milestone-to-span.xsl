<?xml version="1.0"?>
<!--
Copyright © 2021 ENS de Lyon, CNRS, University of Franche-Comté
Licensed under the terms of the GNU General Public License (http://www.gnu.org/licenses)
@author sheiden
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="*:milestone[@edRef='#tönnies']">
      <xsl:text>
</xsl:text>
      <xsl:element name="hi">
          <xsl:attribute name="rend">text-red-normal-bold-none</xsl:attribute>
        <xsl:element name="span">
          <xsl:copy-of select="@*"/>
          <xsl:text> [</xsl:text>
            <xsl:element name="ref">
              <xsl:attribute name="rend">text-red-normal-bold-none</xsl:attribute>
              <xsl:attribute name="target"><xsl:value-of select="@facs"/></xsl:attribute>
              <xsl:value-of select="@n"/>
            </xsl:element>
          <xsl:text>] </xsl:text>
        </xsl:element>
      </xsl:element>
  </xsl:template>
    
</xsl:stylesheet>

