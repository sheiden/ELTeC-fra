<!-- The Identity Transformation -->
<xsl:stylesheet xmlns:edate="http://exslt.org/dates-and-times"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all"
    version="2.0">
    
    <!-- Cette feuille est sous licence publique générale GNU amoindrie (voir http://www.gnu.org/licenses/lgpl.html). -->
    <!-- Elle a été élaborée par Michel Capot dans le cadre du projet DTH (UMR IHRIM) à l'Ecole Normale Supérieure de Lyon. -->
    
    <!-- Whenever you match any node or any attribute -->
    <xsl:template match="node()|@*">
        <!-- Copy the current node -->
        <xsl:copy>
            <!-- Including any attributes it has and any child nodes -->
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*:div[@type='part']">
        <xsl:copy>
            <xsl:attribute name="nAlpha">
                <xsl:number value="attribute::n" format="01"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>  
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*:div[@type='chapter']">
        <xsl:copy>
            <xsl:attribute name="nAlpha">
                <xsl:number value="attribute::n" format="01"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>  
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*:div[@type='section']">
        <xsl:copy>
            <xsl:attribute name="nAlpha">
                <xsl:number value="attribute::n" format="001"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>  
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
