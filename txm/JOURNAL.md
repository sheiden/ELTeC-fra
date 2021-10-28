
=== 26/10/2021

== ELTEC-FRA-GYP

- adresse du fac-similé

https://gallica.bnf.fr/ark:/12148/bpt6k96916946/f11.highres
https://gallica.bnf.fr/iiif/ark:/12148/bpt6k96916946/f196/full/full/0/native.jpg

https://gallica.bnf.fr/iiif/ark:/12148/bpt6k3238359/f196/full/full/0/native.jpg
https://gallica.bnf.fr/ark:/12148/bpt6k323836p/f23

- cible pour la première page

  <text>
    <front>
      <div type="liminal">
        <pb facs="https://gallica.bnf.fr/iiif/ark:/12148/bpt6k96916946/f10/full/full/0/native.jpg"/>
        <p>
          <hi>Photographies par M. PAUL SESCAU,</hi> Paris</p>
        <p>Droits de traduction et de reproduction réservés pour tous les</p>

- création des pb@facs avec NumberElement
	elementName=pb, debug=false, valuePrefix=https://gallica.bnf.fr/iiif/ark:/12148/bpt6k96916946/f, elementAttribute=facs, valueSuffix=/full/full/0/native.jpg, outputDirectory=/home/sheiden/git/ELTeC-fra/txm/src/ELTEC-FRA/gyp/out, inputDirectory=/home/sheiden/git/ELTeC-fra/txm/src/ELTEC-FRA/gyp, countStart=10

- ajout de plusieurs <pb/>

        <p>8891-97. – CORBEIL, Imprimerie ÉD. CRÉTÉ.</p>
      </div>
      <div type="titlepage">
      	<pb/>
        <p><hi>Collection</hi></p>
        <p><hi>Excelsior</hi></p>
        
        <gap unit="graphic" n="images/PAG_00000015_IL000001.jpg"/>
        <pb/>
        <gap unit="graphic" n="images/PAG_00000016_IL000001.jpg"/>
        <pb/>
      </div>
    </front>

etc.

- ajout d'une illustration exemple par région IIIF

https://gallica.bnf.fr/iiif/ark:/12148/bpt6k96916946/f11/100,724,740,980/280,/0/native.jpg

- références

  - balises utilisées

	FRA06501_Gyp.xml	TOTAL
p	2326	2326
pb	249	249
gap	95	95
hi	26	26
div	19	19
head	16	16
ref	6	6
date	4	4
change	4	4
publisher	4	4
title	3	3
bibl	3	3
respStmt	2	2
pubPlace	2	2
resp	2	2
author	2	2
measure	2	2
name	2	2
...	1	1
TOTAL	5588	5588

<div type="chapter">

== ELTEC-FRA

- structures

grep -h '<div ' *.xml|sed -e 's/  */ /g' | sort|uniq -c

      1  <div type="chapter"/>
   2677  <div type="chapter">
    102  <div type="group">
      1  <div type="group" n="10: La nouvelle journée (1912)">
      1  <div type="group" n="1: L'aube (1904)">
      1  <div type="group" n="2: Le matin (1904)">
      1  <div type="group" n="3: L'adolescent (1904)">
      1  <div type="group" n="4: La révolte (1905)">
      1  <div type="group" n="5: La foire sur la place (1908)">
      1  <div type="group" n="6: Antoinette (1908)">
      1  <div type="group" n="7: Dans la maison (1908)">
      1  <div type="group" n="8: Les amies (1910)">
      1  <div type="group" n="9: Le buisson ardent (1911)">
    169  <div type="letter">
      8  <div type="liminal"/>
     48  <div type="liminal">
      1  <div type="liminal" n="tome 10">
      1  <div type="liminal" n="tome 6">
      2  <div type="liminal" n="tome 7">
     11  <div type="notes"/>
     37  <div type="notes">
     36  <div type="titlepage">


