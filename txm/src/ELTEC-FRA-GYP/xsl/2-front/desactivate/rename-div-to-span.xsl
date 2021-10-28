<!-- The Identity Transformation -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Whenever you match any node or any attribute -->
  <xsl:template match="node()|@*">
    <!-- Copy the current node -->
    <xsl:copy>
      <!-- Including any attributes it has and any child nodes -->
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="*:div[@txmPlane='out-of-text-to-edit']">
      <xsl:element name="span">
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates select="node()"/>
      </xsl:element>
  </xsl:template>
    
</xsl:stylesheet>
