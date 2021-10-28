<!-- Copyright 2020 ENS de Lyon, CNRS, University of Franche-Comté, Licensed under the terms of the GNU General Public License v3 (http://www.gnu.org/licenses/gpl-3.0.html) @author sheiden -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<!-- identity transform -->
<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<xsl:template match="@facs2[ancestor::*:pb]">
    <xsl:attribute name="facs">
        <xsl:value-of select="."/>
    </xsl:attribute>
</xsl:template>

</xsl:stylesheet>

