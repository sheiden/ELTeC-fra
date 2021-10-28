<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xd="http://www.pnp-software.com/XSLTdoc"
  xmlns:edate="http://exslt.org/dates-and-times"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="tei edate xd" version="2.0">
 
  <xd:doc type="stylesheet">
    <xd:short>
      Feuille de style de :
      - conversion de pc en w
      - suppression de c
      À utiliser comme prétraitement, par exemple avec l'import XML/w+CSV. 
    </xd:short>
    <xd:detail>
      This stylesheet is free software; you can redistribute it and/or
      modify it under the terms of the GNU Lesser General Public
      License as published by the Free Software Foundation; either
      version 3 of the License, or (at your option) any later version.
      
      This stylesheet is distributed in the hope that it will be useful,
      but WITHOUT ANY WARRANTY; without even the implied warranty of
      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
      Lesser General Public License for more details.
      
      You should have received a copy of GNU Lesser Public License with
      this stylesheet. If not, see http://www.gnu.org/licenses/lgpl.html
    </xd:detail>
    <xd:author>Serge Heiden slh@ens-lyon.fr</xd:author>
    <xd:copyright>2018, ENS de Lyon / IHRIM (Cactus)</xd:copyright>
  </xd:doc>
  

  <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>
    
  <xsl:template match="tei:pc">
    <tei:w>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="lemma"><xsl:value-of select="."/></xsl:attribute>
      <xsl:attribute name="pos">p</xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </tei:w>
  </xsl:template>

  <xsl:template match="tei:pc[not(child::node())]"/>

  <xsl:template match="tei:c"></xsl:template>
	
</xsl:stylesheet>

