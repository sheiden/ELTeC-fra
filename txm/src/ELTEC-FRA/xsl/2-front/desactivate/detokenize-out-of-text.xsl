<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:txm="http://textometrie.org/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns:xd="http://www.pnp-software.com/XSLTdoc" exclude-result-prefixes="#all"
	version="2.0">

	<xd:doc type="stylesheet">
		<xd:short>
			De-tokenise stylesheet
		</xd:short>
		<xd:detail>
			Description
			This is a basic stylesheet removing automatically inserted w tags and
			formatting white spaces:
			- no space before .,)]
			- no space after (['’
			- no-break space before :;!?

			With inputtype="xmltxm" parameter, the stylesheets takes XML-TEI TXM
			input format (with *:w/txm:form and *:w/txm:ana elements). Otherwise
			it takes files with word forms direct children of *:w.

			This stylesheet is free software; you can redistribute it and/or
			modify it under the terms of the GNU Lesser General Public
			License as published by the Free Software Foundation; either
			version 3 of the License, or (at your option) any later version.

			This stylesheet is distributed in the hope that it will be useful,
			but WITHOUT ANY WARRANTY; without even the implied warranty of
			MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
			Lesser General Public License for more details.

			You should have received a copy of GNU Lesser Public License with
			this stylesheet. If not, see http://www.gnu.org/licenses/lgpl.html
		</xd:detail>
		<xd:author>Alexei Lavrentiev alexei.lavrentev@ens-lyon.fr</xd:author>
		<xd:copyright>2019, CNRS / UMR 5317 IHRIM (CACTUS research group)</xd:copyright>
	</xd:doc>


	<xsl:param name="inputtype">
		xmltxm
	</xsl:param>

	<xsl:template match="node()|@*">
		<!-- Copy the current node -->
		<xsl:copy>
			<!-- Including any attributes it has and any child nodes -->
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

	<!-- Text body processing -->


	<!-- Word formatting for morphologically tagged texts -->
	<xsl:variable name="apostrophe" select='"&apos;"' />

	<xsl:template
		match="//text()[matches(.,'^\s+') and preceding-sibling::*[1][self::*:div[@txmPlane='out-of-text-to-edit']//*:w]]">
		<xsl:copy-of select="replace(.,'^\s+','')" />
	</xsl:template>


	<xsl:template match="*:div[@txmPlane='out-of-text-to-edit']//*:w">
		<xsl:choose>
			<xsl:when test="$inputtype='xmltxm'">
				<xsl:apply-templates select="txm:form" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:call-template name="spacing" />
	</xsl:template>

	<xsl:template match="txm:form">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template name="spacing">
		<xsl:choose>
			<xsl:when test="$inputtype='xmltxm'">
				<xsl:call-template name="spacing-xmltxm" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="spacing-xmlw" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="spacing-xmlw">
		<xsl:choose>
			<xsl:when test="ancestor::*:div[@txmPlane='out-of-text-to-edit']//*:w" />
			
			<!-- no space before .,)] -->
			<xsl:when test="following::*:div[@txmPlane='out-of-text-to-edit']//*:w[1][matches(.,'^\s*[.,)\]]+\s*$')]" />
			
			<!-- no space after (['’ -->
			<xsl:when test="matches(.,'^\s*[(\[‘]+$|\w(''|’)\s*$')"></xsl:when>
			
			<!-- no-break space before :;!? -->
			<xsl:when test="following::*:div[@txmPlane='out-of-text-to-edit']//*:w[1][matches(.,'^\s*[:;!?]+\s*$')]">
				<xsl:text>&#xa0;</xsl:text>
			</xsl:when>
			
			<!-- choice or supply -->
			<xsl:when test="position()=last() and (ancestor::*:choice or ancestor::*:supplied[not(@rend='multi_s')])"></xsl:when>
			
			<!-- note -->
			<xsl:when test="following-sibling::*[1][self::*:note]"></xsl:when>
			
			<xsl:otherwise>
				<xsl:text> </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="spacing-xmltxm">
		<xsl:choose>
			<xsl:when test="ancestor::*:div[@txmPlane='out-of-text-to-edit']//*:w" />
			<xsl:when
				test="following::*:div[@txmPlane='out-of-text-to-edit']//*:w[1][matches(descendant::txm:form[1],'^[.,)\]]+$')]" />
			<xsl:when test="matches(descendant::txm:form[1],'^[(\[‘]+$|\w(''|’)$')"></xsl:when>
			<xsl:when
				test="position()=last() and (ancestor::*:choice or ancestor::*:supplied[not(@rend='multi_s')])"></xsl:when>
			<xsl:when test="following-sibling::*[1][self::*:note]"></xsl:when>
			<xsl:when
				test="following::*:div[@txmPlane='out-of-text-to-edit']//*:w[1][matches(descendant::txm:form[1],'^[:;!?]+$')]">
				<xsl:text>&#xa0;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text> </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
