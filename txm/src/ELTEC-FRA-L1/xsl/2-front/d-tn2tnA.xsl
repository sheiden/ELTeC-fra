<xsl:stylesheet
  xmlns:xd="http://www.pnp-software.com/XSLTdoc"
  xmlns:edate="http://exslt.org/dates-and-times"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:txm="http://textometrie.org/ns/1.0"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.tei-c.org/ns/1.0"
  version="2.0">
   <!--exclude-result-prefixes="#all" -->

  <xd:doc type="stylesheet">
    Prefixing chapter@n and letter@n by zeros ('0') to help alphabetical sort of integers.
    <xd:copyright>2019, ENS de Lyon / IHRIM (Cactus), Cette feuille est sous licence publique générale GNU amoindrie (voir http://www.gnu.org/licenses/lgpl.html).</xd:copyright>
    <xd:author>Michel Capot dans le cadre du projet DTH (UMR IHRIM) à l'Ecole Normale Supérieure de Lyon</xd:author>
    <xd:author>Serge Heiden slh@ens-lyon.fr</xd:author>
  </xd:doc>
  
    <!-- Whenever you match any node or any attribute -->
    <xsl:template match="node()|@*">
        <!-- Copy the current node -->
        <xsl:copy>
            <!-- Including any attributes it has and any child nodes -->
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="txm:group|txm:chapter|txm:letter">
        <xsl:copy>
            <xsl:attribute name="txm-nA">
                <xsl:number value="attribute::txm-n" format="001"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>  
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
