# Open Refine Template for Workography Creation


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
                <title>Maria Edgeworth Letters Project Workography</title>
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
                <p>The form of the titles shared are established by Wikidata or transcribed from the letters of Maria Edgeworth.</p>
            </sourceDesc>
        </fileDesc>
    </teiHeader>
    <text>
        <body>
            <p>This is a workography that defines literary works associated with the Maria Edgeworth
                Letters project.</p>
                <listBibl>
                
  
```
####Body

```  
{{if(isBlank(cells['ID'].value), '', '<bibl xml:id="' + cells['ID'].value + '">' + if(isBlank(cells['Title'].value), '', '<title>' + cells['Title'].value + '</title>')) + if(isBlank(cells['Foreign Title'].value), '', '<title><foreign>' + cells['Foreign Title'].value + '</foreign></title>') + if(isBlank(cells['URI'].value), '', '<idno>' + cells['URI'].value + '</idno>') + if(isBlank(cells['Author'].value), '', '<author><persName>' + cells['Author'].value + '</persName>' + if(isBlank(cells['Author VIAF URI'].value), '', '<idno type="VIAF">' + cells['Author VIAF URI'].value + '</idno>') + '</author>') + if(isBlank(cells['Collaborator'].value), '', '<author><persName>' + cells['Collaborator'].value + '</persName>' + if(isBlank(cells['Collaborator URI'].value), '', '<idno type="VIAF">' + cells['Collaborator URI'].value + '</idno>') + '</author>') + if(isBlank(cells['VIAF URI'].value), '', '<idno type="VIAF">' + cells['VIAF URI'].value + '</idno>') + '</bibl>'}}

```

#### Suffix

```
		     </listBibl>
        </body>
    </text>
</TEI>

```