<xsl:stylesheet
  xmlns:xd="http://www.pnp-software.com/XSLTdoc"
  xmlns:edate="http://exslt.org/dates-and-times"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:txm="http://textometrie.org/ns/1.0"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="#all"
  version="2.0">

  <xd:doc type="stylesheet">
    <xd:copyright>2019, ENS de Lyon / IHRIM (Cactus), Licensed under the terms of the GNU General Public License (http://www.gnu.org/licenses)</xd:copyright>
    <xd:author>Serge Heiden slh@ens-lyon.fr</xd:author>
  </xd:doc>
  
  <!-- Whenever you match any node or any attribute -->
  <xsl:template match="node()|@*">
    <!-- Copy the current node -->
    <xsl:copy>
      <!-- Including any attributes it has and any child nodes -->
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
    
  <xsl:template match="div[@type=('titlepage', 'liminal', 'chapter', 'letter', 'group', 'notes')]">
    <xsl:variable name="element-name" select="@type"/> 
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:element name="{$element-name}" namespace="http://textometrie.org/ns/1.0">
        <xsl:apply-templates select="@title"/>
        <xsl:apply-templates select="@txm-n"/>
        <xsl:apply-templates select="node()"/>
      </xsl:element>
    </xsl:copy>
  </xsl:template>

 </xsl:stylesheet>
