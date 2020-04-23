<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:d="http://www.daisy.org/z3986/2005/dtbook/"
    exclude-result-prefixes="xs h d"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    
    xmlns="http://www.tei-c.org/ns/1.0" 
    version="2.0">

<xsl:param name="textId">FRA00000</xsl:param>
<xsl:param name="sexKey">M</xsl:param>
    
<xsl:variable name="wordCount">
    <xsl:value-of
        select="
        string-length(normalize-space(//d:book))
        -
        string-length(translate(normalize-space(//d:book), ' ', '')) + 1"
    />
</xsl:variable>
    <xsl:variable name="sizeKey">
        <xsl:choose>
            <xsl:when test="xs:integer($wordCount) le 50000">short</xsl:when>
            <xsl:when test="xs:integer($wordCount) le 100000">medium</xsl:when>
            <xsl:when test="xs:integer($wordCount) gt 100000">long</xsl:when>
        </xsl:choose>
    </xsl:variable>

<xsl:variable name="date">
 <xsl:value-of select="//d:head/d:meta[@name='dc:Coverage']/@content"/>
<!-- or maybe 
    <xsl:value-of select="d:head/d:meta[@name='dcterms:issued']/@value"/>
    -->
</xsl:variable>
    
    <xsl:variable name="timeKey">
            <xsl:choose>
                <xsl:when test="$date le '1859'">T1</xsl:when>
                <xsl:when test="$date le '1879'">T2</xsl:when>
                <xsl:when test="$date le '1899'">T3</xsl:when>
                <xsl:when test="$date le '1920'">T4</xsl:when>
            </xsl:choose>
    </xsl:variable>
 
    
  <xsl:template match="d:dtbook">
      <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:lang="fr" xml:id="{$textId}">
          <xsl:apply-templates/>
      </TEI>
  </xsl:template>
    
    
    <xsl:template match="d:head">
    
       <teiHeader>           
           <fileDesc>
               <titleStmt>
                   <title><xsl:value-of select="substring-after(d:meta[@name='dc:Title']/@content, '.')"/> : ELTeC edition</title>
                   <author><xsl:value-of select="d:meta[@name='dc:Creator']/@content"/></author>
           <!-- or //doctitle and //docauthor -->            
               </titleStmt>
               <extent>
                  <measure unit="words"><xsl:value-of select="$wordCount"/></measure>
                  <measure unit="pages"><xsl:value-of select="count(//d:pagenum)"/></measure>
                </extent>
               <publicationStmt><p/>
                </publicationStmt>
               <sourceDesc>
                   <bibl type="digitalSource">
                   <ref>
                       <xsl:attribute name="target">
                           <xsl:value-of select="d:meta[@name='dc:Source']/@content"/>
                       </xsl:attribute>Gallica</ref></bibl>
                   <bibl type="firstEdition">
                       <publisher><xsl:value-of select="d:meta[@name='dc:Publisher']/@content"/></publisher>
                       <date><xsl:value-of select="$date"/></date></bibl>
               </sourceDesc>
           </fileDesc>
           <encodingDesc n="eltec-1">
               <p/>
           </encodingDesc>
           <profileDesc>
               <langUsage>
                   <language ident="fr">French</language>
               </langUsage>
               <textDesc>
                   <authorGender xmlns="http://distantreading.net/eltec/ns" key="{$sexKey}"/>
                   <size xmlns="http://distantreading.net/eltec/ns" key="{$sizeKey}"/>
                   <reprintCount xmlns="http://distantreading.net/eltec/ns" key="low"/>
                   <timeSlot xmlns="http://distantreading.net/eltec/ns" key="{$timeKey}"/>
               </textDesc>
           </profileDesc>
           <revisionDesc>
               <change when="2019-11-04">Generated by daisy2eltec script</change>
       </revisionDesc>
       </teiHeader>
   </xsl:template>
   
    <xsl:template match="d:book">
        <text>
            <xsl:apply-templates/>
        </text>
    </xsl:template>
    
    <xsl:template match="d:frontmatter">
        <front>
            <xsl:apply-templates/>
        </front>
    </xsl:template>
    
    <xsl:template match="d:docauthor"/>
    <xsl:template match="d:doctitle"/>
    <xsl:template match="d:level1[@class='half_title']"/>
    
    <xsl:template match="d:bodymatter">
        <body>
            <xsl:apply-templates/>
        </body>
    </xsl:template>
    
    <xsl:template match="d:pagenum">
        <pb>
            <xsl:if test="string-length(.) ge 1"><xsl:attribute name="n"><xsl:value-of select="."/></xsl:attribute></xsl:if>
        </pb>
    </xsl:template>
    <xsl:template match="d:imggroup">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="d:img">
        <gap unit="graphic" n="{@src}"/>
    </xsl:template>
    
    <xsl:template match="d:caption"/>
    
    <xsl:template match="d:p[@class='blanc']"/>
    <xsl:template match="d:p[starts-with(@class,'txt')]">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="d:level1[@class='chapter']">
        <div  type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="d:level1[@class='title']">
        <div  type="titlepage">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="d:level1[@class='info']">
        <div  type="liminal">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="d:h1">
        <head >
            <xsl:value-of select="d:span"/>
        </head>
    </xsl:template>
    
    <xsl:template match="d:em">
        <hi><xsl:apply-templates/></hi>
    </xsl:template>
    
    <xsl:template match="d:span">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="d:sup">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="* | @* | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:value-of select="."/>
        <!-- could normalize() here -->
    </xsl:template>
</xsl:stylesheet>