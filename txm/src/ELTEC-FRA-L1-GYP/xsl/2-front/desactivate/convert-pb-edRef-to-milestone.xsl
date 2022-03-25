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
  
  <xsl:template match="*:pb[@edRef='#tönnies']">
      <xsl:element name="milestone" namespace="{namespace-uri()}">
        <xsl:copy-of select="@*"/>
      </xsl:element>
  </xsl:template>
    
</xsl:stylesheet>

