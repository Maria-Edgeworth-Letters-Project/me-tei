# Open Refine Template for Personography Creation


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
                    <persName>Katie Haire</persName>
                    <persName>Meredith Hale</persName>
                    <persName>Autumn Hall</persName>
                    <persName>Hilary Havens</persName>
                    <persName>Susan Egenolf</persName>
                    <persName>Lindsey Jones</persName>
                    <persName>Ivy Kiernan</persName>
                    <persName>Ziona Kocher</persName>
                    <persName>Jamie Kramer</persName>
                    <persName>Seolha Lee</persName>
                    <persName>Alexandra LaGrand</persName>
                    <persName>Savannah Payne</persName>
                    <persName>Jessica Richard</persName>
                    <persName>Robin Runia</persName>
                    <persName>Eliza Alexander Wilcox</persName>
                </respStmt>
            </titleStmt>
            <publicationStmt>
                <authority>Maria Edgeworth Letters Project</authority>
                <availability>
                    <licence target="https://creativecommons.org/licenses/by/4.0/">Distributed under a Creative Commons Attribution 4.0 (CC BY 4.0) Unported License</licence>
                </availability>
            </publicationStmt>
            <sourceDesc>
                <p>Personal names and identifiers are derived from the Virtal International Authority File (VIAF) and the Library of Congress Name Authority File
                (LCNAF).</p>
            </sourceDesc>
        </fileDesc>
    </teiHeader>
    <text>
        <body>
        <p>This is a personography that defines people associated with the Maria Edgeworth Letters project.</p>
            <listPerson>
                
  
```
####Body

```  
{{if(isBlank(cells['ID'].value), '', '<person xml:id="' + cells['ID'].value + '">' + '<persName>' + cells['Term'].value + '</persName>' + if(isBlank(cells['VIAF URI'].value), '', '<idno type="VIAF">' + cells['VIAF URI'].value + '</idno>') + '</person>')}}

```

#### Suffix

```
		     </listPerson>
        </body>
    </text>
</TEI>

```
