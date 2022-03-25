
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

== 14/03/2022

- 100 TEI, text, body, etc.

- div

   1374         <div type="chapter">
      1       <div type="chapter"/>
   1303       <div type="chapter">
    102       <div type="group">
      1       <div type="group" n="10: La nouvelle journée (1912)">
      1       <div type="group" n="1: L'aube (1904)">
      1       <div type="group" n="2: Le matin (1904)">
      1       <div type="group" n="3: L'adolescent (1904)">
      1       <div type="group" n="4: La révolte (1905)">
      1       <div type="group" n="5: La foire sur la place (1908)">
      1       <div type="group" n="6: Antoinette (1908)">
      1       <div type="group" n="7: Dans la maison (1908)">
      1       <div type="group" n="8: Les amies (1910)">
      1       <div type="group" n="9: Le buisson ardent (1911)">
     16         <div type="letter">
    153       <div type="letter">
      1         <div type="liminal">
      8       <div type="liminal"/>
     47       <div type="liminal">
      1       <div type="liminal" n="tome 10">
      1       <div type="liminal" n="tome 6">
      2       <div type="liminal" n="tome 7">
     11       <div type="notes"/>
     37       <div type="notes">
     36       <div type="titlepage">

FRA00101_Adam.xml:      <div type="chapter">
FRA00101_Adam.xml-
FRA00101_Adam.xml-        <head>XIII</head>

RA00102_Adam.xml:      <div type="letter">
FRA00102_Adam.xml-
FRA00102_Adam.xml-        <head>GARDANNE À MADAME DE NOVES</head>

FRA00301_Aimard.xml:      <div type="group">
FRA00301_Aimard.xml-
FRA00301_Aimard.xml-        <head>Première partie -- Le Cœur-Loyal</head>

- milestone

<milestone unit="section" type="asterisk"/>

- ref

<ref target="#FRA06201_N40"/> les prêtres, du haut de la chaire, excitaient les peuples des villes et des campagnes.
<note xml:id="FRA06201_N40"> Pus Ventedorn, e Comborn e Segur E Torrena,
[notes de fin ouvrage :
    <back>
      <div type="notes">]

- pb

grep -c '<pb' *.xml|grep -v :0
FRA02001_Gilbert.xml:1
FRA03201_Blandy.xml:263
FRA06501_Gyp.xml:235


- label : speaker type (in sp)

FRA02202_Gouraud.xml
FRA03702_Sand.xml

        <p>
          <label>LA MÈRE</label>
        </p>
        <p>Je dirais, mon cher enfant, que ce n'est pas à ton âge qu'on va courir les mondes. Je te permets d'aller jusqu'à Strasbourg, si ça te fait plaisir.</p>

- gap

grep -c '<gap' *.xml|grep -v :0
FRA00401_Allais.xml:8
FRA00701_Carraud.xml:8
FRA01302_Flaubert.xml:14	->            <gap/> se déroule au-dessus d'une porte vitrée qui
FRA02701_Maupassant.xml:4
FRA03201_Blandy.xml:28
FRA04701_Bourget.xml:13
FRA05101_Eekhoud.xml:1
FRA05301_Galopin.xml:1
FRA05401_Kock.xml:1
FRA05702_Maquet.xml:35	-> <gap unit="figure" extent="1"/>
FRA06501_Gyp.xml:95	-> <gap unit="graphic" n="images/PAG_00000243_IL000001.jpg"/>

- corr

<corr>Fiévreusement</corr>
<corr>remerczment</corr>

- hi/emph

<hi> (mis en évidence) distingue un mot ou une expression comme graphiquement distincte du texte environnant, sans en donner la raison.
<emph> (mis en valeur) marque des mots ou des expressions qui sont accentués ou mis en valeur pour un motif linguistique ou rhétorique.

3066: <p>— Mon <hi>pauvre</hi> !
2134: <p>– Il te fallait du sang, ce soir, Jacques Ork ! <hi rend="italic">En voilà ! </hi>Et elle expire...</p>

79: <p>— Faites-<emph>nous</emph> libres une bonne fois,
22 : <p>— Ce ne peut être qu'<emph rend="italic">Elle</emph>, murmura-t-il.</p>

https://collab.its.virginia.edu/wiki/toolbox/Text%20Markup%20-%20Emphasis.html
hi -> Bold and italic are examples respectively of strong and weak emphasis

http://www.bvh.univ-tours.fr/XML-TEI/ManuelWeb/Manuel_TEI_BVH.html
<hi rend="it">

- synthèse

element	F	category	use

p	227463	struct	rendering
hi	6442	span	rendering
head	3295	rendering	reference
div	3103	struct	reference
milestone	844	rendering	
ref	791	link	rendering
pb	539	pagination	reference
change	530	header	
l	499	rendering	
date	337	header	
publisher	336	header	
title	296	header	
bibl	289	header	
author	272	header	
label	266	rendering	
quote	264	span	
name	256	header	
note	237	span	rendering
resp	230	header	
respStmt	230	header	
foreign	214	span	
gap	208	rendering	
emph	131	span	rendering
pubPlace	131	header	
corr	30	span	

- voir en annexe les extraits pour déterminer l'usage

== 16/3/2022

- 2-front
  - add-lb-after-l.xsl : line break
  - convert-pc-to-w-remove-c.xsl : pc -> w
  - detokenize-out-of-text.xsl : potential bug fix
  - div0123456todiv.xsl : potential bug fix
  - head2title.xsl : add div@title attribute
  - n2nAlpha.xsl : number chapter and letter with '0' prefixed integers
  - number-elements.xsl: add @tn to all elements
  - post-nAlpha-embed-div-in-divtype.xsl : div@type=chapter -> chapter, etc.
  - render-hi-in-italic.xsl : hi -> hi@rend="i"

- 3-posttok
  - 1-txm-posttok-addRef
  
  text@id, §#chapter or @#letter or titlepage|liminal|notes, p.#pb@n

xmlstarlet sel -N tei="http://www.tei-c.org/ns/1.0" -t -m "//tei:div" -v "concat(name(),'@', @*)" -n *.xml| sed -e 's/ xmlns="http:\/\/www.tei-c.org\/ns\/1.0"//g'| sed -e 's/ xmlns:xi="http:\/\/www.w3.org\/2001\/XInclude"//g'|sort|uniq -c

     72 div@chapter
     10 div@group
      3 div@liminal
      1 div@notes
      1 div@titlepage

   2605 div@chapter
    102 div@group
     28 div@letter
     56 div@liminal
     47 div@notes
     34 div@titlepage

- validation XML

  xmlstarlet val -w -e post-nAlpha-embed-div-in-divtype.xsl

== 24/3/2022

- définition du format du nom de fichier ? FRA07601_Leroux.xml
  - FRA : la langue
  - 000 : le numéro d'auteur
  - 00 : le numéro de l'oeuvre de cet auteur

- eg FRA07601 = FRA + 076 + 01


