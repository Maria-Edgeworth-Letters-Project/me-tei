# Open Refine Template for Placeography Creation


## Template

#### Prefix

```
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
	schematypens="http://purl.oclc.org/dsdl/schematron"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title>Maria Edgeworth Letters Project Personography</title>
                <author>Meredith Hale</author>
                <sponsor>Wake Forest University, University of Tennessee, Xavier University, Texas
                    A&amp;M University</sponsor>
                <respStmt>
                    <resp>Contributors include:</resp>
                    <persName>Jessica Richard</persName>
                    <persName>Hilary Havens</persName>
                    <persName>Robin Runia</persName>
                    <persName>Susan Egenolf</persName>
                    <persName>Eliza Wilcox</persName>
                    <persName>Jamie Kramer</persName>
                </respStmt>
            </titleStmt>
            <publicationStmt>
                <authority>Maria Edgeworth Letters Project</authority>
                <availability>
                    <licence>Distributed under a Creative Commons Attribution-ShareAlike 3.0
                        Unported License</licence>
                </availability>
            </publicationStmt>
            <sourceDesc>
                <p>Place names and coordinates were established using Geonames. In a few cases, coordinates and names for historic places relied on other sources.</p>
            </sourceDesc>
        </fileDesc>
    </teiHeader>
    <text>
        <body>
            <p>This is a placeography that defines places associated with the Maria Edgeworth
                Letters project.</p>
            <listPlace>
                
  
```
####Body

```  
{{if(isBlank(cells['ID'].value), '', '<place xml:id="' + cells['ID'].value + '">' + '<placeName>' + cells['Place Name'].value + '</placeName>' + if(isBlank(cells[' + if(isBlank(cells['coordinates'].value), '', '<location><geo>' + cells['coordinates'].value + '</geo></location>')+ if(isBlank(cells['Geonames URI'].value), '', '<idno type="URI">' + cells['Geonames URI'].value + '</idno>') + '</place>')}}

```

#### Suffix

```
		     </listPlace>
        </body>
    </text>
</TEI>

```